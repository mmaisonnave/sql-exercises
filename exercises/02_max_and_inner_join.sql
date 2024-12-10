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
    (5, 'Bender', 'Coronel Suarez'),
    (6, 'No Room Hotel', 'No city');


INSERT IGNORE INTO Rooms (Hotel_ID, Room_no, type_, rent)
VALUES 
    (1, 123 , 'Suite', 1300),
    (1, 223 , 'Suite', 800),
    (1, 323 , 'Suite', 500),
    (2, 42 , 'Deluxe', 1400),
    (2, 43 , 'Suite', 820),
    (2, 44 , 'Suite', 125),
    (3, 998 , 'Suite', 1300),
    (3, 997 , 'Deluxe', 350),
    (3, 999 , 'Suite', 350),
    (4, 2 , 'Deluxe', 1400),
    (5, 3 , 'Regular', 950);

SELECT * FROM Rooms;
SELECT * FROM Hotel;

-- Find the name of the hotel whose ‘deluxe’ type room rent is the highest
-- (I solve this problem first with subquery and then with LEFT JOIN)
SELECT Hotel_name
FROM Hotel
WHERE Hotel_ID in (
                    SELECT Hotel_ID
                    FROM Rooms
                    WHERE type_='deluxe' and rent = (SELECT MAX(rent) FROM Rooms WHERE type_='Deluxe')
                  );
-- Note: If there is a tie for the most expensive deluxe room (i.e., multiple suites with the same highest price), 
-- the query may return more than Hotel Name.



-- Solution with LEFT JOIN:
SELECT * 
FROM Rooms 
INNER JOIN Hotel
ON Hotel.Hotel_ID = Rooms.Hotel_ID
WHERE Rooms.type_='Deluxe'
ORDER BY rent DESC
LIMIT 1;



-- Clean up
DROP Table Rooms;
DROP TABLE Hotel;
