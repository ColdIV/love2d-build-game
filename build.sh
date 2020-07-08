#!/bin/sh
# @ColdIV
cd game


# zip files for linux
zip -9 -q -r game.love .
# create temp folders for win32 and 64
mkdir -p make
mkdir -p make/win32
mkdir -p make/win64
# create the exe files for both win32 and 64 and copy them in their folder
mv game.love make/
cat ../win32/love.exe make/game.love > make/win32/game32.exe
cat ../win64/love.exe make/game.love > make/win64/game64.exe
cp ../win32/dll/* make/win32/
cp ../win64/dll/* make/win64/
# zip files for both win32 and 64
cd make/win32
zip -9 -q -r game32.zip .
cd ../win64
zip -9 -q -r game64.zip .
# copy files to publish folder
cd ../../
mv make/game.love ../publish/
mv make/win32/game32.zip ../publish/
mv make/win64/game64.zip ../publish/
# remove temp files/folder
rm make/win32/*
rm make/win64/*
rmdir make/win32
rmdir make/win64
rmdir make
# create version for linux without love2d
cp ../publish/game.love ../tar.gz/lld-0.9.2/bin/game.love
cd ../tar.gz/lld-0.9.2/
#tar -cvzf game.tar.gz * > /dev/null
# zip it
zip -9 -q -r game.zip .
#mv game.tar.gz ../../publish/game.tar.gz
mv game.zip ../../publish/game.zip

