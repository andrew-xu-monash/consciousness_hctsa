#!/bin/bash
# Set name of job shown in squeue
#SBATCH --job-name k_a_hctsa_parallel
# Set project code account
#SBATCH --account=qb48
# Request CPU resources
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=18
# Memory usage (MB)
#SBATCH --mem-per-cpu=8192
# Set your minimum acceptable walltime, format: day-hours:minutes:seconds
#SBATCH --time=3-00:00:00
# Email user if job fails or ends
#SBATCH --mail-type=FAIL
#SBATCH --mail-type=END
#SBATCH --mail-user=dxuu0007@student.monash.edu
# Specify a queue (called a partition on SLURM)
#SBATCH --partition=comp

# Set environment variables to run Matlab
module purge
module load matlab/r2021a

# Show the host on which the job ran
hostname

# Show what SLURM ennvironment variables our environment has
env | grep SLURM

# Launch the Matlab job
matlab -nodisplay -r "disp(pwd); HCTSA_Runscript; exit"
