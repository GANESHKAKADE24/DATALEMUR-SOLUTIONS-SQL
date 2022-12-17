

--Question link: https://datalemur.com/questions/top-drugs-sold




with TAB1 AS
(
SELECT 
manufacturer,
drug,units_sold,
row_number()
over(PARTITION BY manufacturer order by units_sold desc ) as ran
FROM pharmacy_sales)

SELECT
manufacturer,
drug
from tab1
where ran in (1,2)
order by 1 asc
;
