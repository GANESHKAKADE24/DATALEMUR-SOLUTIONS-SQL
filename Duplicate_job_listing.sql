


WITH TAB AS(
SELECT 
count(*) as co_w_duplicate_jobs
FROM job_listings
group by company_id,title,description
having count(*)>1
)

SELECT
COUNT(co_w_duplicate_jobs) AS co_w_duplicate_jobs
FROM TAB;