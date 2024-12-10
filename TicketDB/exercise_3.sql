-- What was the top event in Los Angeles?
-- Note: Here top event means in terms of the overall price paid. 


with event_venue_price_table (eventname, eventid, venueid, pricepaid) AS (
		SELECT Event.eventname, Sales.eventid, Venue.venueid, SUM(Sales.pricepaid) as total_price_paid
		FROM Sales
		JOIN Event ON Sales.eventid=Event.eventid
		JOIN Venue ON Event.venueid=Venue.venueid
		WHERE Venue.venuecity='Los Angeles'
		GROUP BY Sales.eventid, Venue.venueid
		ORDER BY total_price_paid DESC 
) SELECT *
  FROM event_venue_price_table
  WHERE pricepaid = (SELECT MAX(pricepaid) FROM event_venue_price_table);

