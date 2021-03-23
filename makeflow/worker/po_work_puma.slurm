#!/bin/bash -l
#SBATCH --account=windfall
#SBATCH --partition=windfall
#SBATCH --job-name="hamr_worker"
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=14
#SBATCH --time=12:00:00
module load singularity
module load python/3.8

export CCTOOLS_HOME=${HOME}/cctools-7.1.12-x86_64-centos7
export PATH=${CCTOOLS_HOME}/bin:$PATH

${HOME}/cctools-7.1.12-x86_64-centos7/bin/work_queue_factory -T local -M hamrpipeline -w 6 -W 14 --workers-per-cycle 4 --cores=1
