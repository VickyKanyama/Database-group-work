CREATE TABLE Supplier (
    supplier_ID INT AUTO_INCREMENT,
    Sup_name VARCHAR(20) NOT NULL,
    Phone CHAR(10) NOT NULL,
    Email VARCHAR(25) NOT NULL UNIQUE,
    PRIMARY KEY (supplier_ID )
);

INSERT INTO Supplier (Sup_name, Phone, Email) 
VALUES 
('Alpha Herbs', '0712345678', 'alpha@gmail.com'),
('Beta Pharmacy', '0723456789', 'beta@gmail.com.com'),
('Gamma Global Pharmacy LTD', '0734567890', 'gamma@gmail.com'),
('Delta Medice Suppliers', '0745678901', 'delta@gmail.com');

SELECT * FROM Supplier;

UPDATE Supplier
SET Phone = '0791234567'
WHERE Sup_name = 'Beta Pharmacy';

DELETE FROM Supplier
WHERE Email = 'delta@gmail.com';

SELECT Sup_name, Email FROM Supplier;

CREATE INDEX supplier_index ON supplier(Sup_name, email); 
SELECT * FROM users WHERE username = 'Beta pharmarcy' AND email = 'beta@gmail.com
