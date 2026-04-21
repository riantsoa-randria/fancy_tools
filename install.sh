#!/bin/bash
set -e

REPO_URL='https://github.com/riantsoa-randria/fancy_tools.git'
SRC_DIR=~/src/fancy_tools

#fonction : ajoute  une ligne
add_if_missing() {
	grep -qF "$1" ~/.bashrc|| echo "$1" >> ~/.bashrc
}

#backup
cp ~/.bashrc	~/.bashrc.bk.$(date +%F-%H%M%S)

#Creer src si n'existe pas
mkdir -p ~/src

#clone le depot si absent
if [ -d "$SRC_DIR" ]
then
	git clone $REPO_URL $SRC_DIR
fi


# Ajouter les copnfigurations
add_if_missing "source $(pwd)/perso.aliases"
add_if_missing "source $(pwd)/fancy_functions.sh"
add_if_missing 'export PATH=$HOME/bin:$PATH'

#ajoute bin si absent
mkdir -p ~/bin

echo "Installation terminee."
