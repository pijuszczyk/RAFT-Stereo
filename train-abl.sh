#!/bin/bash

#python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.0001 --train_iters 8 --lr 0.0001 --batch_size 1 --n_gru_layers 3 --n_downsample 2
#python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_F > a1-2F.txt
#python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_Q > a1-2Q.txt
#python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.0001 --train_iters 8 --lr 0.0001 --batch_size 1 --n_gru_layers 3 --n_downsample 2
#python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_F > a1-3F.txt
#python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --dataset middlebury_Q > a1-3Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.0001 --train_iters 8 --lr 0.0001 --batch_size 1 --n_gru_layers 1 --n_downsample 2
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --n_gru_layers 1 --n_downsample 2 --dataset middlebury_F > a2-1F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --n_gru_layers 1 --n_downsample 2 --dataset middlebury_Q > a2-1Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.0001 --train_iters 8 --lr 0.0001 --batch_size 1 --n_gru_layers 1 --n_downsample 2
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --n_gru_layers 1 --n_downsample 2 --dataset middlebury_F > a2-2F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --n_gru_layers 1 --n_downsample 2 --dataset middlebury_Q > a2-2Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.0001 --train_iters 8 --lr 0.0001 --batch_size 1 --n_gru_layers 1 --n_downsample 2
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --n_gru_layers 1 --n_downsample 2 --dataset middlebury_F > a2-3F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --n_gru_layers 1 --n_downsample 2 --dataset middlebury_Q > a2-3Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.0001 --train_iters 8 --lr 0.0001 --batch_size 1 --n_gru_layers 3 --shared_backbone --n_downsample 2
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --shared_backbone --n_downsample 2 --dataset middlebury_F > a3-1F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --shared_backbone --n_downsample 2 --dataset middlebury_Q > a3-1Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.0001 --train_iters 8 --lr 0.0001 --batch_size 1 --n_gru_layers 3 --shared_backbone --n_downsample 2
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --shared_backbone --n_downsample 2 --dataset middlebury_F > a3-2F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --shared_backbone --n_downsample 2 --dataset middlebury_Q > a3-2Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.0001 --train_iters 8 --lr 0.0001 --batch_size 1 --n_gru_layers 3 --shared_backbone --n_downsample 2
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --shared_backbone --n_downsample 2 --dataset middlebury_F > a3-3F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --shared_backbone --n_downsample 2 --dataset middlebury_Q > a3-3Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.0001 --train_iters 8 --lr 0.0001 --batch_size 1 --n_gru_layers 3 --n_downsample 3
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --n_gru_layers 3 --n_downsample 3 --dataset middlebury_F > a4-1F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --n_gru_layers 3 --n_downsample 3 --dataset middlebury_Q > a4-1Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.0001 --train_iters 8 --lr 0.0001 --batch_size 1 --n_gru_layers 3 --n_downsample 3
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --n_gru_layers 3 --n_downsample 3 --dataset middlebury_F > a4-2F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --n_gru_layers 3 --n_downsample 3 --dataset middlebury_Q > a4-2Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.0001 --train_iters 8 --lr 0.0001 --batch_size 1 --n_gru_layers 3 --n_downsample 3
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --n_gru_layers 3 --n_downsample 3 --dataset middlebury_F > a4-3F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --n_gru_layers 3 --n_downsample 3 --dataset middlebury_Q > a4-3Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.0001 --train_iters 8 --lr 0.0001 --batch_size 1 --n_gru_layers 3 --n_downsample 2 --slow_fast_gru
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --n_gru_layers 3 --n_downsample 2 --slow_fast_gru --dataset middlebury_F > a5-1F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --n_gru_layers 3 --n_downsample 2 --slow_fast_gru --dataset middlebury_Q > a5-1Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.0001 --train_iters 8 --lr 0.0001 --batch_size 1 --n_gru_layers 3 --n_downsample 2 --slow_fast_gru
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --n_gru_layers 3 --n_downsample 2 --slow_fast_gru --dataset middlebury_F > a5-2F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --n_gru_layers 3 --n_downsample 2 --slow_fast_gru --dataset middlebury_Q > a5-2Q.txt
python3 train_stereo.py --train_datasets middlebury_H --num_steps 1000 --wdecay 0.0001 --train_iters 8 --lr 0.0001 --batch_size 1 --n_gru_layers 3 --n_downsample 2 --slow_fast_gru
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --n_gru_layers 3 --n_downsample 2 --slow_fast_gru --dataset middlebury_F > a5-3F.txt
python3 evaluate_stereo.py --restore_ckpt checkpoints/raft-stereo.pth --n_gru_layers 3 --n_downsample 2 --slow_fast_gru --dataset middlebury_Q > a5-3Q.txt
