#!/bin/bash
#outfile=$1
echo "getting movie title:"
outfile=`makemkvcon info -r disc:0 | grep BD | awk -F, '{print $6}' | sed 's/\"//g' | sed 's/ /-/g' | head -n 1`
title=`echo $outfile | sed -e 's/_/ /g'`
#add something to catch the case where $outfile = LOGICAL_VOLUME_ID and do the right thing

tmpdir="/mnt/backup/tmp"
echo $outfile $title
# add a check so that if the file exists and is more than 200M then we just exit here #
echo "backing up and decrypting $title:"
#echo "makemkvcon --minlength=1800 -r --decrypt --cache=2048 --progress=$tmpdir/movie.log backup disc:0 $tmpdir/$outfile"
makemkvcon --minlength=1800 -r --decrypt --cache=2048 --progress=$tmpdir/movie.log backup disc:0 $tmpdir/$outfile
echo "encoding $title:"
HandBrakeCLI -i $tmpdir/$outfile/ --main-feature -s 1 -m -q 1 -o $tmpdir/$outfile.mkv

#add support for the rsync
#rsync -vazg $tmpdir/*.mkv mythbackend:/var/lib/mythtv/videos/

#just use scp
scp -i ~/.ssh/utility $tmpdir/$outfile.mkv mythbackend:/var/lib/mythtv/videos

#add support for the notification
curl "http://cloverleaf/say/$title has been copied and is now available for viewing"