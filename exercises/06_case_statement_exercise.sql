-- Database Schema, case statement exercise
-- Ratings (movie_id, movie_title, imdb_score, country)

CREATE DATABASE IF NOT EXISTS example_db;
USE example_db;

CREATE TABLE IF NOT EXISTS Ratings (
    id INT AUTO_INCREMENT,
    movie_title VARCHAR(80),
    imdb_score float,
    country VARCHAR(50),
    PRIMARY KEY (id)
);

INSERT IGNORE INTO Ratings (movie_title, imdb_score, country)
VALUES 
    ('First Title', 8, 'Peru'),
    ('Second Title', 7.7, 'India'),
    ('Third Title', 4, 'Argentina'),
    ('Fourth Title', 3.3, 'USA'),
    ('Fifth Title', 9.9, 'USA'),
    ('Sixth Title', 10, 'Argentina'),
    ('Seventh Title', 1.1, 'USA'),
    ('Eighth Title', 5, 'USA');

SELECT * 
FROM Ratings;

-- Problem Statement
-- Get all the films from the USA with their IMDb ratings and information about Highest and 
--     Lowest ratings. (For intermediate ratings, mention “Intermediate Rating”)
-- Result set: movie_title, imdb_score, comment
SELECT movie_title, imdb_score, CASE
WHEN imdb_score = (SELECT MAX(imdb_score) FROM Ratings WHERE country='USA') THEN 'Highest'
WHEN imdb_score = (SELECT MIN(imdb_score) FROM Ratings WHERE country='USA') THEN 'Lowest'
ELSE '“Intermediate Rating'
END as "comment"
FROM Ratings
WHERE country='USA';


-- Database Clean up
DROP TABLE Ratings;