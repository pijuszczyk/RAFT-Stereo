import torch
import torch.nn as nn
import torch.nn.functional as F


def get_norm(norm_fn, out_channels, num_groups):
    if norm_fn == 'group':
        return nn.GroupNorm(num_groups=num_groups, num_channels=out_channels)
    elif norm_fn == 'batch':
        return nn.BatchNorm2d(out_channels)
    elif norm_fn == 'instance':
        return nn.InstanceNorm2d(out_channels)
    elif norm_fn == 'none':
        return nn.Sequential()
    else:
        raise RuntimeError("Invalid norm")


class ResidualBlock(nn.Module):
    def __init__(self, in_planes, planes, norm_fn='group', stride=1, expanse_ratio=None):
        super(ResidualBlock, self).__init__()
  
        self.conv1 = nn.Conv2d(in_planes, planes, kernel_size=3, padding=1, stride=stride)
        self.conv2 = nn.Conv2d(planes, planes, kernel_size=3, padding=1)
        self.relu = nn.ReLU(inplace=True)

        num_groups = planes // 8

        self.norm1 = get_norm(norm_fn, planes, num_groups)
        self.norm2 = get_norm(norm_fn, planes, num_groups)
        if not (stride == 1 and in_planes == planes):
            self.norm3 = get_norm(norm_fn, planes, num_groups)

        if stride == 1 and in_planes == planes:
            self.downsample = None
        
        else:    
            self.downsample = nn.Sequential(
                nn.Conv2d(in_planes, planes, kernel_size=1, stride=stride), self.norm3)


    def forward(self, x):
        y = x
        y = self.conv1(y)
        y = self.norm1(y)
        y = self.relu(y)
        y = self.conv2(y)
        y = self.norm2(y)
        y = self.relu(y)

        if self.downsample is not None:
            x = self.downsample(x)

        return self.relu(x+y)


# Adapted from mobilestereonet/models/submodule.py
def convbn(in_channels, out_channels, kernel_size, norm_fn, stride):

    return nn.Sequential(
        nn.Conv2d(in_channels, out_channels, kernel_size=kernel_size, stride=stride, bias=False),
        get_norm(norm_fn, out_channels, 1)
    )


def convbn_dws(inp, oup, kernel_size, norm_fn, stride, second_relu=True):
    if second_relu:
        return nn.Sequential(
            # dw
            nn.Conv2d(inp, inp, kernel_size=kernel_size, stride=stride, groups=inp, padding=1, bias=False),
            get_norm(norm_fn, inp, 1),
            nn.ReLU6(inplace=True),
            # pw
            nn.Conv2d(inp, oup, 1, 1, 0, bias=False),
            get_norm(norm_fn, oup, 1),
            nn.ReLU6(inplace=False)
            )
    else:
        return nn.Sequential(
            # dw
            nn.Conv2d(inp, inp, kernel_size=kernel_size, stride=stride, groups=inp, padding=1, bias=False),
            get_norm(norm_fn, inp, 1),
            nn.ReLU6(inplace=True),
            # pw
            nn.Conv2d(inp, oup, 1, 1, 0, bias=False),
            get_norm(norm_fn, oup, 1)
            )


class MobileV1_Residual(nn.Module):
    expansion = 1

    def __init__(self, inplanes, planes, norm_fn='group', stride=1, expanse_ratio=None):
        super(MobileV1_Residual, self).__init__()

        self.stride = stride
        self.conv1 = convbn_dws(inplanes, planes, 3, norm_fn, stride)
        self.conv2 = convbn_dws(planes, planes, 3, norm_fn, 1, second_relu=False)

        self.downsample = None
        if stride != 1 or inplanes != planes:
            self.downsample = nn.Sequential(
                nn.Conv2d(inplanes, planes, kernel_size=1, stride=stride, bias=False),
                get_norm(norm_fn, planes, 1)
            )

    def forward(self, x):
        out = self.conv1(x)
        out = self.conv2(out)

        if self.downsample is not None:
            x = self.downsample(x)

        out += x

        return out


class MobileV2_Residual(nn.Module):
    def __init__(self, inp, oup, norm_fn='group', stride=1, expanse_ratio=1):
        super(MobileV2_Residual, self).__init__()
        self.stride = stride
        assert stride in [1, 2]

        hidden_dim = int(inp * expanse_ratio)
        self.use_res_connect = self.stride == 1 and inp == oup

        if expanse_ratio == 1:
            self.conv = nn.Sequential(
                # dw
                nn.Conv2d(hidden_dim, hidden_dim, 3, stride, 1, groups=hidden_dim, bias=False),
                get_norm(norm_fn, hidden_dim, 1),
                nn.ReLU6(inplace=True),
                # pw-linear
                nn.Conv2d(hidden_dim, oup, 1, 1, 0, bias=False),
                get_norm(norm_fn, oup, 1),
            )
        else:
            self.conv = nn.Sequential(
                # pw
                nn.Conv2d(inp, hidden_dim, 1, 1, 0, bias=False),
                get_norm(norm_fn, hidden_dim, 1),
                nn.ReLU6(inplace=True),
                # dw
                nn.Conv2d(hidden_dim, hidden_dim, 3, stride, 1, groups=hidden_dim, bias=False),
                get_norm(norm_fn, hidden_dim, 1),
                nn.ReLU6(inplace=True),
                # pw-linear
                nn.Conv2d(hidden_dim, oup, 1, 1, 0, bias=False),
                get_norm(norm_fn, oup, 1),
            )

    def forward(self, x):
        if self.use_res_connect:
            return x + self.conv(x)
        else:
            return self.conv(x)


class BottleneckBlock(nn.Module):
    def __init__(self, in_planes, planes, norm_fn='group', stride=1):
        super(BottleneckBlock, self).__init__()
  
        self.conv1 = nn.Conv2d(in_planes, planes//4, kernel_size=1, padding=0)
        self.conv2 = nn.Conv2d(planes//4, planes//4, kernel_size=3, padding=1, stride=stride)
        self.conv3 = nn.Conv2d(planes//4, planes, kernel_size=1, padding=0)
        self.relu = nn.ReLU(inplace=True)

        num_groups = planes // 8

        self.norm1 = get_norm(norm_fn, planes//4, num_groups)
        self.norm2 = get_norm(norm_fn, planes//4, num_groups)
        self.norm3 = get_norm(norm_fn, planes, num_groups)
        if not stride == 1:
            self.norm4 = get_norm(norm_fn, planes, num_groups)

        if stride == 1:
            self.downsample = None
        
        else:    
            self.downsample = nn.Sequential(
                nn.Conv2d(in_planes, planes, kernel_size=1, stride=stride), self.norm4)


    def forward(self, x):
        y = x
        y = self.relu(self.norm1(self.conv1(y)))
        y = self.relu(self.norm2(self.conv2(y)))
        y = self.relu(self.norm3(self.conv3(y)))

        if self.downsample is not None:
            x = self.downsample(x)

        return self.relu(x+y)


def get_res_block_type(res_block_name):
    if res_block_name == 'original':
        return ResidualBlock
    elif res_block_name == 'mobilenet_v1':
        return MobileV1_Residual
    elif res_block_name == 'mobilenet_v2':
        return MobileV2_Residual
    else:
        raise RuntimeError('Invalid residual block name')


class BasicEncoder(nn.Module):
    def __init__(self, output_dim=128, norm_fn='batch', dropout=0.0, downsample=3, res_block_name='original', expanse_ratio=1):
        super(BasicEncoder, self).__init__()
        self.norm_fn = norm_fn
        self.downsample = downsample

        if self.norm_fn == 'group':
            self.norm1 = nn.GroupNorm(num_groups=8, num_channels=64)
            
        elif self.norm_fn == 'batch':
            self.norm1 = nn.BatchNorm2d(64)

        elif self.norm_fn == 'instance':
            self.norm1 = nn.InstanceNorm2d(64)

        elif self.norm_fn == 'none':
            self.norm1 = nn.Sequential()

        self.conv1 = nn.Conv2d(3, 64, kernel_size=7, stride=1 + (downsample > 2), padding=3)
        self.relu1 = nn.ReLU(inplace=True)

        self.in_planes = 64
        self.res_block_type = get_res_block_type(res_block_name)
        self.expanse_ratio = expanse_ratio
        self.layer1 = self._make_layer(64, 1)
        self.layer2 = self._make_layer(96, 1 + (downsample > 1))
        self.layer3 = self._make_layer(128, 1 + (downsample > 0))

        # output convolution
        self.conv2 = nn.Conv2d(128, output_dim, kernel_size=1)

        self.dropout = None
        if dropout > 0:
            self.dropout = nn.Dropout2d(p=dropout)

        for m in self.modules():
            if isinstance(m, nn.Conv2d):
                nn.init.kaiming_normal_(m.weight, mode='fan_out', nonlinearity='relu')
            elif isinstance(m, (nn.BatchNorm2d, nn.InstanceNorm2d, nn.GroupNorm)):
                if m.weight is not None:
                    nn.init.constant_(m.weight, 1)
                if m.bias is not None:
                    nn.init.constant_(m.bias, 0)

    def _make_layer(self, dim, stride=1):
        layer1 = self.res_block_type(self.in_planes, dim, self.norm_fn, stride=stride, expanse_ratio=self.expanse_ratio)
        layer2 = self.res_block_type(dim, dim, self.norm_fn, stride=1, expanse_ratio=self.expanse_ratio)
        layers = (layer1, layer2)
        
        self.in_planes = dim
        return nn.Sequential(*layers)


    def forward(self, x, dual_inp=False):

        # if input is list, combine batch dimension
        is_list = isinstance(x, tuple) or isinstance(x, list)
        if is_list:
            batch_dim = x[0].shape[0]
            x = torch.cat(x, dim=0)

        x = self.conv1(x)
        x = self.norm1(x)
        x = self.relu1(x)

        x = self.layer1(x)
        x = self.layer2(x)
        x = self.layer3(x)

        x = self.conv2(x)

        if self.training and self.dropout is not None:
            x = self.dropout(x)

        if is_list:
            x = x.split(split_size=batch_dim, dim=0)

        return x


class MultiBasicEncoder(nn.Module):
    def __init__(self, output_dim=[128], norm_fn='batch', dropout=0.0, downsample=3, res_block_name='original', expanse_ratio=1):
        super(MultiBasicEncoder, self).__init__()
        self.norm_fn = norm_fn
        self.downsample = downsample

        if self.norm_fn == 'group':
            self.norm1 = nn.GroupNorm(num_groups=8, num_channels=64)

        elif self.norm_fn == 'batch':
            self.norm1 = nn.BatchNorm2d(64)

        elif self.norm_fn == 'instance':
            self.norm1 = nn.InstanceNorm2d(64)

        elif self.norm_fn == 'none':
            self.norm1 = nn.Sequential()

        self.conv1 = nn.Conv2d(3, 64, kernel_size=7, stride=1 + (downsample > 2), padding=3)
        self.relu1 = nn.ReLU(inplace=True)

        self.in_planes = 64
        self.res_block_type = get_res_block_type(res_block_name)
        self.expanse_ratio = expanse_ratio
        self.layer1 = self._make_layer(64, 1)
        self.layer2 = self._make_layer(96, 1 + (downsample > 1))
        self.layer3 = self._make_layer(128, 1 + (downsample > 0))
        self.layer4 = self._make_layer(128, 2)
        self.layer5 = self._make_layer(128, 2)

        output_list = []
        for dim in output_dim:
            conv_out = nn.Sequential(
                self.res_block_type(128, 128, self.norm_fn, stride=1, expanse_ratio=expanse_ratio),
                nn.Conv2d(128, dim[2], 3, padding=1))
            output_list.append(conv_out)

        self.outputs08 = nn.ModuleList(output_list)

        output_list = []
        for dim in output_dim:
            conv_out = nn.Sequential(
                self.res_block_type(128, 128, self.norm_fn, stride=1, expanse_ratio=expanse_ratio),
                nn.Conv2d(128, dim[1], 3, padding=1))
            output_list.append(conv_out)

        self.outputs16 = nn.ModuleList(output_list)

        output_list = []
        for dim in output_dim:
            conv_out = nn.Conv2d(128, dim[0], 3, padding=1)
            output_list.append(conv_out)

        self.outputs32 = nn.ModuleList(output_list)

        if dropout > 0:
            self.dropout = nn.Dropout2d(p=dropout)
        else:
            self.dropout = None

        for m in self.modules():
            if isinstance(m, nn.Conv2d):
                nn.init.kaiming_normal_(m.weight, mode='fan_out', nonlinearity='relu')
            elif isinstance(m, (nn.BatchNorm2d, nn.InstanceNorm2d, nn.GroupNorm)):
                if m.weight is not None:
                    nn.init.constant_(m.weight, 1)
                if m.bias is not None:
                    nn.init.constant_(m.bias, 0)

    def _make_layer(self, dim, stride=1):
        layer1 = self.res_block_type(self.in_planes, dim, self.norm_fn, stride=stride, expanse_ratio=self.expanse_ratio)
        layer2 = self.res_block_type(dim, dim, self.norm_fn, stride=1, expanse_ratio=self.expanse_ratio)
        layers = (layer1, layer2)

        self.in_planes = dim
        return nn.Sequential(*layers)

    def forward(self, x, dual_inp=False, num_layers=3):

        x = self.conv1(x)
        x = self.norm1(x)
        x = self.relu1(x)

        x = self.layer1(x)
        x = self.layer2(x)
        x = self.layer3(x)
        if dual_inp:
            v = x
            x = x[:(x.shape[0]//2)]

        outputs08 = [f(x) for f in self.outputs08]
        if num_layers == 1:
            return (outputs08, v) if dual_inp else (outputs08,)

        y = self.layer4(x)
        outputs16 = [f(y) for f in self.outputs16]

        if num_layers == 2:
            return (outputs08, outputs16, v) if dual_inp else (outputs08, outputs16)

        z = self.layer5(y)
        outputs32 = [f(z) for f in self.outputs32]

        return (outputs08, outputs16, outputs32, v) if dual_inp else (outputs08, outputs16, outputs32)
