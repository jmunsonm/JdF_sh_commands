#PBS -N GTDB_GoM_SAGs
#PBS -q scgc-normal
#PBS -M jmunson-mcgee@bigelow.org
#PBS -m bea
#PBS -l ncpus=64,mem=100GB,walltime=20:55:00
#PBS -o /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/GUNC/testing

#FOR SOME REASON I COULD NOT GET THIS TO WORK AS A QSUB COMMAND BUT IT DID FROM A AN INTERACTIVE JOB
# I LAUNCHED A SCREEN SESSION AND SUBMITTED THE CODE BELOW IN AN INTERACTIVE JOB



module purge
module use /mod/scgc/
module load anaconda3
source activate gunc

cd /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/GUNC/testing

#gunc run --input_dir /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/GUNC/testing/mock_SAGs_from_500kbp_SAGs_passGUNC/ --db_file /mnt/scgc/scgc_nfs/ref/gunc/gunc_db_progenomes2.1.dmnd --threads 64 --file_suffix .fasta --out_dir /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/GUNC/testing/GUNC_out_500kbp_mock_genomes/
#gunc run --input_dir /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/GUNC/testing/GUNC_out_500kbp_mock_genomes/gene_calls --db_file /mnt/scgc/scgc_nfs/ref/gunc/gunc_db_progenomes2.1.dmnd --threads 64 --file_suffix .faa --gene_calls --out_dir /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/GUNC/testing/GUNC_out_500kbp_mock_genomes/

gunc run --input_dir /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/GUNC/testing/mock_SAGs_from_1mbp_SAGs_passGUNC --db_file /mnt/scgc/scgc_nfs/ref/gunc/gunc_db_progenomes2.1.dmnd --threads 64 --file_suffix .fasta --out_dir /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/GUNC/testing/GUNC_out_1mbp_mock_genomes
gunc run --input_dir /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/GUNC/testing/GUNC_1mbp_out_mock_genomes/gene_calls --db_file /mnt/scgc/scgc_nfs/ref/gunc/gunc_db_progenomes2.1.dmnd --threads 64 --file_suffix .faa --gene_calls --out_dir /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/GUNC/testing/GUNC_out_1mbp_mock_genomes