-- AGGREGATE
/* 1. Write a query that determines how many times each vendor has rented a booth 
at the farmer’s market by counting the vendor booth assignments per vendor_id. */


SELECT v.vendor_id, v.vendor_name, COUNT(vba.booth_number) AS booth_count
FROM vendor v
JOIN vendor_booth_assignments vba ON v.vendor_id = vba.vendor_id
GROUP BY v.vendor_id, v.vendor_name;


--**Explanation**
-- that will join the vendor and vendor_booth_assignment table so that we can see the vendor's names, normally we can just use vendor_booth_assignment table without a join for that
-- but this time we can't see the vendor's name so this way we can see the vendor's name


/* 2. The Farmer’s Market Customer Appreciation Committee wants to give a bumper 
sticker to everyone who has ever spent more than $2000 at the market. Write a query that generates a list 
of customers for them to give stickers to, sorted by last name, then first name. 

HINT: This query requires you to join two tables, use an aggregate function, and use the HAVING keyword. */

select c.customer_id, c.customer_last_name, c.customer_first_name, 
sum(cp.cost_to_customer_per_qty*cp.quantity) as total_spent
from customer c
join customer_purchases cp on c.customer_id=cp.customer_id
group by c.customer_id,c.customer_last_name,c.customer_first_name
having total_spent>2000
order by c.customer_last_name, c.customer_first_name;

--*Explanation
-- I have joined the customer and customer purchases table to be able to see the customer's last name and first name
-- we need to use the having to filter the spent that is more than $2000
-- Also I have created a new column that will calculate the total spent by multiplying the cost to the customer and the total quantity they have purchase
-- Lastly, we order by last name and then first name which is asked in the question, I also added the customer in the filtered table to distungish the cusotmer better if there is anyone has same name and surname

--Temp Table
/* 1. Insert the original vendor table into a temp.new_vendor and then add a 10th vendor: 
Thomass Superfood Store, a Fresh Focused store, owned by Thomas Rosenthal

HINT: This is two total queries -- first create the table from the original, then insert the new 10th vendor. 
When inserting the new vendor, you need to appropriately align the columns to be inserted 
(there are five columns to be inserted, I've given you the details, but not the syntax) 

-> To insert the new row use VALUES, specifying the value you want for each column:
VALUES(col1,col2,col3,col4,col5) 
*/


-- Create temp table name new_vendor from the vendor table
DROP TABLE IF EXISTS new_vendor;
CREATE TEMP TABLE new_vendor AS
SELECT * FROM vendor;

-- Insert the 10th vendor into the temp new_vendor table
INSERT INTO new_vendor
VALUES (10, 'Thomass Superfood Store', 'Fresh Focused', 'Thomas', 'Rosenthal');



-- Date
/*1. Get the customer_id, month, and year (in separate columns) of every purchase in the customer_purchases table.

HINT: you might need to search for strfrtime modifers sqlite on the web to know what the modifers for month 
and year are! */


SELECT customer_id,
       STRFTIME('%m', market_date) AS month,
       STRFTIME('%Y', market_date) AS year
FROM customer_purchases;

-- Create separate columns as month and year to see the purchases

/* 2. Using the previous query as a base, determine how much money each customer spent in April 2019. 
Remember that money spent is quantity*cost_to_customer_per_qty. 

HINTS: you will need to AGGREGATE, GROUP BY, and filter...
but remember, STRFTIME returns a STRING for your WHERE statement!! */

SELECT customer_id,
	   SUM(cost_to_customer_per_qty * quantity) AS total_spent_in_April_2019
FROM customer_purchases
WHERE STRFTIME('%m', market_date)= '04' AND STRFTIME('%Y', market_date) = '2019'
GROUP BY customer_id;

-- In some other homeworks it has stating that is for 2022 which makes sense because there is nothing for 2019 in the db. so alternatively

SELECT customer_id,
	   SUM(cost_to_customer_per_qty * quantity) AS total_spent_in_April_2022
FROM customer_purchases
WHERE STRFTIME('%m', market_date)= '04' AND STRFTIME('%Y', market_date) = '2022'
GROUP BY customer_id;

-- we can chaneg the code above if we want to do such a filtering

