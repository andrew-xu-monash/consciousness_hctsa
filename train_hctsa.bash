#!/bin/bash
# Usage: sbatch slurm-serial-job-script
# Prepared By: Kai Xi,  Oct 2014
#              help@massive.org.au
# NOTE: To activate a SLURM option, remove the whitespace between the '#' and 'SBATCH'
# $1: line counter
# Need to use variables OUTSIDE of this script, #SBATCH doesn't support variables: https://help.rc.ufl.edu/doc/Using_Variables_in_SLURM_Jobs

#SBATCH --job-name=train_hctsa

# To set a project account for credit charging, 
#SBATCH --account=qb48

# Request CPU resource for a serial job
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
# SBATCH --exclusive
#SBATCH --cpus-per-task=1

# Memory usage (MB)
#SBATCH --mem-per-cpu=8000

# Set your minimum acceptable walltime, format: day-hours:minutes:seconds
#SBATCH --time=10:00:00
# SBATCH --qos=shortq
#SBATCH --partition=comp

# To receive an email when job completes or fails
#SBATCH --mail-user=dxuu0007@student.monash.edu
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

# Set the file for output (stdout)
#SBATCH --output=logs/%x.out

# Set the file for error log (stderr)
#SBATCH --error=logs/%x.err

# Use reserved node to run job when a node reservation is made for you already
# SBATCH --reservation=reservation_name

# Job script
module load matlab/r2021a
time matlab -nodisplay -nodesktop -r "addToolbox; hctsa_compute('HCTSA.mat'); exit"