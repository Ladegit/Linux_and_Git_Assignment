/*Provide a table that shows the region for each sales rep along with their associated accounts. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) by account name.*/ 
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