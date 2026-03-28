#!/bin/bash

conda activate variants

bwa index ../reference/Agy99.fasta

seqtk trimfq ../data/raw/ERR3335404_1.fastq > ../data/trimmed/r1.fastq
seqtk trimfq ../data/raw/ERR3335404_2.fastq > ../data/trimmed/r2.fastq

bwa mem ../reference/Agy99.fasta \
../data/trimmed/r1.fastq \
../data/trimmed/r2.fastq | \
samtools sort -o ../results/bam/output.sorted.bam

samtools index ../results/bam/output.sorted.bam

samtools flagstat ../results/bam/output.sorted.bam > ../results/stats/mapping.txt

bcftools mpileup -f ../reference/Agy99.fasta \
../results/bam/output.sorted.bam -o ../results/vcf/raw.bcf

bcftools call --ploidy 1 -m -v \
-o ../results/vcf/variants.vcf \
../results/vcf/raw.bcf
