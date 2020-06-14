#!/bin/bash

if [ "$3" = "" ]; then echo Missing results directory, platform, and dateZ arguments ; exit 1 ; fi

# Configuration parameters

export targetdir="$1"
export platform=$2
export version=$3
export title="UBL TSC 2.3"
export package=UBL-TSC-2.3
export UBLversion=2.3
export UBLstage=csprd03
export UBLprevStageVersion=2.3
export UBLprevStage=csprd02
export UBLprevVersion=2.2
export rawdir=raw
export libGoogle=https://docs.google.com/spreadsheets/d/1l1z01tb3bkEHgvC-EU8AViqxg5cHWgx1iLt1UwNFEoA #bad cells
export libGoogle=https://docs.google.com/spreadsheets/d/1n-jNRF9iL-eoDYjU-jpoV5VnxOSU93w0O-lGGqgcnnI #repaired cells
export docGoogle=https://docs.google.com/spreadsheets/d/1eVNs1138GhgBzxd4XLqysS_7afdTni9eyuVGDFQX_H4
export sigGoogle=https://docs.google.com/spreadsheets/d/1T6z2NZ4mc69YllZOXE5TnT5Ey-FlVtaXN1oQ4AIMp7g

bash produceUBLSchemas-common.sh "$1" "$2" "$3" "$4"

exit 0 # always be successful so that github returns ZIP of results
