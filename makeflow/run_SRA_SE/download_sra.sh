#!/bin/bash 

SRA_ACC='/xdisk/dukepauli/reetu/mkflow_tests_2/SraAccList.txt'
WORK_DIR='/xdisk/dukepauli/reetu/mkflow_tests_2'

echo "Downloading SRA data"
ssh filexfer 'sh /xdisk/dukepauli/reetu/mkflow_tests_2/prefetch_sra.sh' ${SRA_ACC} ${WORK_DIR}'&& exit'

