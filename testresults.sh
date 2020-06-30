begin=2020-04-12
today=$(date -I -d today)
now=$(date +"%Y-%m-%d" -d "$begin")
end=$(date +"%Y-%m-%d" -d "$today")
csv_dir="data/csv/"
data_dir="data"
output_name="testresult"
echo "{" >>perDay.json
while [ "$now" != "$end" ]; do
    csv_date=$(date +"%y%m%d" -d "$now")
    csv_file=$csv_date"COVID19MEXICO.csv"
    csv_path="$csv_dir$csv_file"
    echo '\"$now:\"' >>perDay.json
    csvstat --freq --columns 31 "$csv_path" >>perDay.json
    now=$(date +"%Y-%m-%d" -d "$now + 1 day")
done
