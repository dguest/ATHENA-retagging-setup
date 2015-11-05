mkdir TestArea_20.1.6.3_Oct23
cd TestArea_20.1.6.3_Oct23
asetup 20.1.6.3,AtlasDerivation,gcc48,here
pkgco.py JetInterface-00-00-43
pkgco.py JetMomentTools-00-03-20
pkgco.py PileupReweighting-00-03-06
pkgco.py JetTagTools-01-00-56
pkgco.py BTagging-00-07-43
svn co svn+ssh://svn.cern.ch/reps/atlasperf/CombPerf/FlavorTag/FlavourTagPerformanceFramework/trunk/xAODAthena xAODAthena
setupWorkArea.py
cd WorkArea/cmt
cmt bro cmt config
cmt bro cmt make


