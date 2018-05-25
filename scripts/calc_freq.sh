#!/bin/bash

# Create input file for the while loop
ls ~/example_1000_genomes/original_data/*ped | sed 's/.ped//' > filenames_list.txt

while read path
do
    basename $path >> basenames_list.txt
done < filenames_list.txt

paste filenames_list.txt basenames_list.txt > temp
mv temp filenames_list.txt # now filenames_list.txt has two columns 

# Loop through chromosome basenames and write a LSF job for each chromosome
while read full_name file
do
    echo "#BSUB -J $file" > ${file}_calc_freq.job
    echo "#BSUB -q general" >> ${file}_calc_freq.job
    echo "#BSUB -o $file.%J.out" >> ${file}_calc_freq.job
    echo "#BSUB -e $file.%J.err" >> ${file}_calc_freq.job
    echo "#BSUB -P reu" >> ${file}_calc_freq.job
    echo >> ${file}_calc_freq.job
    echo "plink --noweb --file $full_name --freq --out ~/example_1000_genomes/results/${file}_frequencies" >> ${file}_calc_freq.job
done < filenames_list.txt