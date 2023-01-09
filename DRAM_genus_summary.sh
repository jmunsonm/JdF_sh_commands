#PBS -N JdF_DRAM
#PBS -q scgc-normal
#PBS -M jmunson-mcgee@bigelow.org
#PBS -m bea
#PBS -l ncpus=128,mem=100GB,walltime=55:00
#PBS -o /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/Surface_DRAM/
#PBS -e /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/Surface_DRAM/

module purge
module use /mod/scgc
module load anaconda3
source activate DRAM

cd /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/Surface_DRAM


# command to annotate protein files with DRAM
# Note1 the '' around the path for -i are necessary.
# Note2 I believe that the output folder '-o' needs to be empty. Otherwise it will not write any thing to it.
# Note3 This requires a tremendous amount of RAM to run. I usually try and run it with 550G to be safe. It could probably run with 250 as long as KEGG was not used in the setup
rm -rf genus_summaries/
DRAM.py distill -i surface_annotations_genus.tsv -o genus_summaries/ --trna_path surface_trnas_genus.tsv --rrna_path surface_rrnas_genus.tsv --groupby_column GTDB_classification
 

cd /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/Meso_DRAM
rm -rf genus_summaries/
DRAM.py distill -i meso_annotations_genus.tsv -o genus_summaries/ --trna_path meso_trnas_genus.tsv --rrna_path meso_rrnas_genus.tsv --groupby_column GTDB_classification

conda deactivate

