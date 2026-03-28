GERMLINE VARIANT CALLING PIPELINE USING BCFTOOLS
OVERVIEW:

This project implements a reproducible end-to-end germline variant calling workflow using Illumina paired-end sequencing data. The pipeline processes raw sequencing reads, performs quality control, aligns them to a reference genome, and identifies genomic variants (SNPs and indels).

OBJECTIVES:

Perform quality control and preprocessing of sequencing reads
Align reads to a reference genome (Mycobacterium ulcerans Agy99)
Generate sorted alignment files
Perform variant calling using BCFtools
Extract and analyze variant positions

TOOLS AND TECHNOLOGIES:

BWA – sequence alignment
SAMtools – BAM processing
BCFtools – variant calling
Seqtk – read trimming
Conda – environment management

WORFLOW:

Quality Control
Raw FASTQ reads are trimmed to remove low-quality bases.
Alignment
Reads are aligned to the reference genome using BWA-MEM.
Post-processing
SAMtools is used to sort and index alignment files.
Variant Calling
BCFtools mpileup and call are used to detect SNPs and indels.
Variant Extraction
Genomic positions of variants are extracted for downstream analysis.

OUTPUTS:

File	Description
variants.vcf	Final variant calls (SNPs & indels)
mapping.txt Alignment statistics
pos.txt	Variant genomic positions
REPRODUCABILITY:
conda env create -f env/environment.yml
conda activate variants
bash scripts/pipeline.sh
NOTES:
Large files (FASTQ, BAM, BCF) are excluded from this repository.
Only essential outputs and scripts are included for reproducibility.
KEY OUTCOME:

This pipeline successfully identifies genomic variants from sequencing data using a haploid-aware variant calling approach, demonstrating a complete bioinformatics workflow from raw data to interpretable results.
