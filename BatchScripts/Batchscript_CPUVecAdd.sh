#!/bin/bash
#SBATCH --job-name=CPUVecAdd
#SBATCH --output=%x.out
#SBATCH --cpus-per-task=4
#SBATCH --time=10:00:00
#SBATCH --mem=10GB
#SBATCH --gres=gpu:rtx8000:1

cd path/to/folder
make clean
make 2>/dev/null
make
./CPUVecAdd 1
./CPUVecAdd 5
./CPUVecAdd 10
./CPUVecAdd 50
./CPUVecAdd 100
