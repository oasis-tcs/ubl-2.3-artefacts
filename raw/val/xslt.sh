DP0=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
java -jar "$DP0/saxon.jar" -o "$3" "$1" "$2"
errorRet=$?
exit $errorRet
