#!/bin/bash -l 

srun --nodes=1 --mem=2GB --ntasks=1 --cpus-per-task=4 --time=02:00:00 --job-name=run_hamr --account=lyons-lab --partition=standard --mpi=pmi2 --pty bash -i

