## set name of script
#PBS -N Hades_Phylo

## send the environment variables with job 
#PBS -V

## set the queue                                                                          
#PBS -q route                                                                   

## give job 24 hours                  
#PBS -l walltime=72:00:00 

## use one compute node and one cpu (this will default to use 2gb of memory)                                                      
#PBS -l select=1:ncpus=32:mem=50GB                                                        
                                                              

## output files placed in output directory in the user vcc’s home directory                                    
#PBS -e /mnt/scgc/simon/microg2p/JdF_analysis/sh_files/error
#PBS -o /mnt/scgc/simon/microg2p/JdF_analysis/sh_files/out
#PBS -m bea                                                         
#PBS -M jmunson-mcgee@gibelow.org

cd /mnt/scgc/simon/microg2p/JdF_analysis/analysis
module use /mod/scgc
module load anaconda3/4.8.4 
source activate phylophlan

phylophlan -i /mnt/scgc/simon/microg2p/JdF_analysis/Data/JdF_genes/pelagibacter_faa -d /mnt/storage/labs/orcutt/tims_bioinformatics/phylophlan_databases/phylophlan/ --diversity medium -f /home/tdangelo/.conda/envs/phylophlan/lib/python3.8/site-packages/phylophlan/phylophlan_configs/supermatrix_aa.cfg --nproc 32 --min_num_markers 12 --verbose 

echo start
/bin/sleep 10
echo finished