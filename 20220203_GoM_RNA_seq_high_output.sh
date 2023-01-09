#PBS -N JdF_RNA_seq
#PBS -q scgc-normal
#PBS -M jmunson-mcgee@bigelow.org
#PBS -m bea
#PBS -l ncpus=32,mem=450GB,walltime=44:55:00
#PBS -o /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/RNA_recruitment

module use /mod/scgc
module load anaconda 
source activate jacob
module use /mod/scgc
module load anaconda
module load bbmap/35.85 
module load fastqc
module load samtools


cd /mnt/scgc/simon/microg2p/Data/RNA_seq/AT42-11_RNA_seq/Contf_pe_reads/Merged_reads/
#standards
for file in *.fastq.gz; do bbmap.sh -Xmx450g in=$file ref=/mnt/scgc/simon/microg2p/analyses/JdF_analysis/Data/MTST_Standards.fasta out="/mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/RNA_recruitment/standards/${file/%.fastq.gz/to_MTST_standards.sam}" minid=0.95; done

# recruit reads to 16S seqs from JdF
cd /mnt/scgc/simon/microg2p/Data/RNA_seq/AT42-11_RNA_seq/Contf_pe_reads/merged_reads_noMTST/
for file in *.fastq.gz; do bbmap.sh -Xmx450g in=$file ref=/mnt/scgc/simon/microg2p/analyses/JdF_analysis/Data/JdF_SSUs/JdF_SSUs.fna out="/mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/RNA_recruitment/16S/${file/%.fastq.gz/to_JdF_SSUs.sam}" minid=0.95; done

# recruit reads from JdF to Silva db
for file in *.fastq.gz; do bbmap.sh -Xmx450g in=$file ref=/mnt/scgc/simon/databases/Silva/SILVA_132_SSURef_Nr99_tax_silva.fasta out="/mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/RNA_recruitment/16S/${file/%.fastq.gz/to_Silva_SSUs.sam}" minid=0.95; done

#Recruit JdF RNA reads from to JdF SAGs
for file in *.fastq.gz; do bbmap.sh -Xmx450g in=$file ref=/mnt/scgc/simon/microg2p/analyses/JdF_analysis/Data/AT42-11.faa out="/mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/RNA_recruitment/genes/${file/%.fastq.gz/to_AT42-11_genes.sam}" minid=0.95; done


cd /mnt/scgc/simon/microg2p/analyses/JdF_analysis/analysis/RNA_recruitment

for file in */*.sam; do samtools view -bS -F 4 $file > ${file/%.sam/_mapped.bam}; done

#sort bam
for file in */*mapped.bam; do samtools sort $file -o ${file/%.bam/_sorted.bam}; done

#generate tab file
for file in */*sorted.bam; do samtools index $file ${file/%.bam/.bai}; done
for file in */*sorted.bam; do samtools idxstats $file > ${file/%.bam/.tab}; done
#remove contigs with no reads recruited
for file in */*sorted.tab; do awk -F $'\t' '($3 != 0) || ($2 == 0)' $file >${file/%.tab/_recruited_only.tab}; done
mkdir sorted
for file in */*only.tab; do csvsort -H -r -t -c3 $file > ${file/%.tab/_sorted.csv}; done

cp */*.csv sorted/
#for file in sorted/*.csv; do awk -F',' '{mapped+=$3} {unmapped+=$4} END {print "File=" FILENAME "\nMapped=" mapped "\nUnmapped=" unmapped}' $file; done

#cleanup
rm */*.sam
rm */*s.bam
rm */*mapped.bam
rm */*d.tab

exit