#!/bin/bash

if [ -f artefacts.console.$3.txt ]; then rm artefacts.console.$3.txt ; fi

if [ "$3" = "" ]; then echo Missing results directory, stage and dateZ arguments ; exit 1 ; fi

echo Building package...
java -Dant.home=utilities/ant -classpath utilities/saxon/saxon.jar:utilities/ant/lib/ant-launcher.jar:utilities/saxon9he/saxon9he.jar:. org.apache.tools.ant.launch.Launcher -buildfile produceUBLschemas.xml "-Dpackage=2.3" -DUBLversion=2.3 -DUBLprevStageVersion=2.3 -DUBLprevStage=csprd02 -DUBLprevVersion=2.2 -Drawdir=raw -Ddir=$1 -Dstage=$2 -Dversion=$3  | tee artefacts.console.$3.txt
serverReturn=${PIPESTATUS[0]}

if [ ! -d $1 ]; then mkdir $1 ; fi
if [ ! -d $1/artefacts-UBL-2.3-$2-$3 ]; then mkdir $1/artefacts-UBL-2.3-$2-$3 ; fi
if [ ! -d $1/artefacts-UBL-2.3-$2-$3/archive-only-not-in-final-distribution/ ]; then mkdir $1/artefacts-UBL-2.3-$2-$3/archive-only-not-in-final-distribution/ ; fi
mv artefacts.console.$3.txt $1/artefacts-UBL-2.3-$2-$3/archive-only-not-in-final-distribution/
echo $serverReturn >$1/artefacts-UBL-2.3-$2-$3/archive-only-not-in-final-distribution/artefacts.exitcode.$3.txt

# reduce GitHub storage costs by zipping results and deleting intermediate files
7z a $1/artefacts-UBL-2.3-$2-$3.zip $1/artefacts-UBL-2.3-$2-$3
rm -r -f $1/artefacts-UBL-2.3-$2-$3

if [ "$1" = "target" ]
then
if [ "$2" = "github" ]
then
if [ "$4" = "DELETE-REPOSITORY-FILES-AS-WELL" ] #secret undocumented failsafe
then
# further reduce GitHub storage costs by deleting repository files

find . -not -name target -not -name .github -maxdepth 1 -exec rm -r -f {} \;
mv $1/artefacts-UBL-2.3-$2-$3.zip .
rm -r -f $1

fi
fi
fi

exit 0 # always be successful so that github returns ZIP of results
