#!/bin/bash

#1975,1985,1991,1995,2001,2007,2010,2013
input=/home/fernando/Documents/_RASTER/MAPS_30ARCSEC/area_plantada_sojaMilhoCana/correcaFill/

crop=LUCULTCANA

outputSOJA=/home/fernando/correcoes/plantedArea_soybean
outputMILHO=/home/fernando/correcoes/plantedArea_maize
outputCANA=/home/fernando/correcoes/plantedArea_suggarcane

for i in {1990..2012}; do
  echo $i
  ./a.out $input$crop$i'v3.nc' $outputCANA$i'.nc'
done
