# Directory where new font will be installed.
DIR="$HOME/.local/share/fonts"
# Package's download link 
FONT="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip"
# The package we are trying to download
PKG="FiraCode.zip"

if [ -d $DIR ]; then
  echo "'$DIR' exists, moving to '$DIR'."
  cd $DIR 
else
  echo "'$DIR' does not exist."
  echo "Creating '$DIR' ..."
  mkdir $DIR 
  cd $DIR
fi

# Downlaod the zipped package
echo "Downloading $PKG..."
wget $FONT

# Unzip the package
echo "Unzipping $PKG..."
unzip $PKG

echo "Removing $PKG because we don't need it anymore..."
rm $PKG

# Update the font path
echo "Updating fc-cache path to add $DIR..."
fc-cache -fv $DIR 

# Move to home directory
cd
