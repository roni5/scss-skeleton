#! /bin/bash
# This script installs the scss skeleton into the directory of your choice.
# And then removes your installed version giving you a fresh scss and css
# directory to start working with

echo -e "\nThis script will create and mv the directories to the proper place\n"

# Set the directory for safety, so the install always occurs in the correct location
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#Create a tmp directory to story all the necessary files.
mkdir $DIR/tmp

cp -r $DIR/scss $DIR/tmp
cp -r $DIR/css $DIR/tmp
cp $DIR/Gemfile $DIR/tmp
cp $DIR/config.rb $DIR/tmp

# Prompt for a path of customization
PATHTOTHEME="theme"
read -p "Enter the location for the files: [$PATHTOTHEME] " PATHTOTHEMER
PATHTOTHEMEU=${PATHTOTHEMER:-$PATHTOTHEME}

# Copy all the files from the tmp file to the project
cp -r $DIR/tmp/* $PATHTOTHEMEU

# Append .sass-cache to the gitignore. Trust me, you do want this.
echo .sass-cache >> $PATHTOTHEMEU/.gitignore

# Now clean up the tmp
rm -rf $DIR/tmp

# After that cp all the files into the correct place.

echo -e "\nThank you running this install script\n"
