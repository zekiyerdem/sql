-- COALESCE
/* 1. Our favourite manager wants a detailed long list of products, but is afraid of tables! 
We tell them, no problem! We can produce a list with all of the appropriate details. 

Using the following syntax you create our super cool and not at all needy manager a list:

SELECT 
product_name || ', ' || product_size|| ' (' || product_qty_type || ')'
FROM product

But wait! The product table has some bad data (a few NULL values). 
Find the NULLs and then using COALESCE, replace the NULL with a 
blank for the first problem, and 'unit' for the second problem. 

HINT: keep the syntax the same, but edited the correct components with the string. 
The `||` values concatenate the columns into strings. 
Edit the appropriate columns -- you're making two edits -- and the NULL rows will be fixed. 
All the other rows will remain the same.) */

SELECT
product_name || ', ' || 
coalesce(product_size,'')|| ' (' || 
coalesce(product_qty_type, 'unit') || ')' as product_list
FROM product

-- COALESCE(product_size, '') replaces NULL in product_size with a blank.
-- COALESCE(product_qty_type, 'unit') replaces NULL in product_qty_type with 'unit'.

--Windowed Functions
/* 1. Write a query that selects from the customer_purchases table and numbers each customer’s  
visits to the farmer’s market (labeling each market date with a different number). 
Each customer’s first visit is labeled 1, second visit is labeled 2, etc. 

You can either display all rows in the customer_purchases table, with the counter changing on
each new market date for each customer, or select only the unique market dates per customer 
(without purchase details) and number those visits. 
HINT: One of these approaches uses ROW_NUMBER() and one uses DENSE_RANK(). */

select customer_id, market_date
,ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY market_date) as customer_visits
from customer_purchases


-- ROW_NUMBER() gives each customer's visits a sequential number starting at 1, ordering by the market_date.
-- PARTITION BY customer_id makes sure the numbering starts fresh for each customer.
--DENSE_RANK() will give numbers not increasing for each visit it will remain same for the same dates and increase by when dates changed for each customer. 
--with row_number you cna easily see each customer makes how many visits in total between those dates.


/* 2. Reverse the numbering of the query from a part so each customer’s most recent visit is labeled 1, 
then write another query that uses this one as a subquery (or temp table) and filters the results to 
only the customer’s most recent visit. */

SELECT *
FROM(

select customer_id, market_date
,ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY market_date DESC) as customer_visits_ordered
from customer_purchases
) x

where x.customer_visits_ordered=1;


/* 3. Using a COUNT() window function, include a value along with each row of the 
customer_purchases table that indicates how many different times that customer has purchased that product_id. */

select customer_id, product_id
,COUNT(*) OVER (PARTITION BY customer_id, product_id) AS purchase_count
from customer_purchases

--COUNT(*) counts the total number of times each customer has purchased each product_id.

-- String manipulations
/* 1. Some product names in the product table have descriptions like "Jar" or "Organic". 
These are separated from the product name with a hyphen. 
Create a column using SUBSTR (and a couple of other commands) that captures these, but is otherwise NULL. 
Remove any trailing or leading whitespaces. Don't just use a case statement for each product! 

| product_name               | description |
|----------------------------|-------------|
| Habanero Peppers - Organic | Organic     |

Hint: you might need to use INSTR(product_name,'-') to find the hyphens. INSTR will help split the column. */

SELECT 
  product_name, 
  CASE 
    WHEN INSTR(product_name, '-') > 0 
    THEN LTRIM(RTRIM(SUBSTR(product_name, INSTR(product_name, '-') + 1)))
    ELSE NULL
  END AS description
FROM product;

-- Explanation:
-- INSTR(product_name, '-') > 0: Checks if there is a hyphen in the product_name.
-- THEN LTRIM(RTRIM(SUBSTR(product_name, INSTR(product_name, '-') + 1))): If a hyphen is found, it extracts the description after the hyphen, removing any extra spaces using LTRIM() and RTRIM.
-- ELSE NULL: If no hyphen is found, it returns NULL for the description.

/* 2. Filter the query to show any product_size value that contain a number with REGEXP. */

SELECT product_size
FROM product
WHERE product_size REGEXP '[0-9]';

-- UNION
/* 1. Using a UNION, write a query that displays the market dates with the highest and lowest total sales.

HINT: There are a possibly a few ways to do this query, but if you're struggling, try the following: 
1) Create a CTE/Temp Table to find sales values grouped dates; 
2) Create another CTE/Temp table with a rank windowed function on the previous query to create 
"best day" and "worst day"; 
3) Query the second temp table twice, once for the best day, once for the worst day, 
with a UNION binding them. */

-- Step 1: Create a CTE to group sales by market date
DROP TABLE IF EXISTS sales_values;

CREATE TEMP TABLE sales_values as

SELECT market_date
,SUM(quantity * cost_to_customer_per_qty) AS total_sales
FROM customer_purchases
GROUP BY market_date;

-- Step 2: Create a CTE that ranks the market dates by total sales (both ascending and descending)

DROP TABLE IF EXISTS best_day_worst_day;

CREATE TEMP TABLE best_day_worst_day as

SELECT market_date, total_sales 
,RANK() OVER (ORDER BY total_sales DESC) AS rank_best_day
,RANK() OVER (ORDER BY total_sales ASC) AS rank_worst_day
    FROM sales_values;

-- Step 3: Use a UNION to combine the highest and lowest sales day

SELECT market_date, total_sales, 'Best Day' AS day_type
FROM best_day_worst_day
WHERE rank_best_day = 1

UNION

SELECT market_date, total_sales, 'Worst Day' AS day_type
FROM best_day_worst_day
WHERE rank_worst_day = 1



