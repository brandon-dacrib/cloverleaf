#!/bin/bash
#outfile=$1
echo "getting movie title:"
outfile=`makemkvcon info -r disc:0 | grep BD | awk -F, '{print $6}' | sed 's/\"//g'`
tmpdir="/mnt/backup/tmp"
echo $outfile
echo "backing up and decrypting $outfile:"
makemkvcon -r --decrypt --cache=1024 --minlength=3600 --progress=$tmpdir/movie.log backup disc:0 $tmpdir/$outfile
echo "encoding $outfile:"
HandBrakeCLI -i $tmpdir/$outfile/ --main-feature -s 1 -m -q 1 -o $tmpdir/$outfile.mkv

#add support for the rsync
#rsync -vazg *.mkv mythbackend:/var/lib/mythtv/videos/
