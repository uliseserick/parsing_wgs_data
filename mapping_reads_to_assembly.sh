#!/bin/bash


# Index 

#for file in *_scaffolds.fasta

#do

#n=${file%%_scaffolds.fasta}

#/srv/home/cmartinez/anaconda3/envs/bowtie2/bin/bowtie2-build ${n}_scaffolds.fasta  ${n}_scaffolds.btindex

#done



# mapping the trimmed sequencing reads to the assembly

for file in *_R1_p_tr.fastq.gz

do

n=${file%%_R1_p_tr.fastq.gz}



bowtie2 -x ${n}_scaffolds.btindex -1 ${n}_R1_p_tr.fastq.gz -2 ${n}_R2_p_tr.fastq.gz -S ${n}_contigs.sam

done


for file in *.sam

do

n=${file%%.sam}

samtools view -bS ${n}.sam > ${n}_to_sort.bam

samtools sort ${n}_to_sort.bam -o ${n}.bam

samtools index ${n}.bam


done


for i in *.bam
do
 pileup.sh in=$i out=${i}.cov.txt
 awk '{print $1"\t"$5}' ${i}.cov.txt | grep -v '^#' > ${i}.abundance.txt
done 
