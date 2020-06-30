#!/bin/bash
data_dir="data"
if [ -d "$data_dir" ]; then
    echo "$data_dir directory exist"
else
    echo "creating $data_dir directory"
    mkdir "$data_dir"
fi
file="diccionario_datos_covid19.zip"
URL="http://187.191.75.115/gobmx/salud/datos_abiertos/"$file
if [ -f "$data_dir/$file" ]; then
    echo "$data_dir/$file exists."
else
    curl -L "$URL" --output "$data_dir/$file"
fi
unzip "$data_dir/$file" -d "$data_dir"
