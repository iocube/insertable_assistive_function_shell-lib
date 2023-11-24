#!/bin/bash

## Part 1
# Preferably set in the begining of the script
shopt -s execfail  # ERR on failure

## Part 2
# This function resets session variables in case the script fails during runtime
# Defined before the trap itself
# You must manually define what should be unset and so on...
failsafe_bash_env () {
	echo "Script failed. Failsafe function ran."
	shopt -u nocasematch  && echo "- Unset case-insensitivity"
	shopt -u execfail && echo "- Unset execfail."
	exit 1
}

## Part 3
# Run failsafe function if script encounters an error or is terminated (SIG)
# This must be placed right after the definition of the failsafe function
trap "failsafe_bash_env" ERR SIGINT SIGKILL SIGTERM SIGSTOP SIGQUIT
