#!/bin/bash
# Desarrollado por victorem.inbox@gmail.com
# Para BioFreelancer.com
# Este script pregunta a datos covid para un pais
# 1. Cual ha sido el dia con mas casos nuevos

# El primer paso es elegir pais
pais_de_interes=$1

# Enviar mensaje de inicio
echo " Analizando datos de $pais_de_interes "

#lo hacemos pipeline
grep $pais_de_interes owid-covid-data\
| cut -f3,4,6 \
| sort -k3 -n \
| tail -n1 \
| cut -f2 > dia_mas_casos.tmp 

# Anunciamos la respuesta
echo "El dia con mas casos en $pais_de_interes fue"
cat dia_mas_casos.tmp

# Borrar archivos intermedios
rm *.tmp
