DP0=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
java -jar "$DP0/xjparse.jar" -c "$DP0/catalog.xml" -S "$1" "$2"
errorRet=$?
exit $errorRet
