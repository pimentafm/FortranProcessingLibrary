#!/bin/bash
#1975,1985,1991,1995,2001,2007,2010,2013
for i in {1975,1985,1991,1995,2001,2007,2010,2013}; do
  input='/home/fernando/Documents/dados_nc_test/correcoes/taxalocacao/teste_produtividade_gado_LUPAST_'$i'.nc'
  output='/home/fernando/Documents/dados_nc_test/correcoes/taxalocacao/taxalotCorrigido/stockingRate_mun_'$i'.nc'
 
echo $i
  
  ./a.out $input $output

done

