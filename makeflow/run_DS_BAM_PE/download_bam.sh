#!/bin/bash 

SRA_ACC='/xdisk/dukepauli/reetu/test_ds_pipeline/SraAccList.txt'
WORK_DIR='/xdisk/dukepauli/reetu/test_ds_pipeline'
DS_PATH='/iplant/home/andrewnelson/BAM_files_for_public/Arabidopsis/SE_data/Arabidopsis_SE_BAMS'

echo "Fetch BAM files from Data Store"
ssh filexfer 'sh /xdisk/dukepauli/reetu/test_ds_pipeline/get_BAM.sh' ${SRA_ACC} ${WORK_DIR} ${DS_PATH} '&& exit'
