-- How many users have bought tickets to an out-of-state event?

-- Expected 35630
SELECT COUNT(DISTINCT userid)
FROM (
	SELECT Users.userid, Users.state, Sales.eventid
	FROM Users 
	JOIN Sales on Sales.buyerid=Users.userid
	JOIN Event on Event.eventid=Sales.eventid
	JOIN Venue on Venue.venueid=Event.venueid
	WHERE Venue.venuestate!=Users.state
);
