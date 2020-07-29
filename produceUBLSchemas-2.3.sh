#!/bin/bash

if [ "$3" = "" ]; then echo Missing results directory, platform, and dateZ arguments ; exit 1 ; fi

# Configuration parameters

export targetdir="$1"
export platform=$2
export version=$3
export title="UBL 2.3"
export package=UBL-2.3
export UBLversion=2.3
export UBLstage=csd03
export UBLprevStageVersion=2.3
export UBLprevStage=csprd02
export UBLprevVersion=2.2
export rawdir=raw
export libGoogle=https://docs.google.com/spreadsheets/d/1WBi25tYyXcdQkMNrqVYtQnXuBRIJ9xeHGUrgJQwF6tg
export docGoogle=https://docs.google.com/spreadsheets/d/1TeTBDJdFtDFju-cBU97YIaGv7yli1V0MYIXn9L4QITM
export sigGoogle=https://docs.google.com/spreadsheets/d/1T6z2NZ4mc69YllZOXE5TnT5Ey-FlVtaXN1oQ4AIMp7g

bash produceUBLSchemas-common.sh "$1" "$2" "$3" "$4"

exit 0 # always be successful so that github returns ZIP of results
