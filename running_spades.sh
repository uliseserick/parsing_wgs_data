#!/bin/bash

#### to assembly row reads into contigs using spades (Bankevich et al., 2012) assembler 


for f in *_R1_p_tr.fastq.gz;

do 

n=${f%%_R1_p_tr.fastq.gz} 

spades.py --meta -1 ${n}_R1_p_tr.fastq.gz -2 ${n}_R2_p_tr.fastq.gz -t 40 -o ${n}_metaspades_output

done
