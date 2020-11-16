#!/bin/bash

if [ "$3" = "" ]; then echo Missing results directory, platform, and label arguments ; exit 1 ; fi

# Configuration parameters

export targetdir="$1"
export platform=$2
export label=$3
export title="UBL 2.3"
export package=UBL-2.3
export UBLversion=2.3
export UBLstage=csd04
export UBLprevStageVersion=2.3
export UBLprevStage=csd03
export UBLprevVersion=2.2
export rawdir=raw
export libGoogle=https://docs.google.com/spreadsheets/d/1eilb2NOKIuiy5kzCpp5O8vbZZk-oU9Ao7TiswJmVsvs
export docGoogle=https://docs.google.com/spreadsheets/d/1_YamjYiJ5DFnWiA5h1tASDCOBTBSOgMYcS5ffHPFa3g
export sigGoogle=https://docs.google.com/spreadsheets/d/1T6z2NZ4mc69YllZOXE5TnT5Ey-FlVtaXN1oQ4AIMp7g

bash produceUBLSchemas-common.sh "$1" "$2" "$3" "$4"

exit 0 # always be successful so that github returns ZIP of results
