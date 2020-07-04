#!/bin/bash
##
begin=2020-04-12
today=$(date -I -d today)
now=$(date +"%y%m%d" -d "$begin")
end=$(date +"%y%m%d" -d "$today")
data_dir="data/csv/"
output="$data_dir""nacional.json"
if [ -f "$output" ]; then
    echo " - Deleting existing output file '$output'"
    rm -f "$output"
fi
echo " + Creating output file '$output'"
echo '{[' >>"$data_dir"nacional.json
while [ "$now" != "$end" ]; do
    date_formated=$(date +"%m-%d-%Y" -d "$now")
    input="$data_dir""$now"COVID19MEXICO.csv
    if [ -f "$input" ]; then
        echo " - Reading file '$input'"
    else
        echo "Error: Missing CSV file. You need to run './fetch.sh' first"
        exit
    fi
    temp_result="$data_dir"$now"nacional.csv"
    if [ -f "$temp_result" ]; then
        echo "File '$temp_result' already exist"
    else
        echo " + Writing temp file '$temp_result' file for date: ""$date_formated"
        csvtool namedcol RESULTADO "$input" >"$temp_result"
    fi

    echo " + Writing 'national.json' file for date: ""$date_formated"
    echo '{ "date":"'"$date_formated"'",' >>"$data_dir"nacional.json
    echo '"nacional":' >>"$data_dir"nacional.json
    csvstat --freq "$temp_result" >>"$data_dir"nacional.json
    echo '},' >>"$data_dir"nacional.json
    now=$(date +"%y%m%d" -d "$now + 1 day")
done
echo ']}' >>"$data_dir"nacional.json
echo " ====> Generate file complete: 'national.json' from date: ""$begin"" to date: ""$date_formated"
cp "$data_dir"nacional.json timeseries/acumul/"nacional.json"
exit
