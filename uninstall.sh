#! /bin/bash
# This script installs the scss skeleton into the directory of your choice.
# And then removes your installed version giving you a fresh scss and css
# directory to start working with

echo -e "This script will delete the created directories from the install"

# Set the directory for safety
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

TEMPDIR=$DIR/tmp

if [ -d "$TEMPDIR" ]; then
  rm -r $TEMPDIR
fi

# Run a check to make sure that the uninstall should occur
RUNINSTALL="N"
read -p "Enter the location of the files: [$RUNINSTALL/y] " RUNINSTALLR
RUNINSTALLU=${RUNINSTALLR:-$RUNINSTALL}

#
if [ "$RUNINSTALLU" == "y" ]; then  # Prompt for a path of customization
  PATHTOTHEME="theme"
  read -p "Enter the location where the files were installed: [$PATHTOTHEME] " PATHTOTHEMER
  PATHTOTHEMEU=${PATHTOTHEMER:-$PATHTOTHEME}

  # Copy all the files from the tmp file to the project
  rm -r $PATHTOTHEMEU/css/style.css
  rm -r $PATHTOTHEMEU/css/print.css
  rm -r $PATHTOTHEMEU/scss
  rm $PATHTOTHEMEU/config.rb
  rm $PATHTOTHEMEU/Gemfile

  if [ -d "$PATHTOTHEMEU/.sass-cache" ]; then
    rm -r $PATHTOTHEMEU/.sass-cache
  fi

  echo "\nThank you running this un-install script.\nIf there were errors, please report them on github\n"
else
  echo "\nGood for you! Keep rocking those partials!\n"
fi
# After that cp all the files into the correct place.


