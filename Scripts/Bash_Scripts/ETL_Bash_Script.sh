#!/bin/bash

# Define environment variable for the URL
URL="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"

# Create directories
mkdir -p raw Transformed Gold

# Step 1: Extract
echo "Extracting data from $URL..."
curl -o raw/data.csv "$URL"

# Check if the file was downloaded
if [ -f raw/data.csv ]; then
     echo "File downloaded to raw/ folder."
else
   echo "Failed to download file."
   exit 1
fi

# Step 2: Transform
awk -F, 'BEGIN { OFS="," } 
NR==1 { for (i=1; i<=NF; i++) $i=tolower($i) } 
{ print $1, $5, $6, $9 }' raw/data.csv > "Transformed/2023_year_finance.csv"

#Step 3: Load into Gold folder
cp "Transformed/2023_year_finance.csv" Gold/