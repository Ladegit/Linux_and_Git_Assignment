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
I used the following command to schedule the script to run daily

ghk
