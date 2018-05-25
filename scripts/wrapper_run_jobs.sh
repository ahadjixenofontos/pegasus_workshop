#!/bin/bash 

# Usage:
# Note that wildcard will expand within the script, not by parent shell
# bash wrapper_run_jobs.sh /path/to/job/files/*

for jobfile in "$@"
do
    echo "Submitting $jobfile..."
    bsub < $jobfile
done 

