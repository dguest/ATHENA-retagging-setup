export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase
alias setupATLAS='source ${ATLAS_LOCAL_ROOT_BASE}/user/atlasLocalSetup.sh'
export ALRB_localConfigDir=$HOME/localConfig
echo "Please enter the directory name (from current directory) in which you want to set up the test area: "
read TestArea_name
echo "The test area will be set up in the directory: $PWD/$TestArea_name"
mkdir TestArea_name
cd TestArea_name
asetup 20.1.6.3,AtlasDerivation,gcc48,here
pkgco.py BTagging-00-07-43-branch
pkgco.py JetTagTools-01-00-62-branch
pkgco.py JetInterface-00-00-43
pkgco.py JetMomentTools-00-03-20
pkgco.py PileupReweighting-00-03-06
svn co svn+ssh://svn.cern.ch/reps/atlasperf/CombPerf/FlavorTag/FlavourTagPerformanceFramework/trunk/xAODAthena xAODAthena
setupWorkArea.py
cd WorkArea/cmt
cmt bro cmt config
cmt bro cmt make


