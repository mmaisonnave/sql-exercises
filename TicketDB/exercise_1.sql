-- How many days were there where the number of tickets sold was less than 25% of the mean?
-- Hint: first find the daily mean by calculating daily number of sales


SELECT COUNT(*)
FROM (
        SELECT dateid, sum(qtysold)
        FROM Sales
        GROUP BY dateid
        HAVING sum(qtysold) <  (SELECT AVG(qty_sold_per_day)
        							FROM (
        									SELECT dateid, sum(qtysold) as qty_sold_per_day
        									FROM Sales
        									GROUP BY dateid
        								 ))*.25
     );