#!/bin/bash

cd $(dirname $0)
wget http://ufool.square7.ch/download/ufool.zip
rm bin/*
rm lib/*
rm license
rm run.sh
unzip -u ufool.zip
rm ufool.zip
sh run.sh