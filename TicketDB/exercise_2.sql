-- -- What was the percent change in orders between September 9 & 10?

-- expected output: 8.5
WITH aux (total_sales, month_str, day_no, year_no) as ( 
	SELECT COUNT(DISTINCT Sales.salesid), Date.month, EXTRACT(DAY FROM TO_DATE(Date.caldate, 'YYYY-MM-DD')), Date.year 
	FROM Sales
	INNER JOIN Date ON Date.dateid=Sales.dateid
	WHERE Date.month='SEP' and EXTRACT(DAY FROM TO_DATE(Date.caldate, 'YYYY-MM-DD')) IN('09', '10')
	GROUP BY Date.month, EXTRACT(DAY FROM TO_DATE(Date.caldate, 'YYYY-MM-DD')), Date.year 
)
SELECT ROUND(100*(((SELECT CAST(total_sales as NUMERIC) 
		 FROM aux 
		 WHERE day_no='10')-(SELECT CAST(total_sales as NUMERIC) 
		                     FROM aux 
							 WHERE day_no='09'))/(SELECT CAST(total_sales as NUMERIC) 
							                      FROM aux 
												   WHERE day_no='09')),1) as pct_change;


-- SQL LIte:
-- WITH aux (total_sales, month_str, day_no, year_no) AS (
--     SELECT COUNT(DISTINCT Sales.salesid), 
--            Date.month, 
--            STRFTIME('%d', Date.caldate) AS day_no, 
--            Date.year
--     FROM Sales
--     INNER JOIN Date ON Date.dateid = Sales.dateid
--     WHERE Date.month = 'SEP' 
--       AND STRFTIME('%d', Date.caldate) IN ('09', '10')
--     GROUP BY Date.month, STRFTIME('%d', Date.caldate), Date.year
-- )
-- SELECT ROUND(100 * (
--     (SELECT total_sales FROM aux WHERE day_no = '10') - 
--     (SELECT total_sales FROM aux WHERE day_no = '09')
-- ) / (SELECT total_sales FROM aux WHERE day_no = '09'), 1) AS pct_change;


-- IK Solution (SQLite):
-- WITH sales_per_day AS (
--     -- Each row contains the number of sales for a given day
--     SELECT
--       TO_CHAR(saletime::timestamp, 'YYYY-MM-DD') AS day,
--       COUNT(*) AS num_sales
--     FROM sales
--     GROUP BY day
-- ),
  
-- curr_day_and_prev_day_sales AS (
--     -- Each row contains the current day and previous day's sales
--     SELECT
--       day,
--       num_sales AS curr_day_sales,
--       LAG(num_sales, 1) OVER (ORDER BY day) AS prev_day_sales
--     FROM sales_per_day
-- )

-- SELECT
--     ROUND(100.0 * (curr_day_sales - prev_day_sales) / prev_day_sales, 1) AS pct_change
-- FROM curr_day_and_prev_day_sales
-- WHERE day = '2008-09-10';
