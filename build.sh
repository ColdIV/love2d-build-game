#!/bin/bash
# @ColdIV

# ask for game name
read -p "Enter game name [game]: " gamename
gamename=${gamename:-game}

# removing old published files
echo "Removing old published files"
rm -f publish/*
# zip files for linux
cd game
echo "Creating love file"
zip -9 -x .git/\* -x .\* -q -r ${gamename}.love .
# create temp folders for win32 and 64
echo "Creating tmp directories for win32 and win64"
mkdir -p tmp
mkdir -p tmp/win32
mkdir -p tmp/win64
# create the exe files for both win32 and 64 and copy them in their folder
echo "Creating exe for win32 and win64"
mv ${gamename}.love tmp/
cat ../win32/love.exe tmp/${gamename}.love > tmp/win32/${gamename}32.exe
cat ../win64/love.exe tmp/${gamename}.love > tmp/win64/${gamename}64.exe
cp ../win32/dll/* tmp/win32/
cp ../win64/dll/* tmp/win64/
# zip files for both win32 and 64
echo "Zipping files for win32 and win64"
cd tmp/win32
zip -9 -q -r ${gamename}32.zip .
cd ../win64
zip -9 -q -r ${gamename}64.zip .
# copy files to publish folder
echo "Copying win32 and win64 archives to publish directory"
cd ../../
mv tmp/${gamename}.love ../publish/
mv tmp/win32/${gamename}32.zip ../publish/
mv tmp/win64/${gamename}64.zip ../publish/
# remove temp files/folder
echo "Removing tmp directory"
rm tmp/win32/*
rm tmp/win64/*
rmdir tmp/win32
rmdir tmp/win64
rmdir tmp
# create version for linux without love2d
echo "Creating version for linux systems"
cp ../publish/${gamename}.love ../tar.gz/lld-11.3/bin/game.love
cd ../tar.gz/lld-11.3/
#tar -cvzf game.tar.gz * > /dev/null
# zip it
echo "Zipping files for linux systems"
zip -9 -q -r ${gamename}.zip .
#mv game.tar.gz ../../publish/game.tar.gz
echo "Moving linux archive to publish directory"
mv ${gamename}.zip ../../publish/${gamename}.zip
# remove game.love
echo "Removing tmp file"
rm bin/game.love
echo "Done"

