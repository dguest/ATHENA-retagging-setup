#!/usr/bin/env bash                                                                                                                                                                                               

# ATLAS setup stuff 
export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase
export ALRB_localConfigDir=$HOME/localConfig
export AtlasSetup=/afs/cern.ch/atlas/software/dist/AtlasSetup
alias setupATLAS='source ${ATLAS_LOCAL_ROOT_BASE}/user/atlasLocalSetup.sh'

# setup check
if [[ ! $ATLAS_LOCAL_ASETUP_VERSION ]] ; then
    echo -n "setting up local ATLAS environment..."
    setupATLAS -q
    echo "done"
else
    echo "ATLAS environment is already setup, not setting up again"
fi

echo "Please enter the full path of the test area you want to use: "
read TestArea_path
echo "Athena will be set up in the directory: $TestArea_path"
cd $TestArea_path
source $AtlasSetup/scripts/asetup.sh 20.1.6.3,AtlasDerivation,gcc48,here