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
	gm mogrify -output-directory thumbs -size 250x166 *.jpg -resize 250x166 +profile "*"
	# Switch back to the previous directory.
	cd $base
done
