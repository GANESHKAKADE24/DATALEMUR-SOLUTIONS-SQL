
/* Question link- https://datalemur.com/questions/sql-highest-grossing


Question-

Assume you are given the table containing information on Amazon customers and their spending on products in various categories.

Identify the top two highest-grossing products within each category in 2022. Output the category, product, and total spend.

product_spend Table:
Column Name	Type
category	string
product	string
user_id	integer
spend	decimal
transaction_date	timestamp
product_spend Example Input:
category	product	user_id	spend	transaction_date
appliance	refrigerator	165	246.00	12/26/2021 12:00:00
appliance	refrigerator	123	299.99	03/02/2022 12:00:00
appliance	washing machine	123	219.80	03/02/2022 12:00:00
electronics	vacuum	178	152.00	04/05/2022 12:00:00
electronics	wireless headset	156	249.90	07/08/2022 12:00:00
electronics	vacuum	145	189.00	07/15/2022 12:00:00
Example Output:
category	product	total_spend
appliance	refrigerator	299.99
appliance	washing machine	219.80
electronics	vacuum	341.00
electronics	wireless headset	249.90 */

Answer-

with tab1 as (

SELECT 
category,product,
sum(spend) as total_spend,
row_number()  
over(PARTITION BY category order by sum(spend) desc) as ran
FROM product_spend
where extract(year from transaction_date) ='2022'
group by 1,2
)

SELECT
category,product,total_spend
from tab1
where ran<3
;
