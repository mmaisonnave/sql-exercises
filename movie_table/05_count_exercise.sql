-- Database Schema, count exercise
-- Movie (movie_title, color, genres, lang, country, title_year), 

CREATE DATABASE IF NOT EXISTS example_db;
USE example_db;

CREATE TABLE IF NOT EXISTS Movie (
    movie_title VARCHAR(80),
    color VARCHAR(10),
    genres VARCHAR(50),
    lang VARCHAR(30),
    country VARCHAR(50),
    title_year INT,
    PRIMARY KEY (movie_title)
);


INSERT IGNORE INTO Movie (movie_title, color, genres, lang, country, title_year)
VALUES 
    ('First Title', 'color', 'Comedy', 'English', 'Peru', 2010),
    ('Second Title', 'color', 'Adventure', 'English', 'Peru', 2010),
    ('Third Title', 'color', 'Drama', 'English', 'Argentina', 2010),
    ('Fourth Title', 'color', 'Comedy', 'Spanish', 'Peru', 2010),
    ('Fourth Title', 'color', 'Comedy', 'Spanish', 'Peru', 1992),
    ('Fifth Title', 'color', 'Adventure', 'English', 'Japan', 2010),
    ('Sixth Title', 'color', 'Comedy', 'English', 'Peru', 2010),
    ('Fourth Title', 'color', 'Drama', 'Spanish', 'Peru', 1999);

-- Problem Statement
-- Get count of movies of each language in the Adventure or Comedy genre, released after 2000.
SELECT lang, COUNT(*) as "Comedy or Adventure after 2000"
FROM Movie
WHERE (genres='Comedy' or genres='Adventure') and title_year>2000
GROUP BY lang;

-- Database Clean up
DROP TABLE Movie;