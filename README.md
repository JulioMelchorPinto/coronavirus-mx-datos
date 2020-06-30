# coronavirus-mx-datos

A collection of BASH Scripts to decompose data from mexican official source related to [COVID-19](https://www.gob.mx/salud/documentos/datos-abiertos-152127). The data is daily updated and delivered as a ZIP compresed file, while most cloud and web based data analysis tools needs to be feeded in raw text formats like ASCI, CSV or JSON.

## fetch.sh

Download ZIP files and decompress them into CSV directory

If a "Permission Denial" error ocurred, give the file execution privilegies:

```bash
chmod +x fetch.sh
```

If the excecution is interrupted, you can run again the script to fix missing downloads.

## dictionary.sh

Download the dictionary of data and the description of fields.
