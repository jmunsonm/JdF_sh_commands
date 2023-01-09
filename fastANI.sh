#PBS -N fastANI
#PBS -q scgc-route
#PBS -M jmunson-mcgee@bigelow.org
#PBS -m bea
#PBS -l ncpus=12,mem=250GB,walltime=48:55:00
#PBS -o /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/fastANI/

# Load modules
module use /mod/scgc
module load anaconda 
module load fastani/1.1

cd /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/fastANI/


# You need a text file with the absolute path of all of the SAGs you want to run through fastANI. 
# Enter that file for both the query and reference list.
fastANI --rl /mnt/scgc/simon/microg2p/Data/SAG_contigs/AT42-11.list --ql /mnt/scgc/simon/microg2p/Data/SAG_contigs/AT42-11.list -o /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/fastANI/fastANI.txt

