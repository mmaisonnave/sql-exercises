-- Which holiday had the most ticket sales?

WITH Holiday_Sales (caldate, dateid, sum_qrysold) AS (
	SELECT Date.caldate, Date.dateid, SUM(Sales.qtysold) as sum_qtysold
	FROM Sales
	INNER JOIN Date ON Date.dateid = Sales.dateid
	WHERE Date.holiday=1
	GROUP BY Date.dateid, Date.caldate
	ORDER BY sum_qtysold DESC
)SELECT caldate 
 FROM Holiday_Sales 
 WHERE sum_qrysold = (SELECT MAX(sum_qrysold) FROM Holiday_Sales);
