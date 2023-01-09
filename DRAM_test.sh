#PBS -N JdF_DRAM
#PBS -q scgc-normal
#PBS -M jmunson-mcgee@bigelow.org
#PBS -m bea
#PBS -l ncpus=32,mem=550GB,walltime=4:55:00
#PBS -o /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/DRAM_test
#PBS -e /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/DRAM_test

module purge
module use /mod/scgc
module load anaconda3
source activate DRAM
cd /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/DRAM_test/

rm -rf /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/DRAM_test/out

# command to annotate protein files with DRAM
# Note1 the '' around the path for -i are necessary.
# Note2 I believe that the output folder '-o' needs to be empty. Otherwise it will not write any thing to it.
# Note3 This requires a tremendous amount of RAM to run. I usually try and run it with 550G to be safe. It could probably run with 250 as long as KEGG was not used in the setup
DRAM.py annotate -i '/mnt/scgc/simon/microg2p/analyses/JdF_analysis/Data/DRAM_test/*.fasta' -o out --threads 32

#summarize results from DRAM 
DRAM.py distill -i out/annotations.tsv -o out/genome_summaries --trna_path out/trnas.tsv --rrna_path out/rrnas.tsv

conda deactivate

