#!/bin/bash -l 

srun --nodes=1 --mem=2GB --ntasks=1 --cpus-per-task=4 --time=04:00:00 --job-name=hamrmanager --account=windfall --partition=windfall --mpi=pmi2 --pty bash -i
