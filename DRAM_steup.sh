#PBS -N JdF_RNA_seq
#PBS -q scgc-normal
#PBS -M jmunson-mcgee@bigelow.org
#PBS -m bea
#PBS -l ncpus=32,mem=10GB,walltime=24:55:00
#PBS -o /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/DRAM
#PBS -e /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/DRAM

module use /mod/scgc
module load anaconda 
source activate DRAM

DRAM-setup.py prepare_databases --output_dir /mnt/scgc/simon/databases/DRAM_data/


exit
