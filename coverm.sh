#PBS -N JdF_coverm
#PBS -q normal
#PBS -M jmunson-mcgee@bigelow.org
#PBS -m bea
#PBS -l ncpus=190,mem=1000GB,walltime=2:00:00
#PBS -o /mnt/scgc/simon/microg2p/analyses/JdF_analysis/sh_files/out
#PBS -e /mnt/scgc/simon/microg2p/analyses/JdF_analysis/sh_files/error

module unload anaconda
module use /mod/scgc/
module load anaconda3
source activate coverm

#Change this path to whatever file you run it from.
#cd /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/coverm


# Modify the -d (contigs) and the -c(metagenomes) flags and this command should work for coverm (-x) is for the genomes not the metagenomes

#coverm genome -d /mnt/scgc/simon/microg2p/analyses/JdF_analysis/Data/JdF_contigs/ --single /mnt/scgc/simon/microg2p/Data/DNA_seq/All_JdF_merged_metagenomes/10ammonium-A01_contfpe_bbmerge.fastq.gz -x fasta --min-read-percent-identity 95 --min-read-aligned-percent 50 -t 64  --output-file relative_abundance_recruitment/10_Amm_coverm_submission_DNA_recruit_to_all_g2p_marine_SAGs.tsv --min-covered-fraction 0 
#coverm genome -d /mnt/scgc/simon/microg2p/analyses/JdF_analysis/Data/JdF_contigs/ --single /mnt/scgc/simon/microg2p/Data/DNA_seq/All_JdF_merged_metagenomes/10nitrate-A01_contfpe_bbmerge.fastq.gz -x fasta --min-read-percent-identity 95 --min-read-aligned-percent 50 -t 64  --output-file relative_abundance_recruitment/10_Nit_coverm_submission_DNA_recruit_to_all_g2p_marine_SAGs.tsv --min-covered-fraction 0 
#coverm genome -d /mnt/scgc/simon/microg2p/analyses/JdF_analysis/Data/JdF_contigs/ --single /mnt/scgc/simon/microg2p/Data/DNA_seq/All_JdF_merged_metagenomes/10nosubstrate-A01_contfpe_bbmerge.fastq.gz -x fasta --min-read-percent-identity 95 --min-read-aligned-percent 50 -t 64  --output-file relative_abundance_recruitment/10_nosub_coverm_submission_DNA_recruit_to_all_g2p_marine_SAGs.tsv --min-covered-fraction 0 
#coverm genome -d /mnt/scgc/simon/microg2p/analyses/JdF_analysis/Data/JdF_contigs/ --single /mnt/scgc/simon/microg2p/Data/DNA_seq/All_JdF_merged_metagenomes/10thiosulfate-A01_contfpe_bbmerge.fastq.gz -x fasta --min-read-percent-identity 95 --min-read-aligned-percent 50 -t 64  --output-file relative_abundance_recruitment/10_Thio_coverm_submission_DNA_recruit_to_all_g2p_marine_SAGs.tsv --min-covered-fraction 0 
#coverm genome -d /mnt/scgc/simon/microg2p/analyses/JdF_analysis/Data/JdF_contigs/ --single /mnt/scgc/simon/microg2p/Data/DNA_seq/All_JdF_merged_metagenomes/All_10none_contfpe_bbmerge.fastq.gz -x fasta --min-read-percent-identity 95 --min-read-aligned-percent 50 -t 64  --output-file relative_abundance_recruitment/All_10_nonecoverm_submission_DNA_recruit_to_all_g2p_marine_SAGs.tsv --min-covered-fraction 0 
#coverm genome -d /mnt/scgc/simon/microg2p/analyses/JdF_analysis/Data/JdF_contigs/ --single /mnt/scgc/simon/microg2p/Data/DNA_seq/All_JdF_merged_metagenomes/All_500_ammonium_contfpe_bbmerge.gastq.gz -x fasta --min-read-percent-identity 95 --min-read-aligned-percent 50 -t 64  --output-file relative_abundance_recruitment/All500_amm_coverm_submission_DNA_recruit_to_all_g2p_marine_SAGs.tsv --min-covered-fraction 0 
#coverm genome -d /mnt/scgc/simon/microg2p/analyses/JdF_analysis/Data/JdF_contigs/ --single /mnt/scgc/simon/microg2p/Data/DNA_seq/All_JdF_merged_metagenomes/All_500_laminarin_contfpe_bbmerge.fastq.gz -x fasta --min-read-percent-identity 95 --min-read-aligned-percent 50 -t 64  --output-file relative_abundance_recruitment/All500_Lam_coverm_submission_DNA_recruit_to_all_g2p_marine_SAGs.tsv --min-covered-fraction 0 
#coverm genome -d /mnt/scgc/simon/microg2p/analyses/JdF_analysis/Data/JdF_contigs/ --single /mnt/scgc/simon/microg2p/Data/DNA_seq/All_JdF_merged_metagenomes/All_500_Nitrite_contfpe_bbmerge.fastq.gz -x fasta --min-read-percent-identity 95 --min-read-aligned-percent 50 -t 64  --output-file relative_abundance_recruitment/All500_Nit_coverm_submission_DNA_recruit_to_all_g2p_marine_SAGs.tsv --min-covered-fraction 0 
#coverm genome -d /mnt/scgc/simon/microg2p/analyses/JdF_analysis/Data/JdF_contigs/ --single /mnt/scgc/simon/microg2p/Data/DNA_seq/All_JdF_merged_metagenomes/All_500_nosubstrate_contfpe_bbmerge.fastq.gz -x fasta --min-read-percent-identity 95 --min-read-aligned-percent 50 -t 64  --output-file relative_abundance_recruitment/All500_Nosub_coverm_submission_DNA_recruit_to_all_g2p_marine_SAGs.tsv --min-covered-fraction 0 
#coverm genome -d /mnt/scgc/simon/microg2p/analyses/JdF_analysis/Data/JdF_contigs/ --single /mnt/scgc/simon/microg2p/Data/DNA_seq/All_JdF_merged_metagenomes/All_500_Thiosulfate_contfpe_bbmerge.fastq.gz -x fasta --min-read-percent-identity 95 --min-read-aligned-percent 50 -t 64  --output-file relative_abundance_recruitment/All500_Thio_coverm_submission_DNA_recruit_to_all_g2p_marine_SAGs.tsv --min-covered-fraction 0 
#TMPDIR=. coverm genome -d /mnt/scgc/simon/microg2p/analyses/JdF_analysis/Data/JdF_contigs/ --single /mnt/scgc/simon/microg2p/Data/DNA_seq/All_JdF_merged_metagenomes/All_500none_contfpe_bbmerge.fastq.gz -x fasta --min-read-percent-identity 95 --min-read-aligned-percent 50 -t 64  --output-file relative_abundance_recruitment/All500_none_coverm_submission_DNA_recruit_to_all_g2p_marine_SAGs.tsv --min-covered-fraction 0 



cd /mnt/scgc/simon/microg2p/analyses/GORG_recruitment/CoverM_comparsion

TMPDIR=. coverm genome -d /mnt/scgc/simon/microg2p/Data/GoM_uploads/SAG_contigs --single /mnt/scgc/simon/microg2p/Data/GoM_uploads/metagenomes/ALL_20190709_contf_pe_bbmerge_reads.fastq.gz -x fasta --min-read-percent-identity 95 --min-read-aligned-percent 50 -t 64  --output-file 190709_coverm_recruit_to_GoM_SAGs.tsv --min-covered-fraction 0 
TMPDIR=. coverm genome -d /mnt/scgc/simon/microg2p/Data/GoM_uploads/SAG_contigs --single /mnt/scgc/simon/microg2p/Data/GoM_uploads/metagenomes/ALL_20190402_contf_pe_bbmerge_reads.fastq.gz -x fasta --min-read-percent-identity 95 --min-read-aligned-percent 50 -t 64  --output-file 190402_coverm_recruit_to_GoM_SAGs.tsv --min-covered-fraction 0 
TMPDIR=. coverm genome -d /mnt/scgc/simon/microg2p/Data/GoM_uploads/SAG_contigs --single /mnt/scgc/simon/microg2p/Data/GoM_uploads/metagenomes/ALL_20181030_contf_pe_bbmerge_reads.fastq.gz -x fasta --min-read-percent-identity 95 --min-read-aligned-percent 50 -t 64  --output-file 181030_coverm_recruit_to_GoM_SAGs.tsv --min-covered-fraction 0 
TMPDIR=. coverm genome -d /mnt/scgc/simon/microg2p/Data/GoM_uploads/SAG_contigs --single /mnt/scgc/simon/microg2p/Data/GoM_uploads/metagenomes/ALL_20171130_contf_pe_bbmerge_reads.fastq.gz -x fasta --min-read-percent-identity 95 --min-read-aligned-percent 50 -t 64  --output-file 171130_coverm_recruit_to_GoM_SAGs.tsv --min-covered-fraction 0 