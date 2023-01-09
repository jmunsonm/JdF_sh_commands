#PBS -N SAR11_DRAM
#PBS -q normal
#PBS -M jmunson-mcgee@bigelow.org
#PBS -m bea
#PBS -l ncpus=64,mem=100GB,walltime=2:55:00
#PBS -o /mnt/scgc/simon/microg2p/analyses/JdF_analysis/sh_files/out
#PBS -e /mnt/scgc/simon/microg2p/analyses/JdF_analysis/sh_files/error

module purge
module use /mod/scgc
module load anaconda3
source activate DRAM

#cd /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/Pelagibacter_clustering/
 

# command to annotate protein files with DRAM
# Note1 the '' around the path for -i are necessary.
# Note2 I believe that the output folder '-o' needs to be empty. Otherwise it will not write any thing to it.
# Note3 In the tsv files there CAN NOT be an index column. because DRAM is a finicky little git if the first column is an int (index) it will not produce all of the outputs
#rm -rf depth_summaries/
#DRAM.py distill -i DRAM_Pelagibacter_clustering_annotations.tsv  --trna_path DRAM_Pelagibacter_clustering_trnas.tsv --rrna_path DRAM_Pelagibacter_clustering_rrnas.tsv -o depth_summaries/ --groupby_column depth
 

#rm -rf subgraph95_summaries/
#DRAM.py distill -i DRAM_Pelagibacter_clustering_annotations.tsv  --trna_path DRAM_Pelagibacter_clustering_trnas.tsv --rrna_path DRAM_Pelagibacter_clustering_rrnas.tsv -o subgraph95_summaries/ --groupby_column subgraph_95

# cd /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/Combined_DRAM/
#rm -rf GTDB_DRAM_summaries/
#DRAM.py distill -i combined_DRAM_annotations.tsv --trna_path combined_DRAM_trna.tsv --rrna_path combined_DRAM_rrna.tsv -o GTDB_DRAM_summaries/ --groupby_column GTDB_classification 


# rm -rf FastANI_DRAM_summaries/
# DRAM.py distill -i combined_DRAM_annotations.tsv --trna_path combined_DRAM_trna.tsv --rrna_path combined_DRAM_rrna.tsv -o FastANI_DRAM_summaries/ --groupby_column subgraph 


# rm -rf family_DRAM_summaries/
# DRAM.py distill -i combined_DRAM_annotations.tsv --trna_path combined_DRAM_trna.tsv --rrna_path combined_DRAM_rrna.tsv -o Family_DRAM_summaries/ --groupby_column family 


cd /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/Meso_DRAM/
rm -rf Meso_family_summaries/
DRAM.py distill -i meso_annotations_genus.tsv --trna_path meso_trnas_genus.tsv --rrna_path meso_rrnas_genus.tsv -o Meso_family_summaries/ --groupby_column family 

cd /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/Surface_DRAM/
rm -rf surface_family_summaries/
DRAM.py distill -i surface_annotations_genus.tsv --trna_path surface_trnas_genus.tsv --rrna_path surface_rrnas_genus.tsv -o surface_family_summaries/ --groupby_column family 

conda deactivate

