-- How many buyer pairs have attended three or more events together?


-- Expected output 11
SELECT COUNT(*)
FROM (
	SELECT DISTINCT S1.buyerid, S2.buyerid, COUNT (DISTINCT S1.eventid) as attended_together_count
	FROM Sales as S1
	JOIN Sales as S2 ON S1.eventid=S2.eventid and S1.buyerid>S2.buyerid
	GROUP BY S1.buyerid, S2.buyerid
	HAVING COUNT (DISTINCT S1.eventid) >2
	)