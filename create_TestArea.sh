
# random functions
_files_exist () {
    files=$(shopt -s nullglob dotglob; echo *)
    if (( ${#files} )) ; then
       return 0
    else
  return 1
    fi
}

# setup atlas stuff
# export AtlasSetup=/afs/cern.ch/atlas/software/dist/AtlasSetup
# asetup 20.1.6.3,AtlasDerivation,here,64

export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase
alias setupATLAS='source ${ATLAS_LOCAL_ROOT_BASE}/user/atlasLocalSetup.sh'

if [[ ! $ATLAS_LOCAL_ASETUP_VERSION ]] ; then
    echo -n "setting up local ATLAS environment..."
    setupATLAS -q
    echo "done"
else
    echo "ATLAS environment is already setup, not setting up again"
fi

# setup directory
if (( $# < 1 )) ; then
   echo "Please enter the directory name (from current directory) in which you want to set up the test area: "
   read TestArea_name
else
    TestArea_name=$1
fi
echo "The test area will be set up in the directory: $PWD/$TestArea_name"

# build and go to the test area
mkdir $TestArea_name
SRC_DIR=$(pwd)  # come back to this directory later
cd $TestArea_name
if _files_exist ; then
    echo "files exist in $TestArea_name, quitting..."
    return 1
fi

# checkout packages
asetup 20.1.6.3,AtlasDerivation,gcc48,here,64
pkgco.py BTagging-00-07-43-branch
pkgco.py JetTagTools-01-00-56-branch
pkgco.py JetInterface-00-00-43
pkgco.py JetMomentTools-00-03-20
pkgco.py PileupReweighting-00-03-06
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
# patch the job options file
patch -p0 < $SRC_DIR/jo_update.patch

# go back to the directory we started in
cd $SRC_DIR

# cleanup
unset SRC_DIR FILE
