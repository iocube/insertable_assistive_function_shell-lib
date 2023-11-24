#!/bin/bash


### Part 1
## Returns boolean status code 1 (true) and 0 (false)
## and sets internal variable $result_code
# Usage: user_prompt "Question?" "Short answer Positive" "Short answer Negative" "Positive action" "Negative action"
# example:
# user_prompt "Use cosmic branch?" "Y" "N" 'echo aa' 'echo bb'
user_prompt () {
	prompt_text="$1"  # first parameter passed to function
	choice_positive="$2"  # ex. "Y"
	choice_negative="$3"  # ex. "N"
	result_positive=${4}  # expand command
	result_negative=${5}
	result_code=''
	read -p "$prompt_text [ $choice_positive / $choice_negative ] " choice_user
	shopt -s nocasematch
	case "$choice_user" in
		"$choice_positive" ) $result_positive ; result_code='1' ;;
		"$choice_negative" ) $result_negative ; result_code='0' ;;
		* ) echo "Invalid input." ; exit 1
	esac
	shopt -u nocasematch

	return 0  # function status (trap monitors this)
}


### Part 2
## User sees output and internally the function sets a variable to 1 or 0.
user_prompt "Use cosmic branch?" "Y" "N" 'echo - Cosmic branch selected.' 'echo - Regular branch selected.'
