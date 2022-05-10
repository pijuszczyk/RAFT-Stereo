#!/bin/bash

python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.000001 --train_iters 8 --lr 0.002 --batch_size 1
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_H > e2H.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_F > e2F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_Q > e2Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.000001 --train_iters 12 --lr 0.0002 --batch_size 3
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_H > e3H.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_F > e3F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_Q > e3Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.0001 --train_iters 8 --lr 0.0001 --batch_size 1
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_H > e4H.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_F > e4F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_Q > e4Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.0001 --train_iters 16 --lr 0.002 --batch_size 2
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_H > e5H.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_F > e5F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_Q > e5Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.000001 --train_iters 16 --lr 0.001 --batch_size 3
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_H > e6H.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_F > e6F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_Q > e6Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.00001 --train_iters 8 --lr 0.00002 --batch_size 2
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_H > e7H.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_F > e7F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_Q > e7Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.00001 --train_iters 8 --lr 0.0001 --batch_size 1
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_H > e8H.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_F > e8F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_Q > e8Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.00001 --train_iters 8 --lr 0.002 --batch_size 1
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_H > e9H.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_F > e9F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_Q > e9Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.0001 --train_iters 8 --lr 0.00002 --batch_size 1
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_H > e10H.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_F > e10F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_Q > e10Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.000001 --train_iters 12 --lr 0.0001 --batch_size 2
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_H > e11H.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_F > e11F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_Q > e11Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.0001 --train_iters 16 --lr 0.00002 --batch_size 2
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_H > e12H.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_F > e12F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_Q > e12Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.00001 --train_iters 16 --lr 0.001 --batch_size 3
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_H > e13H.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_F > e13F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_Q > e13Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.000001 --train_iters 12 --lr 0.00002 --batch_size 1
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_H > e14H.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_F > e14F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_Q > e14Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.000001 --train_iters 16 --lr 0.00002 --batch_size 3
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_H > e15H.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_F > e15F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_Q > e15Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.000001 --train_iters 12 --lr 0.0002 --batch_size 2
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_H > e16H.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_F > e16F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_Q > e16Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.00001 --train_iters 12 --lr 0.0001 --batch_size 3
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_H > e17H.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_F > e17F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_Q > e17Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.000001 --train_iters 12 --lr 0.00002 --batch_size 3
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_H > e18H.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_F > e18F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_Q > e18Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.00001 --train_iters 16 --lr 0.0001 --batch_size 1
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_H > e19H.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_F > e19F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_Q > e19Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.000001 --train_iters 16 --lr 0.001 --batch_size 1
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_H > e20H.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_F > e20F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_Q > e20Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.00001 --train_iters 16 --lr 0.00002 --batch_size 2
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_H > e21H.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_F > e21F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_Q > e21Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.000001 --train_iters 8 --lr 0.00002 --batch_size 3
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_H > e22H.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_F > e22F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_Q > e22Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.0001 --train_iters 12 --lr 0.0001 --batch_size 2
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_H > e23H.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_F > e23F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_Q > e23Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.000001 --train_iters 16 --lr 0.001 --batch_size 2
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_H > e24H.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_F > e24F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_Q > e24Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.00001 --train_iters 8 --lr 0.0001 --batch_size 2
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_H > e25H.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_F > e25F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_Q > e25Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.0001 --train_iters 8 --lr 0.00002 --batch_size 3
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_H > e26H.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_F > e26F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_Q > e26Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.00001 --train_iters 8 --lr 0.00002 --batch_size 3
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_H > e27H.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_F > e27F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_Q > e27Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.0001 --train_iters 12 --lr 0.00002 --batch_size 1
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_H > e28H.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_F > e28F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_Q > e28Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.00001 --train_iters 8 --lr 0.002 --batch_size 3
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_H > e29H.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_F > e29F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_Q > e29Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.000001 --train_iters 8 --lr 0.001 --batch_size 3
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_H > e30H.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_F > e30F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_Q > e30Q.txt
