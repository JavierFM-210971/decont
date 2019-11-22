# This script should download the file specified in the first argument ($1), place it in the directory specified in the second argument, 
# and *optionally* uncompress the downloaded file with gunzip if the third argument contains the word "yes".

wget -P tr_final/data https://bioinformatics.cnio.es/data/courses/decont/C57BL_6NJ-12.5dpp.1.1s_sRNA.fastq.gz
gunzip -k tr_final/data/C57BL_6NJ-12.5dpp.1.1s_sRNA.fastq.gz

wget -P tr_final/data https://bioinformatics.cnio.es/data/courses/decont/C57BL_6NJ-12.5dpp.1.2s_sRNA.fastq.gz
gunzip -k tr_final/data/C57BL_6NJ-12.5dpp.1.2s_sRNA.fastq.gz

wget -P tr_final/data https://bioinformatics.cnio.es/data/courses/decont/SPRET_EiJ-12.5dpp.1.1s_sRNA.fastq.gz
gunzip -k tr_final/data/SPRET_EiJ-12.5dpp.1.1s_sRNA.fastq.gz

wget -P tr_final/data https://bioinformatics.cnio.es/data/courses/decont/SPRET_EiJ-12.5dpp.1.2s_sRNA.fastq.gz
gunzip -k tr_final/data/SPRET_EiJ-12.5dpp.1.2s_sRNA.fastq.gz

wget -P tr_final/data https://bioinformatics.cnio.es/data/courses/decont/contaminants.fasta.gz
gunzip -k tr_final/data/contaminants.fasta.gz



