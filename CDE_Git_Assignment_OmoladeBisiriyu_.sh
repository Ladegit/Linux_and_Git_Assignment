# #!/bin/bash

# # Define environment variable for the URL
# URL="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"

# # Create directories
# mkdir -p raw Transformed Gold

# # Step 1: Extract
# echo "Extracting data from $URL..."
# curl -o raw/data.csv "$URL"

# # Check if the file was downloaded
# if [ -f raw/data.csv ]; then
#     echo "File downloaded to raw/ folder."
# else
#     echo "Failed to download file."
#     exit 1
# fi
# 

# awk -F, 'BEGIN { OFS="," } 
# NR==1 { for (i=1; i<=NF; i++) $i=tolower($i) } 
# { print $1, $5, $6, $9 }' raw/data.csv > "Transformed/2023_year_finance.csv"

# cp "Transformed/2023_year_finance.csv" Gold/


#!/bin/bash
#variables declaration from Postgres Server
#!/bin/bash

# Configuration variables
HOST_IP="localhost"
USER="postgres"
PORT="5432"
PASSWORD="Ladey400*"

# Export password for PostgreSQL authentication
export PGPASSWORD="$PASSWORD"

# Function to execute PostgreSQL command
execute_psql() {
    psql -h "$HOST_IP" -U "$USER" -p "$PORT" -c "$1"
}

# Attempt to connect to the database
execute_psql "\q"
if [ $? -eq 0 ]; then
    echo "DB connected"
else
    echo "Failed Connection"
    exit 1
fi

# Attempt to create a new database
execute_psql "CREATE DATABASE POSEY;"
if [ $? -eq 0 ]; then
    echo "POSEY db created"
else
    echo "Failed to create"
    exit 1
fi
