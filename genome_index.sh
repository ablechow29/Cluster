#!/bin/bash
#SBATCH --time=02:00:00     # Time limit for the job (REQUIRED).
#SBATCH --job-name=genome_index    # Job name
#SBATCH --ntasks=16       # Number of cores for the job. Same as SBATCH -n 1
#SBATCH --partition=normal     # Partition/queue to run the job in. (REQUIRED)
#SBATCH -e slurm-%j.err  # Error file for this job.
#SBATCH -o slurm-%j.out  # Output file for this job.
#SBATCH --account=coa_cli242_uksr
#SBATCH --mail-type ALL         # Send email when job starts/ends
#SBATCH --mail-user alaine.hippee@uky.edu   # Where email is sent to (optional)

echo "Job $SLURM_JOB_ID running on SLURM NODELIST: $SLURM_NODELIST "
singularity run --app star279a /share/singularity/images/ccs/conda/amd-conda2-centos8.sinf STAR \
--runThreadN 16 --runMode genomeGenerate \
--genomeDir /$SCRATCH/Genome_index \
--genomeFastaFiles \
--sjdbDTFfile \
--sjdbOverhang 150
