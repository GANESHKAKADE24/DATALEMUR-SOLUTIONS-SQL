-- Question link- https://datalemur.com/questions/non-profitable-drugs

-- Answer_

SELECT  
manufacturer,
count(*) as drug_count,
sum(cogs-total_sales) as total_loss

FROM pharmacy_sales
where cogs> total_sales
group by 1
order by 3 DESC;
