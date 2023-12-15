#!/bin/bash
#SBATCH--nodes=1
#SBATCH--ntasks-per-node=1
#SBATCH--cpus-per-task=8
#SBATCH--time=40:00:00
#SBATCH--mem=128GB
#SBATCH--gres=gpu
#SBATCH--job-name=96GB
module purge
singularity exec --nv\
    --overlay ffcv.ext3:ro\
    /scratch/work/public/singularity/cuda11.7.99-cudnn8.5-devel-ubuntu22.04.2.sif\
    /bin/bash -c "source /ext3/env.sh; \
     conda activate ffcv; \
     cd /scratch/zd2260/bn-false_ls-true;\
python smacb.py $RANDOM"

