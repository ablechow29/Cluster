#!/bin/bash
#SBATCH --time=00:15:00             # Time limit for the job (REQUIRED).
#SBATCH --job-name=my_test_job      # Job name
#SBATCH --ntasks=1                  # Number of cores for the job. Same as SBATCH -n 1
#SBATCH --partition=normal          # Partition/queue to run the job in. (REQUIRED)
#SBATCH -e slurm-%j.err             # Error file for this job.
#SBATCH -o slurm-%j.out             # Output file for this job.
#SBATCH -A <your project account>     # Project allocation account name (REQUIRED)

#echo "Job $SLURM_JOB_ID running on SLURM NODELIST: $SLURM_NODELIST "
#singularity run --app 

