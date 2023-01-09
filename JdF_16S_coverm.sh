#PBS -N JdF_coverm
#PBS -q normal
#PBS -M jmunson-mcgee@bigelow.org
#PBS -m bea
#PBS -l ncpus=190,mem=1000GB,walltime=6:00:00
#PBS -o /mnt/scgc/simon/microg2p/analyses/JdF_analysis/sh_files/out
#PBS -e /mnt/scgc/simon/microg2p/analyses/JdF_analysis/sh_files/error

module unload anaconda
module use /mod/scgc/
module load anaconda3
source activate coverm

#Change this path to whatever file you run it from.
cd /mnt/scgc/simon/microg2p/JdF_analysis/sh_files


# Modify the -d (contigs) and the -c(metagenomes) flags and this command should work for coverm (-x) is for the genomes not the metagenomes

TMPDIR=/mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/16S_coverm/tmp coverm genome -d /mnt/scgc/simon/microg2p/JdF_analysis/Data/JdF_SSUs --single /mnt/scgc/simon/microg2p/JdF_analysis/Data/JdF_metatranscriptomic_reads/Merged_reads/*.fastq.gz -x fasta --min-read-percent-identity 95 --min-read-aligned-percent 50 -t 190 -m reads_per_base --output-file /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/16S_coverm/JdF_RNA_to_16S_reads_per_base.tsv --min-covered-fraction 0 
TMPDIR=/mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/16S_coverm/tmp coverm genome -d /mnt/scgc/simon/microg2p/JdF_analysis/Data/JdF_SSUs --single /mnt/scgc/simon/microg2p/JdF_analysis/Data/JdF_metatranscriptomic_reads/Merged_reads/*.fastq.gz -x fasta --min-read-percent-identity 95 --min-read-aligned-percent 50 -t 190 -m relative_abundance --output-file /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/16S_coverm/JdF_RNA_to_16S_relative_abundance.tsv --min-covered-fraction 0 
