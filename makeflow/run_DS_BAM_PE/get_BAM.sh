#!/bin/bash 

SRA_LIST=${1}
WORK_DIR=${2}
DS_PATH=${3}

cd ${WORK_DIR}
echo "Downloading data from ${DS_PATH}"
while IFS= read -r line
do
   iget -PTf ${DS_PATH}/${line}.sorted.bam
done < "$SRA_LIST"
