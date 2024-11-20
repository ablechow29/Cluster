#!/bin/bash
#SBATCH --time=01:00:00             # Time limit for the job (REQUIRED).
#SBATCH --job-name=Download_SRA_NCBI # Job name
#SBATCH --ntasks=1                  # Number of cores for the job. Same as SBATCH -n 1
#SBATCH --partition=normal          # Partition/queue to run the job in. (REQUIRED)
#SBATCH -e slurm-%j.err             # Error file for this job.
#SBATCH -o slurm-%j.out             # Output file for this job.
#SBATCH -A coa_cli242_uksr          # Project allocation account name (REQUIRED)


singularity run --app prefetch SRR11180057 -O /home/ach399/SRA
# singularity run --app prefetch --option-file fetched.txt

