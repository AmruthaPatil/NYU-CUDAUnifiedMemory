#!/bin/bash
#SBATCH --job-name=GPUVecAddUM
#SBATCH --output=%x.out
#SBATCH --cpus-per-task=4
#SBATCH --time=10:00:00
#SBATCH --mem=10GB
#SBATCH --gres=gpu:rtx8000:1

cd path/to/folder
export PATH=/usr/local/cuda/bin:$PATH
make clean
make 2>/dev/null
make GPUVecAddUM
nvprof ./GPUVecAddUM 1 1 1
nvprof ./GPUVecAddUM 1 1 5
nvprof ./GPUVecAddUM 1 1 10
nvprof ./GPUVecAddUM 1 1 50
nvprof ./GPUVecAddUM 1 1 100
nvprof ./GPUVecAddUM 1 256 1
nvprof ./GPUVecAddUM 1 256 5
nvprof ./GPUVecAddUM 1 256 10
nvprof ./GPUVecAddUM 1 256 50
nvprof ./GPUVecAddUM 1 256 100
nvprof ./GPUVecAddUM 16 256 1
nvprof ./GPUVecAddUM 16 256 5
nvprof ./GPUVecAddUM 16 256 10
nvprof ./GPUVecAddUM 16 256 50
nvprof ./GPUVecAddUM 16 256 100

