#!/bin/bash
# @ColdIV
cd game


# zip files for linux
echo "Creating love file"
zip -9 -q -r game.love .
# create temp folders for win32 and 64
echo "Creating tmp directories for win32 and win64"
mkdir -p tmp
mkdir -p tmp/win32
mkdir -p tmp/win64
# create the exe files for both win32 and 64 and copy them in their folder
echo "Creating exe for win32 and win64"
mv game.love tmp/
cat ../win32/love.exe tmp/game.love > tmp/win32/game32.exe
cat ../win64/love.exe tmp/game.love > tmp/win64/game64.exe
cp ../win32/dll/* tmp/win32/
cp ../win64/dll/* tmp/win64/
# zip files for both win32 and 64
echo "Zipping files for win32 and win64"
cd tmp/win32
zip -9 -q -r game32.zip .
cd ../win64
zip -9 -q -r game64.zip .
# copy files to publish folder
echo "Copying win32 and win64 archives to publish directory"
cd ../../
mv tmp/game.love ../publish/
mv tmp/win32/game32.zip ../publish/
mv tmp/win64/game64.zip ../publish/
# remove temp files/folder
echo "Removing tmp directory"
rm tmp/win32/*
rm tmp/win64/*
rmdir tmp/win32
rmdir tmp/win64
rmdir tmp
# create version for linux without love2d
echo "Creating version for linux systems"
cp ../publish/game.love ../tar.gz/lld-11.3/bin/game.love
cd ../tar.gz/lld-11.3/
#tar -cvzf game.tar.gz * > /dev/null
# zip it
echo "Zipping files for linux systems"
zip -9 -q -r game.zip .
#mv game.tar.gz ../../publish/game.tar.gz
echo "Moving linux archive to publish directory"
mv game.zip ../../publish/game.zip
# remove game.love
echo "Removing tmp file"
rm bin/game.love
echo "Done"

