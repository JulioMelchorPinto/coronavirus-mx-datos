#!/bin/bash
begin=2020-04-12
today=$(date -I -d today)
now=$(date +"%Y-%m-%d" -d "$begin")
end=$(date +"%Y-%m-%d" -d "$today")
zip_dir="data/zip"
csv_dir="data/csv"
data_dir="data"
if [ -d "$data_dir" ]; then
    echo "$data_dir directory exist"
else
    echo "creating $data_dir directory"
    mkdir "$data_dir"
fi
if [ -d "$zip_dir" ]; then
    echo "$zip_dir directory exist"
else
    echo "creating $zip_dir directory"
    mkdir "$zip_dir"
fi
if [ -d "$csv_dir" ]; then
    echo "$csv_dir directory exist"
else
    echo "creating $csv_dir directory"
    mkdir "$csv_dir"
fi
while [ "$now" != "$end" ]; do
    zip_date=$(date +"%d.%m.%Y" -d "$now")
    csv_date=$(date +"%y%m%d" -d "$now")
    now=$(date +"%Y-%m-%d" -d "$now + 1 day")
    ZIP_FILENAME="datos_abiertos_covid19_"$zip_date".zip"
    CSV_FILENAME=$csv_date"COVID19MEXICO.csv"
    if [ -f "$zip_dir/$ZIP_FILENAME" ]; then
        echo "$zip_dir/$ZIP_FILENAME exists."
    else
        ZIP_URL="http://187.191.75.115/gobmx/salud/datos_abiertos/historicos/datos_abiertos_covid19_"$zip_date".zip"
        curl -L "$ZIP_URL" --output "$zip_dir/$ZIP_FILENAME"
    fi
    if [ -f "$csv_dir/$CSV_FILENAME" ]; then
        echo "$csv_dir/$CSV_FILENAME exists."
    else
        echo "$csv_dir"/"$CSV_FILENAME"
        unzip "$zip_dir/$ZIP_FILENAME" -d "$csv_dir"
    fi
done
echo "Fetching zip file complete"
