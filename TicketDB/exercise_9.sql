-- Find the top 3 cities for sales. 

WITH city_sales (venuecity, total_qtysold) AS (
	SELECT Venue.venuecity, SUM(Sales.qtysold)
	FROM Sales
	JOIN Event on Event.eventid=Sales.eventid
	JOIN Venue on Venue.venueid=Event.venueid
	GROUP BY Venue.venuecity
	ORDER BY SUM(Sales.qtysold) DESC
) SELECT venuecity 
  FROM city_sales 
  LIMIT 3;