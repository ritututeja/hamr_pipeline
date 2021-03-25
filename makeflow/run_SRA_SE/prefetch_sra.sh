#!/bin/bash 

SRA_LIST=${1}
WORK_DIR=${2}

cd ${WORK_DIR}

prefetch --option-file ${SRA_LIST}

