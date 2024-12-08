-- -- Database schema
-- -- Product(maker, model, type)
-- -- PC(code, model, speed, ram, hd, cd, price)

-- Drop the tables if they already exist
DROP TABLE IF EXISTS PC;
DROP TABLE IF EXISTS Product;

-- Create the Product table
CREATE TABLE Product (
    maker VARCHAR(50),
    model INT,
    type VARCHAR(20)
);

-- Create the PC table
CREATE TABLE PC (
    code INT,
    model INT,
    speed INT,
    ram INT,
    hd INT,
    cd VARCHAR(20),
    price DECIMAL(10, 2)
);

-- Insert test data into the Product table
INSERT INTO Product (maker, model, type) VALUES
('A', 1001, 'PC'),
('B', 1002, 'Laptop'),
('A', 1003, 'PC'),
('C', 1004, 'Tablet'),
('A', 1005, 'PC'),
('B', 1006, 'PC'),
('A', 1007, 'PC');

-- Insert test data into the PC table
INSERT INTO PC (code, model, speed, ram, hd, cd, price) VALUES
(1, 1001, 2400, 8, 500, 'DVD', 700.00),
(2, 1003, 3000, 16, 1000, 'DVD-RW', 1000.00),
(3, 1005, 2200, 4, 250, 'None', 500.00),
(4, 1007, 2800, 12, 750, 'DVD-RW', 900.00),
(5, 1002, 3200, 16, 512, 'DVD', 1500.00),
(6, 1006, 2600, 8, 1000, 'DVD', 800.00);

-- Confirm data has been inserted
SELECT * FROM Product;
SELECT * FROM PC;

-- Problem Statement
-- Write a SQL query to find how many different models of PC are produced by maker A.

SELECT COUNT(*) as 'Number of PC models produced by Maker A '
FROM Product  
INNER JOIN PC
ON Product.model = PC.model
WHERE Product.maker='A';

-- Clean up
DROP TABLE Product;
DROP TABLE PC;
