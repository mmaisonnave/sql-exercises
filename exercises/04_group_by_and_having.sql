-- Database schema
-- Given the table Cast (movie_title, director, actor), 

-- Drop the table if it already exists
DROP TABLE IF EXISTS Cast;

-- Create the Cast table
CREATE TABLE Cast (
    movie_title VARCHAR(100),
    director VARCHAR(100),
    actor VARCHAR(100)
);

-- Insert test data into the Cast table
INSERT INTO Cast (movie_title, director, actor) VALUES
('Movie A', 'Director 1', 'Actor 1'),
('Movie B', 'Director 1', 'Actor 1'),
('Movie C', 'Director 2', 'Actor 1'),
('Movie D', 'Director 1', 'Actor 2'),
('Movie E', 'Director 2', 'Actor 3'),
('Movie F', 'Director 2', 'Actor 1'),
('Movie G', 'Director 3', NULL), -- No actor listed
('Movie H', 'Director 3', 'Actor 4'),
('Movie I', 'Director 4', 'Actor 4'),
('Movie J', 'Director 4', 'Actor 1');

-- Confirm data has been inserted
SELECT *
FROM Cast;


-- Get the list of all directors who have worked with the same actor on multiple occasions.
-- Note: Actor column can have NULL values.

SELECT director, actor, count(*) as work_together
FROM Cast
WHERE actor IS NOT NULL
GROUP BY director, actor
HAVING work_together>1;



DROP TABLE Cast;