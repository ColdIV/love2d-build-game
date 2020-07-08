#!/bin/sh
# @ColdIV
cd game


# zip files for linux
zip -9 -q -r game.love .
# create temp folders for win32 and 64
mkdir -p tmp
mkdir -p tmp/win32
mkdir -p tmp/win64
# create the exe files for both win32 and 64 and copy them in their folder
mv game.love tmp/
cat ../win32/love.exe tmp/game.love > tmp/win32/game32.exe
cat ../win64/love.exe tmp/game.love > tmp/win64/game64.exe
cp ../win32/dll/* tmp/win32/
cp ../win64/dll/* tmp/win64/
# zip files for both win32 and 64
cd tmp/win32
zip -9 -q -r game32.zip .
cd ../win64
zip -9 -q -r game64.zip .
# copy files to publish folder
cd ../../
mv tmp/game.love ../publish/
mv tmp/win32/game32.zip ../publish/
mv tmp/win64/game64.zip ../publish/
# remove temp files/folder
rm tmp/win32/*
rm tmp/win64/*
rmdir tmp/win32
rmdir tmp/win64
rmdir tmp
# create version for linux without love2d
cp ../publish/game.love ../tar.gz/lld-0.9.2/bin/game.love
cd ../tar.gz/lld-0.9.2/
#tar -cvzf game.tar.gz * > /dev/null
# zip it
zip -9 -q -r game.zip .
#mv game.tar.gz ../../publish/game.tar.gz
mv game.zip ../../publish/game.zip
# remove game.love
rm bin/game.love

