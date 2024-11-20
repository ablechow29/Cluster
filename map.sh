#!/bin/bash
#SBATCH --time=02:00:00     # Time limit for the job (REQUIRED).
#SBATCH --job-name=map1    # Job name
#SBATCH --ntasks=8       # Number of cores for the job. Same as SBATCH -n 1
#SBATCH --partition=normal     # Partition/queue to run the job in. (REQUIRED)
#SBATCH -e slurm-%j.err  # Error file for this job.
#SBATCH -o slurm-%j.out  # Output file for this job.
#SBATCH --account=coa_cli242_uksr
#SBATCH --mail-type ALL         # Send email when job starts/ends
#SBATCH --mail-user alaine.hippee@uky.edu   # Where email is sent to (optional)

echo "Job $SLURM_JOB_ID running on SLURM NODELIST: $SLURM_NODELIST "
singularity run --app star279a /share/singularity/images/ccs/conda/amd-conda2-centos8.sinf STAR \
--runThreadN 8 \
--genomeDir /scratch/achi240/genome_index \
--readFilesCommand zcat \
--readFilesIn /scratch/achi240/Trim/NL_v46_14A_B_1P.fastq.gz /scratch/achi240/Trim/NL_v46_14A_B_2P.fastq.gz \
--outFileNamePrefix /scratch/achi240/Mapped/NL_v46_14A_B \
--outReadsUnmapped Fastx \
--outSAMtype BAM SortedByCoordinate
