#!/bin/bash -l
#SBATCH --account=lyons-lab
#SBATCH --partition=standard
#SBATCH --job-name="hamr_worker"
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=6
#SBATCH --time=02:00:00
module load singularity
module load python/3.8

export CCTOOLS_HOME=${HOME}/cctools-7.1.12-x86_64-centos7
export PATH=${CCTOOLS_HOME}/bin:$PATH

${HOME}/cctools-7.1.12-x86_64-centos7/bin/work_queue_factory -T local -M run_hamr -w 2 -W 6 --workers-per-cycle 2 --cores=1
