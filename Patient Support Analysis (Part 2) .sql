Question Link- https://datalemur.com/questions/uncategorized-calls-percentage

answer:

SELECT
  ROUND(100.0 * 
    SUM(CASE WHEN call_category IS NULL OR call_category = 'n/a'
      THEN 1
      ELSE 0
      END)
    /COUNT(*), 1) AS uncategorised_call_pct
FROM callers
