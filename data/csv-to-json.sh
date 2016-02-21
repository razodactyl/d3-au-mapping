#!/usr/bin/env bash

## Utils

install_csvtojson() {
  echo ""
  echo "Warning: 'csvtojson' package is not installed..."
  echo "Running the following:"
  echo "  npm i -g csvtojson"
  echo ""
  npm i -g csvtojson
}

convert_csv_to_json() {
  csv=$1
  json=$(echo "$csv" | sed -e "s/csv/json/")

  echo -n "  ⟲ $csv > $json"
  csvtojson $csv > $json || \
    (echo "Error, exiting..." && exit)
  echo -e \\r"  ✔ $csv > $json"
}

## Program

echo "Converting csv files in $(pwd) to json."

# Install csvtojson if necesarry.
which csvtojson >& /dev/null || (install_csvtojson 'hello' || exit)

# Convert the csv.
echo "Converting..."
echo ""
for csv in $(ls | grep .csv | xargs -0); do convert_csv_to_json $csv; done
echo ""
echo "All done!"
