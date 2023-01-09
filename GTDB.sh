#PBS -N GTDB_Dark_SAGs
#PBS -q normal
#PBS -M jmunson-mcgee@bigelow.org
#PBS -m bea
#PBS -l ncpus=94,mem=450GB,walltime=24:55:00
#PBS -o /mnt/scgc/simon/microg2p/analyses/JdF_analysis/sh_files/out

module unload anaconda
module use /mod/scgc/
module load anaconda3
source activate gtdbtk_2.0.0

#Change this path to whatever file you run it from.
cd /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/gtdb


# Modify the genome_dir and the out-dir flags and this command should work for GTDB
#gtdbtk classify_wf --genome_dir /mnt/scgc/simon/microg2p/Data/SAG_contigs/AT42-11/ --out_dir gtdb_2.0_classify_wf_out --cpus 64 -x fasta


gtdbtk classify_wf --genome_dir /mnt/scgc/simon/microg2p/JdF_analysis/Data/Herndl_contigs_clean --out_dir Other_dark_ocean_gtdb_2.0_classify_wf_out --cpus 94 -x fasta


