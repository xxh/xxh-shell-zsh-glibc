#!/bin/bash

while getopts f:c:v:e: option
do
case "${option}"
in
f) EXECUTE_FILE=${OPTARG};;
c) EXECUTE_COMMAND=${OPTARG};;
v) VERBOSE=${OPTARG};;
e) ENV+=("$OPTARG");;
esac
done

if [[ $VERBOSE != '' ]]; then
  export XXH_VERBOSE=$VERBOSE
fi

if [[ $EXECUTE_COMMAND ]]; then
  if [[ $XXH_VERBOSE == '1' ]]; then
    echo Execute command: $EXECUTE_COMMAND
  fi

  EXECUTE_COMMAND=(-c "${EXECUTE_COMMAND}")
fi

if [[ $EXECUTE_FILE ]]; then
  EXECUTE_COMMAND=""
fi

for env in "${ENV[@]}"; do
  name="$( cut -d '=' -f 1 <<< "$env" )";
  val="$( cut -d '=' -f 2- <<< "$env" )";
  val=`echo $val | base64 -d`

  if [[ $XXH_VERBOSE == '1' ]]; then
    echo Environment variable "$env": name=$name, value=$val
  fi

  export $name="$val"
done

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