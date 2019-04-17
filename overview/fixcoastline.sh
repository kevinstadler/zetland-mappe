#!/bin/sh
# fix the strategi coastline feature of Great Britain (which is split into a
# number of disconnected lines with 9999 vertices each)
ogr2ogr greatbritain.shp strtgi_essh_gb/data/coastline.shp -where "fid >= 317 AND fid <= 326" # alternative: try SELECT rowid
ogr2ogr greatbritainmerged.shp greatbritain.shp -dialect sqlite -sql "SELECT ST_Union(geometry) AS geometry FROM greatbritain" -nlt LINESTRING

ogr2ogr -overwrite -skipfailures coastline.shp strtgi_essh_gb/data/coastline.shp -nlt POLYGON
ogr2ogr -update -append coastline.shp greatbritainmerged.shp -nlt POLYGON
