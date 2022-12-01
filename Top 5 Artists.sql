
--Question Link: https://datalemur.com/questions/top-fans-rank

WITH RK AS (

SELECT
artist_name,

dense_rank()over(order by count(artist_name) desc )  AS artist_rank
from 
(
SELECT 

*

FROM artists A
INNER JOIN songs S 
on A.artist_id=s.artist_id
join global_song_rank g
on s.song_id=g.song_id and g.rank <11) as TAB1
GROUP BY artist_name
)

SELECT
artist_name,
artist_rank
FROM RK
WHERE artist_rank<6


;
