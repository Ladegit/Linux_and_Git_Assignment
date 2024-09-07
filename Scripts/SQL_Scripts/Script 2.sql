/*Write a query that returns a list of orders where the standard_qty is zero and either the gloss_qty or poster_qty is over 1000*/

select id from public.orders where standard_qty =0 and gloss_qty >1000 or poster_qty >1000;