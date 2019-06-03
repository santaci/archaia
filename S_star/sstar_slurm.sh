#!/bin/bash

# This file is Sstar

#SBATCH --time=120:00:00
#SBATCH --array=1-22
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=10
#SBATCH --job-name=Sstar
#SBATCH --mail-type=ALL
#SBATCH --mail-user=cindy.santander@stx.ox.ac.uk

module load python/anaconda2/4.2.0

ch=$SLURM_ARRAY_TASK_ID

while read pop; do

echo "Chromosome ${ch} for ${pop}!"
#bash /data/zool-archaia/scro2664/SGDP_variants/sstar_pop/${pop}_sstar.sh $ch
bash /data/zool-archaia/scro2664/SGDP_variants/sstar_pop/byRegion_sstar.sh $ch $pop &

done < /data/zool-archaia/scro2664/SGDP_variants/regions.list

wait
