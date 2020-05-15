#!/bin/bash

if [ -f $1 ]; then rm artefacts.console.$3.txt ; fi

if [ "$3" = "" ]; then echo Missing results directory, stage and dateZ arguments ; exit 1 ; fi

echo Building package...
java -Dant.home=utilities/ant -classpath utilities/saxon/saxon.jar:utilities/ant/lib/ant-launcher.jar:utilities/saxon9he/saxon9he.jar:. org.apache.tools.ant.launch.Launcher -buildfile produceUBLschemas.xml "-Dpackage=2.3" -DUBLversion=2.3 -DUBLprevStageVersion=2.3 -DUBLprevStage=csprd02 -DUBLprevVersion=2.2 -Drawdir=raw -Ddir=$1 -Dstage=$2 -Dversion=$3 $4  | tee artefacts.console.$3.txt
serverReturn=${PIPESTATUS[0]}

if [ ! -d $1 ]; then mkdir $1 ; fi
if [ ! -d $1/artefacts-UBL-2.3-$2-$3 ]; then mkdir $1/artefacts-UBL-2.3-$2-$3 ; fi
if [ ! -d $1/artefacts-UBL-2.3-$2-$3/archive-only-not-in-final-distribution/ ]; then mkdir $1/artefacts-UBL-2.3-$2-$3/archive-only-not-in-final-distribution/ ; fi
mv artefacts.console.$3.txt $1/artefacts-UBL-2.3-$2-$3/archive-only-not-in-final-distribution/
echo $serverReturn >$1/artefacts-UBL-2.3-$2-$3/archive-only-not-in-final-distribution/artefacts.exitcode.$3.txt

exit 0 # always be successful so that github returns ZIP of results
