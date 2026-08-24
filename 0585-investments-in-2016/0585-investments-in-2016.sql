WITH PolicyCounts AS (
    SELECT 
        tiv_2016,
        COUNT(*) OVER (PARTITION BY tiv_2015) AS count_tiv,
        COUNT(*) OVER (PARTITION BY lat, lon) AS count_loc
    FROM Insurance
)
SELECT 
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM PolicyCounts
WHERE count_tiv > 1 AND count_loc = 1;