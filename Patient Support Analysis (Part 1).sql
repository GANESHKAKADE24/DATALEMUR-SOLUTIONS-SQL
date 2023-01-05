-- Question

Answer

select
count(*)
from 
(
  SELECT
  policy_holder_id,
  count(policy_holder_id)
  from callers 
  GROUP BY 1
  having count(policy_holder_id) > 2
 ) as member_count
;
