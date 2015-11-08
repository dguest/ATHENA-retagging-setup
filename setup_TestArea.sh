export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase
alias setupATLAS='source ${ATLAS_LOCAL_ROOT_BASE}/user/atlasLocalSetup.sh'
export ALRB_localConfigDir=$HOME/localConfig
echo "Please enter the name of the test area you want to use: "
read TestArea_name
echo "Athena will be set up in the directory: $PWD/$TestArea_name"
cd TestArea_20.1.6.3/
asetup 20.1.6.3,AtlasDerivation,gcc48,here