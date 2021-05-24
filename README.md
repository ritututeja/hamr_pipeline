# HAMR Makeflow Pipeline

![alt text](https://github.com/ritututeja/hamr_pipeline/blob/main/imgs/hamr-pipeline.jpg)

For paired-end data, replace run_sra.sh and run_bam.sh with paired-end version- run_sra_PE.sh and run_bam_PE.sh.

## Setup Guide

Download CCTools and extract it's contents within your HPC home path:

```
cd ~

wget http://ccl.cse.nd.edu/software/files/cctools-7.1.12-x86_64-centos7.tar.gz

tar -xvf cctools-7.1.12-x86_64-centos7.tar.gz
```

Download containers from DockerHub:

```
sh pull_containers.sh
```
