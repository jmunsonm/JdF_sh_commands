#!/bin/bash                                                                                                             

## set name of PBS job                                                                                                  
#PBS -N diamond_makedb

## set the queue                                                                                                        
#PBS -q normal
#PBS -l walltime=4:00:00                                                                                               
#PBS -l mem=500G
#PBS -l ncpus=50                                                                                                                       
#PBS -j oe                                                                                              
#PBS -o /mnt/scgc/simon/microg2p/JdF_analysis/sh_files/out/JdF_diamond.out




module purge
module load anaconda3/2019.07
source activate diamond

cd /mnt/scgc/simon/microg2p/JdF_analysis/analysis/Diamond


diamond makedb --in /mnt/scgc/simon/microg2p/JdF_analysis/Data/mmseqs/mmseqs2/JdF_genes_60minid_m80.faa -d /mnt/scgc/simon/microg2p/JdF_analysis/Data/Diamond/JdF_mmseqs_cluster_db -p 50


