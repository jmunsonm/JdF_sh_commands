#!/bin/bash                                                                                                             

## set name of PBS job                                                                                                  
#PBS -N mmseqs_cluster

## set the queue                                                                                                        
#PBS -q route
#PBS -l walltime=24:00:00                                                                                               
#PBS -l mem=500G
#PBS -l ncpus=50                                                                                                                       
#PBS -j oe                                                                                              
#PBS -o /mnt/scgc/simon/microg2p/JdF_analysis/sh_files/out/JdF_mmseqs2.out




module purge
module load anaconda3/4.0.0


cd /mnt/scgc/simon/microg2p/JdF_analysis/Data/mmseqs

mmseqdir=mmseqs2

mkdir $mmseqdir

# run mmseqs on Pelagibacter genes
name=pelagibacter_genes
qual=60minid_m80

faa=${name}.faa
db=${mmseqdir}/${name}.db
db_clustered=${mmseqdir}/${name}_${qual}.db_clustered
rep_seqs=${mmseqdir}/${name}_${qual}.reps
out_fasta=${mmseqdir}/${name}_${qual}.faa
out_tsv=${mmseqdir}/${name}_${qual}.tsv
tmp_dir=tmp2/

mkdir $tmp_dir

threads=50

mmseqs createdb $faa $db
mmseqs linclust --threads $threads -v 1 --min-seq-id 0.6 --kmer-per-seq 80 $db $db_clustered $tmp_dir
mmseqs result2repseq $db $db_clustered $rep_seqs  --threads $threads
mmseqs result2flat $db $db $rep_seqs $out_fasta --use-fasta-header
mmseqs createtsv $db $db $db_clustered $out_tsv --threads $threads -v 1

# repeat for all the JdF Samples
name=JdF_genes
qual=60minid_m80

faa=${name}.faa
db=${mmseqdir}/${name}.db
db_clustered=${mmseqdir}/${name}_${qual}.db_clustered
rep_seqs=${mmseqdir}/${name}_${qual}.reps
out_fasta=${mmseqdir}/${name}_${qual}.faa
out_tsv=${mmseqdir}/${name}_${qual}.tsv
tmp_dir=tmp2/

mkdir $tmp_dir

threads=50

mmseqs createdb $faa $db
mmseqs linclust --threads $threads -v 1 --min-seq-id 0.6 --kmer-per-seq 80 $db $db_clustered $tmp_dir
mmseqs result2repseq $db $db_clustered $rep_seqs  --threads $threads
mmseqs result2flat $db $db $rep_seqs $out_fasta --use-fasta-header
mmseqs createtsv $db $db $db_clustered $out_tsv --threads $threads -v 1