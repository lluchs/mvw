#!/bin/bash

base=$(dirname `which $0`)/../content/bilder
cd $base

# Case-insensitive globbing to get .jpg as well as .JPG
shopt -s nocaseglob

for dir in */*
do
	# Only look at directories.
	[ -d $dir ] || continue
	# Skip directories which already have thumbnails.
	[ -d $dir/thumbs ] && continue
	# Create the thumbnail directory.
	mkdir $dir/thumbs
	# Create thumbnails!
	echo Generating thumbnails for $dir.
	cd $dir
	# Use `gm convert` as `gm mogrify` does not always use the given size.
	for file in *.jpg
	do
		gm convert -size x166 $file -resize x166 +profile "*" -quality 92 thumbs/$file
	done
	# Switch back to the previous directory.
	cd $base
done
