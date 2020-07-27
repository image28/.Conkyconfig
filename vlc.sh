#!/bin/bash

IFS=$'\n'

# VLC
line="VLC - Music\n"
line=$line$(exec wmctrl -l | grep VLC | awk '{$1=$2=$3=""}1' | sed -e 's/^[ \t]*//') 
line="$line\n"
# STEAM
line="$line\nSTEAM - GAME(S)\n"
IFS=$'\n'; 
for e in `basename \`ps ax | grep "steamapps/common" | grep -v grep | awk -F' ' '{for(i=5;i<=NF;i++){ printf("%s ", $i); }}'\``;
do 
	line="$line$e\n"
done

echo -e "$line";
