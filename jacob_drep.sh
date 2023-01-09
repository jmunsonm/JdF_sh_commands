#PBS -N drep
#PBS -q normal
#PBS -M jmunson-mcgee@bigelow.org
#PBS -m bea
#PBS -l ncpus=24,mem=250GB,walltime=24:00:00
#PBS -e /mnt/scgc/simon/lab/tianyi/qsub_scripts/error

source activate drep

#dRep dereplicate /mnt/scgc/stepanauskas_nfs/simon_lab/tianyi/jc -g /mnt/scgc/simon/microg2p/GORG_16S_project/Data/MAG_contigs/M2_Tara_Meren/M2_genomes/*.fa -sa 0.95 -p 24 --ignoreGenomeQuality

#dRep dereplicate /mnt/scgc/stepanauskas_nfs/simon_lab/tianyi/jc/M1 -g /mnt/scgc/simon/microg2p/GORG_16S_project/Data/MAG_contigs/M1_Sunagawa/*.fa -sa 0.95 -p 24 --ignoreGenomeQuality

#dRep dereplicate /mnt/scgc/stepanauskas_nfs/simon_lab/tianyi/jc/SAG -g /mnt/scgc/simon/microg2p/GORG_16S_project/Data/GORG_50perc_SAGs_contigs_unzip/*.fasta -sa 0.95 -p 24 --ignoreGenomeQuality



# Added JdF samples to the command for Jacob analysis
dRep dereplicate /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/JdF_dRep/50perc_SAGs_reduced_overlap -g /mnt/scgc/simon/microg2p/analyses/JdF_analysis/Data/50perc_JdF_contigs/*.fasta -sa 0.95 -p 24 --ignoreGenomeQuality -nc 0.02 --run_tertiary_clustering 

dRep dereplicate /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/JdF_dRep/50perc_SAGs -g /mnt/scgc/simon/microg2p/analyses/JdF_analysis/Data/50perc_JdF_contigs/*.fasta -sa 0.95 -p 24 --ignoreGenomeQuality 