#!/bin/sh
#unzip terr50_gagg_gb.zip data && cd data
#cd data
#for dir in `ls`; do
#  echo $dir
#  cd $dir
#  for file in `ls`; do
#    echo $file
#    unzip -o $file # && rm $file
#  done
#  gdalwarp -of GTiff -co COMPRESS=LZW `ls *.asc` "../$dir.tiff" || exit 1
#  cd ..
#done

#gdalwarp -of GTiff -co COMPRESS=LZW `ls *.tiff` ../dem.tiff
#cd ..
gdaldem hillshade dem.tiff hillshade.tiff -combined -z 5
