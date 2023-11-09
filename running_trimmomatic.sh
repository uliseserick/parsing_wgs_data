#!/bin/bash

# this script runs the trimmomatic (Bolger et al., 2014) software

cd /srv/home/urodriguez/metagenomas_hcs/reads_crudas

for f in *_R1.fastq.gz
do 
n=${f%%_R1.fastq.gz} 
/srv/home/acisneros/bin/trimmomatic PE -phred33 -summary ${n}_p_summary -threads 32 \
${n}_R1.fastq.gz  ${n}_R2.fastq.gz \
${n}_R1_p_tr.fastq.gz ${n}_R1_p_un.fastq.gz \
${n}_R2_p_tr.fastq.gz ${n}_R2_p_un.fastq.gz \
ILLUMINACLIP:adapters.fa:2:20:10 LEADING:10 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36 
done

