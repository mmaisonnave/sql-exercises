-- Database schema
-- Hotel (Hotel_ID, Hotel_name, location)
-- Rooms (Hotel_ID, Room_no, type, rent)
CREATE DATABASE IF NOT EXISTS example_db;
USE example_db;

CREATE TABLE IF NOT EXISTS Hotel (
    Hotel_ID INT AUTO_INCREMENT,
    Hotel_name VARCHAR(80),
    location_ VARCHAR(80),
    PRIMARY KEY (Hotel_ID)
);

CREATE TABLE IF NOT EXISTS Rooms (
    Hotel_ID INT,
    Room_no int,
    type_ VARCHAR(80),
    rent INT,
    FOREIGN KEY (Hotel_ID) REFERENCES  Hotel (Hotel_ID)
);


INSERT IGNORE INTO Hotel (Hotel_ID, Hotel_name, location_)
VALUES 
    (1, 'The Westin Hotel', 'Halifax'),
    (2, 'The Barrington Hotel', 'Halifax'),
    (3, 'Land Plaza', 'Bahia Blanca'),
    (4, 'El Gran Hotel', 'Coronel Suarez'),
    (5, 'Bender', 'Coronel Suarez');


INSERT IGNORE INTO Rooms (Hotel_ID, Room_no, type_, rent)
VALUES 
    (1, 123 , 'Suite', 1300),
    (1, 223 , 'Suite', 800),
    (1, 323 , 'Suite', 500),
    (2, 42 , 'Suite', 1200),
    (2, 43 , 'Suite', 820),
    (2, 44 , 'Suite', 125),
    (3, 998 , 'Suite', 1300),
    (3, 997 , 'Suite', 350),
    (3, 999 , 'Suite', 350),
    (4, 2 , 'Regular', 950),
    (5, 3 , 'Regular', 950);

SELECT * FROM Hotel;
SELECT * FROM Rooms;


-- Problem Statement
-- How do we find out the location for the most expensive Suite?
SELECT DISTINCT location_
FROM Hotel
WHERE Hotel_ID IN ( SELECT Hotel_ID
                    FROM Rooms
                    WHERE rent = (SELECT MAX(rent) FROM Rooms WHERE type_='Suite')
                  );
-- Note: If there is a tie for the most expensive suite (i.e., multiple suites with the same highest price), 
-- the query may return more than one location.


DROP TABLE Rooms;
DROP TABLE Hotel;
