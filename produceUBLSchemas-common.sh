#!/bin/bash

if [ ! -d $targetdir ]; then mkdir $targetdir ; fi
if [ ! -d $targetdir/artefacts-$package-$UBLstage-$version ]; then 
mkdir     $targetdir/artefacts-$package-$UBLstage-$version
fi
if [ ! -d $targetdir/artefacts-$package-$UBLstage-$version/archive-only-not-in-final-distribution/ ]; then 
mkdir     $targetdir/artefacts-$package-$UBLstage-$version/archive-only-not-in-final-distribution/
fi

echo Building package...
java -Dant.home=utilities/ant -classpath utilities/saxon/saxon.jar:utilities/ant/lib/ant-launcher.jar:utilities/saxon9he/saxon9he.jar:. org.apache.tools.ant.launch.Launcher -buildfile produceUBLschemas.xml "-Dtitle=$title" "-Dpackage=$package" "-DUBLversion=$UBLversion" "-DUBLprevStageVersion=$UBLprevStageVersion" "-DUBLprevStage=$UBLprevStage" "-DUBLprevVersion=$UBLprevVersion" "-Drawdir=$rawdir" "-DlibraryGoogle=$libGoogle" "-DdocumentsGoogle=$docGoogle" "-DsignatureGoogle=$sigGoogle" "-Ddir=$targetdir" "-DUBLstage=$UBLstage" "-Dversion=$version"  | tee $targetdir/artefacts.console.$3.txt
serverReturn=${PIPESTATUS[0]}

mv $targetdir/artefacts.console.$3.txt $targetdir/artefacts-$package-$UBLstage-$version/archive-only-not-in-final-distribution/
echo $serverReturn >$targetdir/artefacts-$package-$UBLstage-$version/archive-only-not-in-final-distribution/artefacts.exitcode.$3.txt

# reduce GitHub storage costs by zipping results and deleting intermediate files
pushd $targetdir
if [ -f artefacts-$package-$UBLstage-$version.zip ]; then rm artefacts-$package-$UBLstage-$version.zip ; fi
7z a artefacts-$package-$UBLstage-$version.zip artefacts-$package-$UBLstage-$version
popd

if [ "$targetdir" = "target" ]
then
if [ "$2" = "github" ]
then
if [ "$4" = "DELETE-REPOSITORY-FILES-AS-WELL" ] #secret undocumented failsafe
then
# further reduce GitHub storage costs by deleting repository files

find . -not -name target -not -name .github -maxdepth 1 -exec rm -r -f {} \;
mv $targetdir/artefacts-$package-$UBLstage-$version.zip .
rm -r -f $targetdir

fi
fi
fi

exit 0 # always be successful so that github returns ZIP of results
