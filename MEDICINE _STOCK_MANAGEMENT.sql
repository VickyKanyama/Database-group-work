CREATE DATABASE MEDICINE_STOCK_MANAGEMENT;
USE MEDICINE_STOCK_MANAGEMENT;
CREATE TABLE Doctor (
    Doctor_ID INT AUTO_INCREMENT PRIMARY KEY,
    Doc_Name VARCHAR(255) NOT NULL,
    Department VARCHAR(255) NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    Email VARCHAR(100) NOT NULL
);
CREATE TABLE Medicine(
   Medicine_ID INT AUTO_INCREMENT NOT NULL,
   Medicine_Name VARCHAR(100),
   Date_Supplied DATE,
   Expiry_Date DATE NOT NULL,
   Quantity_available INT NOT NULL,
   Price_for_each dec(10,2),
   PRIMARY KEY (Medicine_ID));
   
CREATE TABLE Supplier (
   supplier_ID INT AUTO_INCREMENT,
   Sup_name VARCHAR(20) NOT NULL,
   Phone CHAR(10) NOT NULL,
   Email VARCHAR(25) NOT NULL UNIQUE,
   PRIMARY KEY (supplier_ID ));
   
 CREATE TABLE managers (
    manager_id INT AUTO_INCREMENT PRIMARY KEY,
    manager_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
     );

CREATE TABLE manager_phone_numbers (
  phone_id INT AUTO_INCREMENT PRIMARY KEY,
  manager_id INT,
  phone_number CHAR(10) NOT NULL,
  FOREIGN KEY (manager_id) REFERENCES managers(manager_id)
);

CREATE TABLE purchase(
    purchase_ID INT AUTO_INCREMENT NOT NULL,
    medicine_ID INT NOT NULL,
    supplier_ID INT NOT NULL,
    purchase_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    quantity INT NOT NULL,
    status ENUM('pending','complete') NOT NULL,
    PRIMARY KEY(purchase_ID),
    FOREIGN KEY (medicine_ID) REFERENCES medicine(medicine_ID) ON DELETE CASCADE,
    FOREIGN KEY (supplier_ID) REFERENCES supplier(supplier_ID) ON DELETE CASCADE);
    
CREATE TABLE stock_management (
    movement_id INT AUTO_INCREMENT,
    medicine_ID INT NOT NULL,
    quantity_change INT NOT NULL,
    type ENUM('purchase', 'supply', 'usage') NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(movement_id),
    FOREIGN KEY (medicine_ID) REFERENCES medicine(medicine_ID) ON DELETE CASCADE
);

    
INSERT INTO Doctor(Doc_Name, Department, Phone, Email)
VALUES
('Lucy Nduta', 'Optician', '0712345678', 'lucy.nduta@cityhospital.org'),
('Brian Otieno', 'Vascular Surgery', '0723456789', 'brian.otieno@cityhospital.org'),
('Cynthia Mwangi', 'Pediatric', '0734567890', 'cynthia.mwangi@cityhospital.org');

INSERT INTO Medicine(Medicine_Name,Date_Supplied,Expiry_Date,Quantity_available,Price_for_each)
VALUES
  ('Asprin','2024-6-26','2026-6-26',150,150.00),
  ('Cetrizine','2024-12-5','2027-12-26',370,48.00),
  ('Dextromethorphan','2023-3-6','2028-3-6',100,900.00),
  ('Fluconazole','2020-7-20','2025-7-20',42,250.00);
  
INSERT INTO Supplier (Sup_name, Phone, Email) 
VALUES 
('Alpha Herbs', '0712345678', 'alpha@gmail.com'),
('Beta Pharmacy', '0723456789', 'beta@gmail.com'),
('Gamma Global Pharmacy LTD', '0734567890', 'gamma@gmail.com'),
('Delta Medice Suppliers', '0745678901', 'delta@gmail.com');

INSERT INTO managers (manager_name, email)
VALUES 
('John Were', 'john.were@cityhospital.org'),
('Jane Smith', 'jane.smith@cityhospital.org'),
('Emily Turner', 'emily.turner@cityhospital.org'),
('Mark Johnson', 'mark.johnson@cityhospital.org');

INSERT INTO manager_phone_numbers (manager_id, phone_number)
VALUES
((SELECT manager_id FROM managers WHERE email = 'john.were@cityhospital.org'), '0746753743'),
((SELECT manager_id FROM managers WHERE email = 'jane.smith@cityhospital.org'), '0756473921'),
((SELECT manager_id FROM managers WHERE email = 'jane.smith@cityhospital.org'), '0712506739'),
((SELECT manager_id FROM managers WHERE email = 'emily.turner@cityhospital.org'), '0739821754'),
((SELECT manager_id FROM managers WHERE email = 'mark.johnson@cityhospital.org'), '0726472839');

INSERT INTO purchase(medicine_ID,supplier_ID,quantity,status)
VALUES(1,1,300,'pending'),
      (2,2,400,'complete'),
      (3,4,10,'complete'),
      (3,3,100,'complete'),
      (2,2,700,'complete'),
      (4,4,250,'complete');
      
INSERT INTO stock_management (medicine_ID, quantity_change, type)
VALUES
    (1, 300, 'purchase'),
    (2, 400, 'purchase'),
    (3, 100, 'purchase'),
    (4, 250, 'purchase'),
    (1, -50, 'usage'),
    (2, -30, 'usage'),
    (1, 100, 'supply');

ALTER TABLE Doctor ADD CONSTRAINT unique_phone UNIQUE (Phone);
ALTER TABLE Doctor ADD CONSTRAINT unique_email UNIQUE (Email);

CREATE INDEX idx_email ON Doctor (Email);
SELECT*FROM Doctor WHERE Email='brian.otieno@cityhospital.org';

UPDATE Doctor
SET Department = 'Pharmacy'
WHERE Doctor_ID = 2;

SELECT Doctor_ID, Doc_Name, Department, Phone, Email
FROM Doctor
WHERE Doc_Name LIKE '%A';
SELECT * FROM managers;

UPDATE manager_phone_numbers
SET phone_number = '0746610394'
WHERE manager_id = 1;

DELETE FROM managers
WHERE manager_name = 'Jane Smith';
CREATE INDEX manager_index ON managers(manager_name, email);
SELECT * FROM managers WHERE manager_name = 'john Were' AND email = 'john.were@cityhospital.org';

SELECT*FROM manager_phone_numbers;

SELECT * FROM Supplier;

UPDATE Supplier
SET Phone = '0791234567'
WHERE Sup_name = 'Beta Pharmacy';

DELETE FROM Supplier
WHERE Email = 'delta@gmail.com';

SELECT Sup_name, Email FROM Supplier;

CREATE INDEX supplier_index ON Supplier(Sup_name, Email); 
SELECT * FROM Supplier WHERE Sup_name = 'Beta Pharmarcy' AND Email = 'beta@gmail.com';

UPDATE Medicine
SET Quantity_Available = 200,
Price_for_each = 160.00
WHERE Medicine_ID = 1;

CREATE INDEX medicine_index ON Medicine(Medicine_Name);
SELECT * FROM Medicine
WHERE Medicine_Name = 'Asprin';

SELECT*FROM Medicine;

SELECT p.purchase_ID,m.medicine_name,p.purchase_date,p.quantity,p.status ,(m.Price_for_each*p.quantity) AS total_price FROM purchase p
INNER JOIN Medicine m ON p.medicine_ID=m.medicine_ID
WHERE m.medicine_name="Aspirin";

DELETE FROM purchase WHERE medicine_ID=3;

ALTER TABLE purchase CHANGE COLUMN status purchase_status ENUM('pending', 'complete') NOT NULL;

UPDATE purchase SET purchase_status="complete" WHERE medicine_ID=1;

SELECT DISTINCT medicine_ID,purchase_status FROM purchase;

SELECT p.*,m.* FROM purchase p
INNER JOIN Medicine m ON p.medicine_ID=m.medicine_ID
ORDER BY p.purchase_date DESC;

CREATE INDEX purchase_index ON purchase(medicine_ID, purchase_status); 
SELECT * FROM purchase WHERE medicine_ID = 2 AND purchase_status = 'complete';

SELECT * FROM stock_management;

CREATE INDEX movement_index ON stock_management(medicine_ID);
SELECT * FROM stock_management WHERE medicine_ID=1;

SELECT 
    sm.movement_id,
    m.medicine_name,
    sm.type,
    sm.quantity_change,
    sm.date
FROM stock_management sm
JOIN Medicine m ON sm.medicine_ID = m.medicine_ID;

UPDATE stock_management
SET quantity_change = 200
WHERE movement_id = 1;

DELETE FROM stock_management
WHERE movement_id = 2;
