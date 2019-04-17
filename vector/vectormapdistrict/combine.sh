#!/bin/bash
for file in `ls HU/data/*.shp`; do
  name=`basename $file`
  name=${name:3}
  ogrmerge.py -o "VMD_$name" -single -overwrite_ds -skipfailures -progress "HP/data/HP_$name" "HT/data/HT_$name" "HU/data/HU_$name" "HZ/data/HZ_$name"
done
