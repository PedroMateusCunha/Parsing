#!/bin/bash

if [ "$1" == "" ]
then
	echo "#######################"
	echo "#  Analisador de URL  #"
	echo "#######################"	
	echo "Modo de uso: ./parsing.sh <url> "
	echo "By: Pedro Cunha"
else
	wget -q  $1
	grep href index.html | cut -d "/" -f3 | grep "\." | cut -d '"' -f1 | sort -u | grep -v '<li' > lista
	for url in $(cat lista);do host $url | grep "has address"; done
	rm lista
	rm index.html
fi
