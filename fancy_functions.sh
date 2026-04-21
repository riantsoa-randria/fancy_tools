#!/bin/bash

gco(){

	if [ ! git rev-parse --is-inside-work-tree $>/dev/null]
	then
		echo " Attention! Votre dossier actuel n'est pas un depot Git. "
		return 1
	fi

	if  [ -z "$1" ]
	then
		echo  "Format correcte:  gco <message de commit>"
	fi

	local branch
	branch=$(git branch --show-current)



	git commit -m "[$branch] $1"
}
