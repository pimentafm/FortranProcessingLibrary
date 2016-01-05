#!/bin/bash
#1975,1985,1991,1995,2001,2007,2010,2013
for i in {1990..2010}; do
  input='/home/fernando/Documents/dados_nc_test/correcoes/taxalocacao/micro/PRODUTIVIDADEGADO_micro_'$i'v3.nc'
  output='/home/fernando/Documents/dados_nc_test/correcoes/taxalocacao/micro/progadomicroCorrigido/stockingRate_micro_'$i'.nc'
 
echo $i
  
  ./a.out $input $output

done

