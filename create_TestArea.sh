
# ________________________________________________________________________
function _usage() {
    echo "usage $0 [<testarea directory>]"
}

function _help() {
    cat <<EOF
Script to make the creation of a Athena test area less painful.

To use it you'll need:
 - Make up you mind if you want to use the trunk or an older branch.
   This is to be specified by an additional argument when sourcing
   this script.

This script will:
 - Set up the required environment variables.
 - Set up Athena in the (to be) specified directory.
EOF
}

if (( $# < 1 )) ; then
    _usage
    _help
    return 1
fi
TestArea_name=$1

# ________________________________________________________________________
# random functions
_files_exist () {
    files=$(shopt -s nullglob dotglob; echo *)
    if (( ${#files} )) ; then
        return 0
    else
        return 1
    fi
}

# set up ATLAS stuff
export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase
alias setupATLAS='source ${ATLAS_LOCAL_ROOT_BASE}/user/atlasLocalSetup.sh'

if [[ ! $ATLAS_LOCAL_ASETUP_VERSION ]] ; then
    echo -n "setting up local ATLAS environment..."
    setupATLAS -q
    lsetup asetup
    echo "done"
else
    echo "ATLAS environment is already setup, not setting up again"
fi

# build and go to the test area
mkdir -p $TestArea_name
SRC_DIR=$(pwd)  # come back to this directory later
cd $TestArea_name
if _files_exist ; then
    echo "files exist in $TestArea_name, quitting..."
    return 1
fi

# checkout packages
asetup 20.7.3.3,AtlasDerivation,gcc48,here,64
pkgco.py -A BTagging
pkgco.py -A JetTagTools
# pkgco.py TrkVKalVrtFitter-00-07-08
# pkgco.py InDetVKalVxInJetTool-00-06-07
# pkgco.py VxSecVertex-00-04-07
# pkgco.py JetInterface-00-00-43
# pkgco.py JetMomentTools-00-03-20
# pkgco.py PileupReweighting-00-03-06

svn co svn+ssh://svn.cern.ch/reps/atlasperf/CombPerf/FlavorTag/FlavourTagPerformanceFramework/trunk/xAODAthena xAODAthena
setupWorkArea.py
# build all the things
(
    cd WorkArea/cmt
    cmt bro cmt config
    cmt bro cmt make
)

# setup run area
mkdir -p run
for FILE in jobOptions_Tag.py RetagFragment.py ; do
    cp $TestArea/xAODAthena/run/$FILE run/
done
# get default NN configuration file
cp /afs/cern.ch/user/m/malanfer/public/training_files/AGILEPack_b-tagging.weights.json $TestArea/run/.
# move the job options file
cd run/
ln -sf $SRC_DIR/jobOptions_Tag.py

# go back to the directory we started in
cd $SRC_DIR

# cleanup
unset SRC_DIR FILE
