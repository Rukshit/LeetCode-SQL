SELECT 
    e.name
FROM Employee e
JOIN (
    SELECT managerId
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(id) >= 5
) m ON e.id = m.managerId;