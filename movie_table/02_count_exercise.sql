-- Get count of movies of each language in the Adventure or Comedy genre, released after 2000.
SELECT lang, COUNT(*) as "Comedy or Adventure after 2000"
FROM Movie
WHERE (genres='Comedy' or genres='Adventure') and title_year>2000
GROUP BY lang;