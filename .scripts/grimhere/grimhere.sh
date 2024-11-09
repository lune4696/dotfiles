#!/bin/sh

pathfile=$HOME"/.scripts/grimhere/path.txt"
path=$(cat "$pathfile")
filename=$(date '+%Y%m%d_%H%M%S')
grim $path$filename$".png" | echo $path$filename$".png" | wl-copy 
