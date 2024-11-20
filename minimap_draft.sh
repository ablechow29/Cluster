#!/bin/bash
#SBATCH --time=00:30:00             # Time limit for the job (REQUIRED).
#SBATCH --job-name=Map_Short_Read      # Job name
#SBATCH --ntasks=1                  # Number of cores for the job. Same as SBATCH -n 1
#SBATCH --partition=normal          # Partition/queue to run the job in. (REQUIRED)
#SBATCH -e slurm-%j.err             # Error file for this job.
#SBATCH -o slurm-%j.out             # Output file for this job.
#SBATCH -A <your project account>     # Project allocation account name (REQUIRED)

#echo "Job $SLURM_JOB_ID running on SLURM NODELIST: $SLURM_NODELIST "
#singularity run --app 

# need to write the following as a function
singularity run --app minimap2 -ax sr "$1" "$2" | # mapping variable 1 (sequence) to variable 2 (reference)
singularity run --app samtools view -S -h -b -q 25 -f 3 | # filter
singularity run --app samtools sort -o "$1".f.s.bam # sort
singularity run --app samtools index "$1".f.s.bam  # index the output file from the previous line

# implement the function as a for loop for my files

