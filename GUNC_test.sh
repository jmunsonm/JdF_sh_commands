#PBS -N GUNC_AT42-11_SAGs
#PBS -q scgc-normal
#PBS -M jmunson-mcgee@bigelow.org
#PBS -m bea
#PBS -l ncpus=8,mem=10GB,walltime=00:55:00
#PBS -o /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/GUNC

module purge
module use /mod/scgc/
module load anaconda3
source activate gunc

cd /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/GUNC/test2/

gunc run --input_dir /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/GUNC/Genome_test --db_file /mnt/scgc/scgc_nfs/ref/gunc/gunc_db_progenomes2.1.dmnd --threads 8 --file_suffix .fasta 

