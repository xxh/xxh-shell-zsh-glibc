#!/bin/bash

#while getopts f:c:v: option
#do
#case "${option}"
#in
#f) EXECUTE_FILE=${OPTARG};;
#c) EXECUTE_COMMAND=${OPTARG};;
#v) VERBOSE=${OPTARG};;
#esac
#done

CURRENT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd $CURRENT_DIR

# Check
check_result=`./zsh --version 2>&1`
if [[ ! -f .check-done ]]; then
  if [[ $check_result == *"error"* ]]; then
    echo "Something went wrong while running zsh on host:"
    echo $check_result
  fi
  echo $check_result > .check-done
fi


./zsh -fc 'typeset -p fpath' | sed "s,./run,$CURRENT_DIR,g" > etc/zshenv
cd && $CURRENT_DIR/zsh # TODO: $EXECUTE_FILE $EXECUTE_COMMAND $VERBOSE