#!/bin/bash
## set name of PBS job
#PBS -N JdF_aai
## set the queue
#PBS -M jmunson-mcgee@bigelow.org
#PBS -m bea
#PBS -q normal
#PBS -l walltime=72:00:00
#PBS -l mem=1000G
#PBS -l ncpus=190
#PBS -j oe
#PBS -o /mnt/scgc/simon/microg2p/JdF_analysis/sh_files/out/JdF_compareM.OU


module unload anaconda
module load anaconda3/4.0.0
source activate comparem1

cd=/mnt/scgc/simon/microg2p/analyses/JdF_analysis/

rm -rf /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/comparem/JdF
comparem aai_wf -x .fasta -c 190 --tmp_dir /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/comparem/tmp /mnt/scgc/simon/microg2p/analyses/JdF_analysis/Data/JdF_contigs/ /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/comparem/JdF



