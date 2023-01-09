#!/bin/bash
## set name of PBS job
#PBS -N JdF_GORG_DNA
## set the queue
#PBS -M jmunson-mcgee@bigelow.org
#PBS -m bea
#PBS -q normal
#PBS -l walltime=72:00:00
#PBS -l mem=1000G
#PBS -l ncpus=190
#PBS -j oe
#PBS -o /mnt/scgc/simon/microg2p/JdF_analysis/sh_files/out/JdF_GORG_DNA.OU
#PBS -e /mnt/scgc/simon/microg2p/JdF_analysis/sh_files/out/JdF_GORG_DNA.ER


module unload anaconda; module load anaconda # To get anaconda2
cd /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/JdF_GORG_DNA_recruit

nextflow run BigelowLab/gorg-classifier \
-profile charlie \
--seqs '/mnt/scgc/simon/microg2p/Data/DNA_seq/All_JdF_merged_metagenomes/*.fastq.gz' \
--mode local \
--nodes /mnt/scgc_nfs/ref/gorg_classifier_2022/jdf/nodes.dmp \
--names /mnt/scgc_nfs/ref/gorg_classifier_2022/jdf/names.dmp \
--fmi /mnt/scgc_nfs/ref/gorg_classifier_2022/jdf/jdf_v_gtdb_R207.fmi \
--annotations /mnt/scgc_nfs/ref/gorg_classifier_2022/jdf/jdf_v_gtdb_R207.annotations.tsv \
--outdir /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/JdF_GORG_DNA_recruit