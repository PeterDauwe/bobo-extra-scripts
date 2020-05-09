#!/bin/sh

declare options=("Random
Search
Quit")

choice=$(echo -e "${options[@]}" | dmenu -i -c -l 30 -bw 2 -p 'Manpages : ')

case "$choice" in
	Quit)
	   echo "Program end" && exit 1
	   ;;
	Random)
	   pdf=$(find /usr/share/man/man1 -type f | shuf | head -1 )
	   #pdf=$(find /usr/share/man/man1 -type f | shuf |head -1 | awk -F '/' '/1/ {print $6}' | sed 's/.gz$//g')
	   ;;

    Search)
       pdf=$(man -k . | awk '{ print  $1 }' | dmenu  -i -c -l 30 -bw 2 -p 'Search manpages: ')
       ;;
esac
man -t $pdf | ps2pdf - - | zathura -





