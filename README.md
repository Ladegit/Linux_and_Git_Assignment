# You have been hired as a new Data Engineer at CoreDataEngineers. The CoreDataEngineers infrastructure is based on the Linux Operating System. Your manager has tasked you with the responsibility of managing the company’s data infrastructure and version control tool.
# Task 1
Your manager has assigned you the task of building a Bash script (use only bash scripting) that performs a simple ETL process:
Extract: Download a CSV file. You can access the CSV using this link. Save it into a folder called raw. Your script should confirm that the file has been saved into the raw folder.

Transform: After downloading the file, perform a simple transformation by renaming the column named Variable_code to variable_code. Then, select only the following columns: year, Value, Units, variable_code. Save the content of these selected columns into a file named 2023_year_finance.csv. This file should be saved in a folder called Transformed, your Bash script should confirm that it was loaded into the folder.

Load: Load the transformed data into a directory named Gold. Also, confirm that the file has been saved into the folder.

Note: Use environment variables for the URL, and call it in your script. Write a well-detailed script, add sufficient comments to the script, and print out information for each step.

# Below is the step by step process I followed to execute the task

-I created a bash script with specific commands to execute the Extraction, Transform and Load tasks. 
# Step 1 - Extract
-My first command was to create directories
mkdir -p raw Transformed Gold

-I proceeded to extract the provided file using these commands
echo "Extracting data from $URL..."
curl -o raw/data.csv "$URL"
-I added a command to check if the file was downloaded
if [ -f raw/data.csv ]; then
     echo "File downloaded to raw/ folder."
else
   echo "Failed to download file."
   exit 1
fi
# Step 2 - Transform
-I proceeded to transform the file and load it into Transformed directory with this command
awk -F, 'BEGIN { OFS="," } 
NR==1 { for (i=1; i<=NF; i++) $i=tolower($i) } 
{ print $1, $5, $6, $9 }' raw/data.csv > "Transformed/2023_year_finance.csv"

# Step 3: Load into Gold folder
-I loaded the transformed file from Transformed folder into Gold folder using this command
cp "Transformed/2023_year_finance.csv" Gold/




# You have been hired as a new Data Engineer at CoreDataEngineers. The CoreDataEngineers infrastructure is based on the Linux Operating System. Your manager has tasked you with the responsibility of managing the company’s data infrastructure and version control tool.
# Task 1
Your manager has assigned you the task of building a Bash script (use only bash scripting) that performs a simple ETL process:
Extract: Download a CSV file. You can access the CSV using this link. Save it into a folder called raw. Your script should confirm that the file has been saved into the raw folder.

Transform: After downloading the file, perform a simple transformation by renaming the column named Variable_code to variable_code. Then, select only the following columns: year, Value, Units, variable_code. Save the content of these selected columns into a file named 2023_year_finance.csv. This file should be saved in a folder called Transformed, your Bash script should confirm that it was loaded into the folder.

Load: Load the transformed data into a directory named Gold. Also, confirm that the file has been saved into the folder.

Note: Use environment variables for the URL, and call it in your script. Write a well-detailed script, add sufficient comments to the script, and print out information for each step.

# Below is the step by step process I followed to execute the task

-I created a bash script with specific commands to execute the Extraction, Transform and Load tasks. 
# Step 1 - Extract
-My first command was to create directories
mkdir -p raw Transformed Gold

-I proceeded to extract the provided file using these commands
echo "Extracting data from $URL..."
curl -o raw/data.csv "$URL"
-I added a command to check if the file was downloaded
if [ -f raw/data.csv ]; then
     echo "File downloaded to raw/ folder."
else
   echo "Failed to download file."
   exit 1
fi

# Step 2 - Transform
-I proceeded to transform the file and load it into Transformed directory with this command
awk -F, 'BEGIN { OFS="," } 
NR==1 { for (i=1; i<=NF; i++) $i=tolower($i) } 
{ print $1, $5, $6, $9 }' raw/data.csv > "Transformed/2023_year_finance.csv"

# Step 3: Load into Gold folder
-I loaded the transformed file from Transformed folder into Gold folder using this command
cp "Transformed/2023_year_finance.csv" Gold/


# Task 2
Your manager has asked you to schedule the script to run daily using cron jobs (research this). Schedule the script to run every day at 12:00 AM.
I used the following command to schedule the script to run daily by 12AM

MIN HOUR DOM MON DOW CMD
crontab -e
0 0 * * * C:\Lade\Linux and Git\Git_Assignment\CDE_Git_Assignment_OmoladeBisiriyu_.sh
0 0 * * * . $HOME/.profile; C:\Lade\Linux and Git\Git_Assignment\CDE_Git_Assignment_OmoladeBisiriyu_.sh


# Task 3 
Write a Bash script to move all CSV and JSON files from one folder to another folder named json_and_CSV. Use any Json and CSV of your choice, the script should be able to work with one or more Json and CSV files.

I wrote this bash script below to do the task

#!/bin/bash

# Define the source and destination directories
sample_data="C:\Lade\Linux and Git\Git_Assignment\sample_data" 
json_and_csv="C:\Lade\Linux and Git\Git_Assignment"  

# Create the destination directory if it does not exist
if [ ! -d "$json_and_csv" ]; then
    mkdir -p "$json_and_csv"
    echo "Created directory: $json_and_csv"
fi

# Move all CSV and JSON files from the source directory to the destination directory
echo "Moving CSV and JSON files from $sample_data to $json_and_csv..."
mv "$sample_data"/*.csv "$json_and_csv"
mv "$sample_data"/*.json "$json_and_csv"

echo "Move complete."

# Task 4
# CoreDataEngineers is diversifying into the sales of goods and services. To understand the market, your organization needs to analyze their competitor, Parch and Posey. Download the CSV file using this link to your local PC. After downloading, do the following:

Write a Bash script that iterates over and copies each of the CSV files into a PostgreSQL database (name the database posey).

After this, write SQL scripts with detailed comments to answer the following questions posed by your manager (Ayoola):

/* Find a list of order IDs where either gloss_qty or poster_qty is greater than 4000. Only include the id field in the resulting table. */

/* Write a query that returns a list of orders where the standard_qty is zero and either the gloss_qty or poster_qty is over 1000. */

/* Find all the company names that start with a 'C' or 'W', and where the primary contact contains 'ana' or 'Ana', but does not contain 'eana'. */

/* Provide a table that shows the region for each sales rep along with their associated accounts. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) by account name. */

# A. I wrote this bash script to iterate over and copy each of these csv files into a PostgreSQL database
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


# B. # Below are the scripts that I used to answer the questions given by my manager - Ayoola

/*Script 1
Find a list of order IDs where either gloss_qty or poster_qty is greater than 4000. Only include the id field in the resulting table*/

select id from public.orders where gloss_qty >4000 or poster_qty >4000;


/*Scripts 2
Write a query that returns a list of orders where the standard_qty is zero and either the gloss_qty or poster_qty is over 1000*/

select id from public.orders where standard_qty =0 and gloss_qty >1000 or poster_qty >1000;


/*Scripts 3
Find all the company names that start with a 'C' or 'W', and where the primary contact contains 'ana' or 'Ana', but does not contain 'eana'.*/
SELECT * 
FROM public.accounts 
WHERE 
    (name LIKE 'C%' OR name LIKE 'W%') 
    AND 
    (primary_poc LIKE '%ana%' OR primary_poc LIKE 'Ana%')
    AND 
    primary_poc NOT LIKE '%eana%';


/*Scripts 4
Provide a table that shows the region for each sales rep along with their associated accounts. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) by account name.*/ 
WITH t1 AS (
    SELECT 
        a.name AS region_name, 
        b.name AS sales_rep_name, 
        c.name AS account_name
    FROM 
        region a
        LEFT JOIN sales_reps b ON a.id = b.region_id
        LEFT JOIN accounts c ON b.id = c.sales_rep_id
		order by account_name
)
SELECT * FROM t1;





