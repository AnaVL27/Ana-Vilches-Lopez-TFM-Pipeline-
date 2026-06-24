#!/bin/bash

#Manifest file to be created automatically to perform any QIIME analysis
#It runs from the same folder where the fastq sequences are.

###################################################################################################
#First edit this variable name:
###################################################################################################

MANIFEST=TFM-manifest


#Check that this part of the script: 
echo "sample-id,absolute-filepath,direction" > $MANIFEST
ls *R1* |
  while read sample
    do
      prefix="${sample%_R1*}"
      id=$(echo "$sample" | cut -d'_' -f1,2)
      echo "$id,$PWD/${prefix}_R1_001.fastq.gz,forward"
      echo "$id,$PWD/${prefix}_R2_001.fastq.gz,reverse"
      
    done >> $MANIFEST ;

echo 'Finished' ;
echo 'Remember to check the manifest file has been properly created'
