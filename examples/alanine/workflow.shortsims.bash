#!/bin/bash

# Folder containing OpenMM Simulation XML Files
#  - must be discoverable, i.e. in 'examples/files/' or
#    user-specified directory in env variable "$ADMD_MDSYSTEMS"
SYS="alanine"
# Walltime for LRMS job
MINS="15"
# relative or absolute path to DB parent folder
#  - optional DB port for head node to avoid
#    congestionon default port
#  - this argument is transformed as it travels
#    down the pipe
EXECFLAG="mongo:43224"
# OpenMM Simulation Platform
PLATFORM="CPU"
# Name for AdaptiveMD Project instance
PROJ="alanine"
# Name of AdaptiveMD sampling function to use
SF="explore_macrostates"
# Save frequencies for master (all atoms) trajectory
# and protein-only trajectory. Save protein more
# frequently to get more data for MSM building
MFREQ="200"
PFREQ="40"
# Number of replicates
N="2"
# MD length per job in steps
Pi="20000"
# Total MD length for full trajectory
Pt="40000"

#------------------------------------------------------------------------------#
#
# Every workload line: need to fill out these options to define a workflow
#  |   0             1           2            3           4      5    
#  | <admd_command> roundnumber projectname workloadtype ntasks nsteps
#  |
#  |  6      7            8                9                10      11
#  | tsteps afterntrajs minlengthformodel samplingfunction minutes execflag
#
# First workload line: needed to initialize AdaptiveMD Project for workflow
#  |  12          13              14                15
#  | systemname masterfrequency proteinfrequency simulationplatform
#
#------------------------------------------------------------------------------#

admd_checkpoint

#           0 1     2     3  4   5   6 7 8   9    10        11   12     13     14        15
#admd_workload 1 $PROJ trajs $N $Pi $Pt 0 0 $SF $MINS $EXECFLAG $SYS $MFREQ $PFREQ $PLATFORM
#admd_workload 1 $PROJ trajs $N $Pi $Pt 0 0 $SF $MINS $EXECFLAG
#admd_workload 1 $PROJ model 1  0   0   0 0 $SF $MINS $EXECFLAG
admd_workload 1 $PROJ trajs $N $Pi $Pt 0 0 $SF $MINS $EXECFLAG
admd_workload 1 $PROJ trajs $N $Pi $Pt 0 0 $SF $MINS $EXECFLAG
admd_workload 1 $PROJ model 1  0   0   0 0 $SF $MINS $EXECFLAG
#
#admd_workload 1 $PROJ trajs $N $Pi $Pt 0 0 $SF $MINS $EXECFLAG
#admd_workload 1 $PROJ trajs $N $Pi $Pt 0 0 $SF $MINS $EXECFLAG
#admd_workload 1 $PROJ model 1  0   0   0 0 $SF $MINS $EXECFLAG
#
#admd_workload 1 $PROJ trajs $N $Pi $Pt 0 0 $SF $MINS $EXECFLAG
#admd_workload 1 $PROJ trajs $N $Pi $Pt 0 0 $SF $MINS $EXECFLAG
#admd_workload 1 $PROJ model 1  0   0   0 0 $SF $MINS $EXECFLAG
#
#admd_workload 1 $PROJ trajs $N $Pi $Pt 0 0 $SF $MINS $EXECFLAG
#admd_workload 1 $PROJ trajs $N $Pi $Pt 0 0 $SF $MINS $EXECFLAG
#admd_workload 1 $PROJ model 1  0   0   0 0 $SF $MINS $EXECFLAG
#
#admd_workload 1 $PROJ trajs $N $Pi $Pt 0 0 $SF $MINS $EXECFLAG
#admd_workload 1 $PROJ trajs $N $Pi $Pt 0 0 $SF $MINS $EXECFLAG
#admd_workload 1 $PROJ model 1  0   0   0 0 $SF $MINS $EXECFLAG
