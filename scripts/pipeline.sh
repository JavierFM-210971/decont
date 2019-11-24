#Download all the files specified in data/filenames
for url in $(cat data/urls) #DONE
do
    bash scripts/download.sh $url data
done

# Download the contaminants fasta file, and uncompress it
bash scripts/download.sh https://bioinformatics.cnio.es/data/courses/decont/contaminants.fasta.gz res yes #DONE

# Index the contaminants file
bash scripts/index.sh res/contaminants.fasta res/contaminants_idx

# Merge the samples into a single file
for sid in $(ls data/*.fastq.gz | cut -d "_" -f1 | sed 's:data/::' | sort | uniq) #DONE
do
    bash scripts/merge_fastqs.sh data out/merged $sid
done

# TODO: run cutadapt for all merged files

echo "Running cutadapt..."
mkdir -p log/cutadapt
mkdir -p out/trimmed

for fname in $(out/merged/*.fastq.gz)
do
	sid=$(ls fname | cut -d "_" -f1 | sed 's:data/::' | sort | uniq)
	cutadapt -m 18 -a TGGAATTCTCGGGTGCCAAGG --discard-untrimmed -o out/trimmed/${sid}.trimmed.fastq.gz out/merged/${sid}.fastq.gz > log/cutadapt
done

echo


#TODO: run STAR for all trimmed files

echo "Running STAR alignment..."
mkdir -p out/star/${sampleid}



for fname in "out/trimmed/"*.fastq.gz
do
    # you will need to obtain the sample ID from the filename
filename=$(basename -- "$fname")
filename="${filename%.*.*}"
echo $filename
if [ "$#" -eq 1 ]
then
    sampleid=$1    
sid=#TODO
    mkdir -p out/star/$sid
    STAR --runThreadN 4 --genomeDir res/contaminants_idx --outReadsUnmapped Fastx --readFilesIn out/trimmed/${sampleid_1.trimmed.fastq.gz out/trimmed/${sampleid_2.trimmed.fastq.gz --readFilesCommand zcat --outFileNamePrefix out/star/${sampleid}
done 

# TODO: create a log file containing information from cutadapt and star logs
# (this should be a single log file, and information should be *appended* to it on each run)
# - cutadapt: Reads with adapters and total basepairs
# - star: Percentages of uniquely mapped reads, reads mapped to multiple loci, and to too many loci
