-- How many users have bought a ticket to the category called 'Musicals'?

SELECT COUNT(DISTINCT Users.userid)
FROM Users
JOIN Sales ON Sales.buyerid = Users.userid
JOIN Event ON Sales.eventid = Event.eventid
JOIN Category ON Category.catid = Event.catid
WHERE Category.catname='Musicals';