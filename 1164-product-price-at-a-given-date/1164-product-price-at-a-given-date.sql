-- Case 1: Products that had at least one price change on or before 2019-08-16
SELECT 
    product_id, 
    new_price AS price
FROM Products
WHERE (product_id, change_date) IN (
    SELECT 
        product_id, 
        MAX(change_date)
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
)

UNION ALL

-- Case 2: Products that had no price change on or before 2019-08-16 (initial price = 10)
SELECT 
    product_id, 
    10 AS price
FROM Products
GROUP BY product_id
HAVING MIN(change_date) > '2019-08-16';