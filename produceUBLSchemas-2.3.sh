if [ "$3" == "" ]
then 
echo Missing results directory, stage and dateZ arguments
exit
fi

workdir=../work/

echo Building package...
java -Dant.home=utilities/ant -classpath utilities/saxon/saxon.jar:utilities/ant/lib/ant-launcher.jar:utilities/saxon9he/saxon9he.jar:. org.apache.tools.ant.launch.Launcher -buildfile produceUBLschemas.xml "-Dpackage=2.3" -DUBLversion=2.3 -DUBLprevStageVersion=2.3 -DUBLprevStage=csprd02 -DUBLprevVersion=2.2 -Drawdir=raw -Ddir=$1 -Dstage=$2 -Dversion=$3 $4

if [ "$?" != "0" ]; then exit ; fi
