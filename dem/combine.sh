#!/bin/sh
if [ ! -f "shetland-dem.tiff" ]; then
  cd parts
  for file in `ls *.zip`; do
    unzip "$file"
  done
  # gdal_merge.py -o ../shetland-dem.tiff -n 0 -co COMPRESS=LZW `ls *.asc`
  gdalwarp -co COMPRESS=LZW `ls *.asc` ../shetland-dem.tiff
  cd ..
fi
#gdalwarp -co "BIGTIFF=YES" -dstalpha -cutline dtm20m_ext_vg94.shp dtm20m-3785-hs.tif dtm20m-3785-hs-cut.tif
# any z between 2 and 5 looks nice
gdaldem hillshade shetland-dem.tiff shetland-hillshade.tiff -combined -z 4
