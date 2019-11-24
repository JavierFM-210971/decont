# This script should merge all files from a given sample (the sample id is provided in the third argument)
# into a single file, which should be stored in the output directory specified by the second argument.
# The directory containing the samples is indicated by the first argument.

mkdir -p $2
cat $1/$3-12.5dpp.1.1s_sRNA.fastq.gz $1/$3-12.5dpp.1.2s_sRNA.fastq.gz > $2/$3.fastq.gz
echo



#cat data/C57BL_6NJ-12.5dpp.1.1s_sRNA.fastq.gz C57BL_6NJ-12.5dpp.1.2s_sRNA.fastq.gz > out/merged/C57BL_6NJ.fastq.gz | data/SPRET_EiJ-12.5dpp.1.1s_sRNA.fastq.gz SPRET_EiJ-12.5dpp.1.2s_sRNA.fastq.gz > out/merged/SPRET_EiJ.fastq.gz
#cat $1 $3 > $2
