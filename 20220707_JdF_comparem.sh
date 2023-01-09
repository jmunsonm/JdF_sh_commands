#!/bin/bash
## set name of PBS job
#PBS -N JdF_aai
## set the queue
#PBS -q normal
#PBS -l walltime=168:00:00
#PBS -l mem=500G
#PBS -l ncpus=92
#PBS -j oe
#PBS -o /mnt/scgc/simon/microg2p/analyses/JdF_analysis/sh_files/out
#PBS -e /mnt/scgc/simon/microg2p/analyses/JdF_analysis/sh_files/error

module unload anaconda
module load anaconda3/4.0.0
source activate comparem1

cd /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/comparem
#mkdir /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/comparem/tmp

indir=/mnt/scgc/simon/microg2p/analyses/JdF_analysis/Data/JdF_contigs

outdir=/mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/comparem/JdF

time comparem aai_wf -x fasta -c 92 --tmp_dir /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/comparem/tmp/ $indir $outdir

