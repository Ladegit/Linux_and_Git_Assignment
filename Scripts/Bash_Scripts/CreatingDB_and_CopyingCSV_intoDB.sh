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


# List of CSV files
declare -a csv_files=("accounts" "orders" "region" "sales_rep" "web_events")

# Function to copy CSV into PostgreSQL
copy_csv_to_db() {
    local table_name=$1
    local csv_path="path/to/csv/$table_name.csv"

    # Check if the CSV file exists
    if [ -f "$csv_path" ]; then
        # Copy CSV file into the PostgreSQL table
        psql -h "$HOST_IP" -U "$USER" -p "$PORT" -d "$DB_NAME" -c "\COPY $table_name FROM '$csv_path' DELIMITER ',' CSV HEADER;"
        if [ $? -eq 0 ]; then
            echo "Data from $csv_path successfully imported into table $table_name."
        else
            echo "Failed to import data from $csv_path into table $table_name."
            exit 1
        fi
    else
        echo "CSV file $csv_path does not exist."
        exit 1
    fi
}

# Iterate over CSV files and import each into its respective table
for csv_file in "${csv_files[@]}"
do
    copy_csv_to_db "$csv_file"
done