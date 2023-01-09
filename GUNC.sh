#PBS -N JdF_GUNC
#PBS -q scgc-normal
#PBS -M jmunson-mcgee@bigelow.org
#PBS -m bea
#PBS -l ncpus=64,mem=100GB,walltime=50:55:00
#PBS -o /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/GUNC
#PBS -e /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/GUNC

#FOR SOME REASON I COULD NOT GET THIS TO WORK AS A QSUB COMMAND BUT IT DID FROM A AN INTERACTIVE JOB
# I LAUNCHED A SCREEN SESSION AND SUBMITTED THE CODE BELOW IN AN INTERACTIVE JOB



module purge
module use /mod/scgc/
module load anaconda3
source activate gunc

cd /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/GUNC

#gunc run --input_dir /mnt/scgc/simon/microg2p/Data/SAG_contigs/AT42-11 --db_file /mnt/scgc/scgc_nfs/ref/gunc/gunc_db_progenomes2.1.dmnd --threads 64 --file_suffix .fasta

#gunc run --input_dir /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/GUNC/gene_calls --db_file /mnt/scgc/scgc_nfs/ref/gunc/gunc_db_progenomes2.1.dmnd --threads 64 --file_suffix .faa --gene_calls

for file in diamond_output/*progenomes*; do gunc plot --diamond_file $file --out_dir /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/GUNC/GUNC_plot_out; done