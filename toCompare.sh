#!/bin/bash
## Bash script for fetching data from thirdparty repository
curl -L --output "data/timeseries/nuevos-casos.csv" https://raw.githubusercontent.com/mexicovid19/Mexico-datos/master/datos/series_de_tiempo/covid19_mex_casos_nuevos.csv
csv_path="data/timeseries/nuevos-casos.csv"
csvjson "$csv_path" >>estados/nuevos-casos.json

curl -L --output "data/timeseries/total-casos.csv" https://raw.githubusercontent.com/mexicovid19/Mexico-datos/master/datos/series_de_tiempo/covid19_mex_casos_totales.csv
csv_path="data/timeseries/total-casos.csv"
csvjson "$csv_path" >>estados/total-casos.json

curl -L --output "data/timeseries/total-muertes.csv" https://raw.githubusercontent.com/mexicovid19/Mexico-datos/master/datos/series_de_tiempo/covid19_mex_muertes.csv
csv_path="data/timeseries/total-muertes.csv"
csvjson "$csv_path" >>estados/total-muertes.json

curl -L --output "data/timeseries/nuevas-muertes.csv" https://raw.githubusercontent.com/mexicovid19/Mexico-datos/master/datos/series_de_tiempo/covid19_mex_muertes_nuevas.csv
csv_path="data/timeseries/nuevas-muertes.csv"
csvjson "$csv_path" >>estados/nuevas-muertes.json

curl -L --output "data/timeseries/casos-negativos.csv" https://raw.githubusercontent.com/mexicovid19/Mexico-datos/master/datos/series_de_tiempo/covid19_mex_negativos.csv
csv_path="data/timeseries/casos-negativos.csv"
csvjson "$csv_path" >>estados/casos-negativos.json

curl -L --output "data/timeseries/casos-sospechosos.csv" https://raw.githubusercontent.com/mexicovid19/Mexico-datos/master/datos/series_de_tiempo/covid19_mex_sospechosos.csv
csv_path="data/timeseries/casos-sospechosos.csv"
csvjson "$csv_path" >>estados/casos-sospechosos.json
