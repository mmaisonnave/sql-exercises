CREATE DATABASE IF NOT EXISTS example_db;
USE example_db;

-- For counting exercise (02_count_exercise.sql)
# Movie (movie_title, color, genres, lang, country, title_year), 
CREATE TABLE IF NOT EXISTS Movie (
    id INT AUTO_INCREMENT,
    movie_title VARCHAR(80),
    color VARCHAR(10),
    genres VARCHAR(50),
    lang VARCHAR(30),
    country VARCHAR(50),
    title_year INT,
    PRIMARY KEY (id)
);


INSERT IGNORE INTO Movie (id, movie_title, color, genres, lang, country, title_year)
VALUES 
    (1, 'First Title', 'color', 'Comedy', 'English', 'Peru', 2010),
    (2, 'Second Title', 'color', 'Adventure', 'English', 'Peru', 2010),
    (3, 'Third Title', 'color', 'Drama', 'English', 'Argentina', 2010),
    (4, 'Fourth Title', 'color', 'Comedy', 'Spanish', 'Peru', 2010),
    (5, 'Fourth Title', 'color', 'Comedy', 'Spanish', 'Peru', 1992),
    (6, 'Fifth Title', 'color', 'Adventure', 'English', 'Japan', 2010),
    (7, 'Sixth Title', 'color', 'Comedy', 'English', 'Peru', 2010),
    (8, 'Fourth Title', 'color', 'Drama', 'Spanish', 'Peru', 1999);



