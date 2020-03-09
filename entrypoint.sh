#!/bin/bash

while getopts f:c:v: option
do
case "${option}"
in
f) EXECUTE_FILE=${OPTARG};;
c) EXECUTE_COMMAND=${OPTARG};;
v) VERBOSE=${OPTARG};;
esac
done

if [[ $EXECUTE_COMMAND ]]; then
  EXECUTE_COMMAND=(-c "${EXECUTE_COMMAND}")
fi

if [[ $EXECUTE_FILE ]]; then
  EXECUTE_COMMAND=""
fi

if [[ $VERBOSE != '' ]]; then
  export XXH_VERBOSE=$VERBOSE
fi

CURRENT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd $CURRENT_DIR

# Check
if [[ ! -f .check-done ]]; then
  check_result=`./zsh.sh --version 2>&1`
  if [[ $check_result != *"zsh "* ]]; then
    echo "Something went wrong while running zsh on host:"
    echo $check_result
  else
    echo $check_result > .check-done
  fi
fi

export XXH_HOME=`realpath $CURRENT_DIR/../../../..`
export HISTFILE=$XXH_HOME/.zsh_history
./zsh.sh $EXECUTE_FILE "${EXECUTE_COMMAND[@]}"