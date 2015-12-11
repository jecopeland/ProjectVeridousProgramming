#!/bin/bash

export HASH=`git log -1 --format="%H"`

ncftp << EOF
open -u $FTP_USER -p $FTP_PASSWORD $FTP_SITE
mkdir $FTP_BIN
mkdir $FTP_BIN/hxcpp
mkdir $FTP_BIN/hxcpp/$HASH
cd $FTP_BIN/hxcpp/$HASH
put -R bin lib
quit
EOF