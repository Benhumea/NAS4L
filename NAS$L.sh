#!/bin/bash

echo "
 __      __        .__   __   .__ 
/  \    /  \_____  |  | |  | _|__|
\   \/\/   /\__  \ |  | |  |/ /  |
 \        /  / __ \|  |_|    <|  |
  \__/\  /  (____  /____/__|_ \__|
       \/        \/          \/   
NA&S4L
Number Analizer and Selector for Mexican Lotteri
"

sleep 1
input_file=""
option_given=false

while getopts "a:" opt; do
  case $opt in
    a)
      input_file="$OPTARG"
      option_given=true
      ;;
    \?)
      echo "Opción inválida: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

if [[ $option_given = false ]]; then
  echo "No proporsionaste el archivo de entrada con la opcion -a."
  sleep 2
  exit 1
else
  echo "El archivo de entrada es: $input_file"
fi

# Resto del código de tu script



function bycolumn {
    
    analisis=$(awk -F',' 'NR > 1 {for (i=3; i<=8; i++) a[i][$i]++} END {for (i=3; i<=8; i++) {max=0; num=""; for(j in a[i]) {if(a[i][j] > max) {max = a[i][j]; num = j}} print "El número que más aparece en la columna F" (i-2) " es:", num}}' "$1")
    echo "Estos son los numeros que mas aparecen por columna"
    echo "$analisis"
}

function everytime {
     
     analisis=$(awk -F',' 'NR > 1 {for (i=3; i<=8; i++) a[$i]++} END {for (i in a) {if (a[i] > max) {max = a[i]; num = i}} print "Los 6 números que más aparecen en el rango de columnas F1 a F6 son:"; n=asorti(a, sorted); count=0; for (i=n; i>=1; i--) {if (count >= 6) break; print sorted[i]; count++}}' "$1")
     echo "......................................................................."
     echo "$analisis"
}

function less {

     analisis=$(awk -F',' 'NR > 1 {for (i=3; i<=8; i++) a[$i]++} END {for (i in a) {if (a[i] < min || min == 0) {min = a[i]; num = i}} print "Los 6 números que menos aparecen en el rango de columnas F1 a F6 son:"; n=asorti(a, sorted); count=0; for (i=1; i<=n; i++) {if (count >= 6) break; print sorted[i]; count++}}' "$1")
     echo "......................................................................."
     echo "$analisis"
}

#read -p "Ingresa el nombre del archivo de enlaces: " input_file


bycolumn "$input_file"
everytime "$input_file"
less "$input_file"
