-- How many tickets were sold by resellers (someone who bought tickets for an 
-- event and later sold tickets to that same event)?

SELECT SUM( s1.qtysold)
FROM Sales as s1
JOIN Sales as s2 on s1.sellerid=s2.buyerid 
		and s1.eventid=s2.eventid 
		and s1.saletime > s2.saletime;	
