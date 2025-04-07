CREATE TABLE Supplier (
    supplier_ID INT AUTO_INCREMENT,
    Sup_name VARCHAR(20) NOT NULL,
    Phone CHAR(10) NOT NULL,
    Email VARCHAR(25) NOT NULL UNIQUE,
    PRIMARY KEY (supplier_ID )
);

INSERT INTO Supplier (Sup_name, Phone, Email) 
VALUES 
('Alpha Textiles', '0712345678', 'alpha@textiles.com'),
('Beta Supplies', '0723456789', 'beta@supplies.com'),
('Gamma Fabrics', '0734567890', 'gamma@fabrics.com'),
('Delta Clothing', '0745678901', 'delta@clothing.com');

SELECT * FROM Supplier;

UPDATE Supplier
SET Phone = '0791234567'
WHERE Sup_name = 'Beta Supplies';

DELETE FROM Supplier
WHERE Email = 'delta@clothing.com';

SELECT Sup_name, Email FROM Supplier;
