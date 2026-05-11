#!/usr/bin/env sh
# Copyright 2025 ACCESS-NRI and contributors. See the top-level COPYRIGHT file for details.
# SPDX-License-Identifier: Apache-2.0

#PBS -q normal
#PBS -l walltime=4:00:00,mem=50GB
#PBS -l wd
#PBS -l storage=gdata/ik11+gdata/jk72+gdata/xp65+gdata/vk83
#PBS -l ncpus=4
#PBS -v PROJECT=jk72

# Input parameters - Using the environment variables passed via -v
template_dir=$template_dir
old_dir=$old_dir
output_dir=$output_dir

# Get the modules needed
module purge
module use /g/data/xp65/public/modules
module load conda/analysis3

set -x #print commands to e file
set -e #exit on error

cd /home/552/ed7737/coding-and-projects/panant_bathy_ensemble/antarctic-bathymetry-project/om3-scripts/restart_modifications

python3 apply_bathy_mom_restarts.py --template_dir $template_dir --old_dir $old_dir --output_dir $output_dir --template_prefix access-om3.mom6.r.1900-01-01-00000 --old_prefix access-om3.mom6.r.1900-01-01-00000 --nprocs 4