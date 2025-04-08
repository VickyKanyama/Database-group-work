CREATE TABLE Employee (
    Emp_ID INT AUTO_INCREMENT PRIMARY KEY,
    Emp_Name VARCHAR(35) NOT NULL,
    Department VARCHAR(100) NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

INSERT INTO Employee (Emp_Name, Department, Phone, Email)
VALUES
('Lucy Nduta', 'Optician', '0712345678', 'lucy.nduta@cityhospital.org'),
('Brian Otieno', 'Vascular Surgery', '0723456789', 'brian.otieno@cityhospital.org'),
('Cynthia Mwangi', 'Pediatric', '0734567890', 'cynthia.mwangi@cityhospital.org');

ALTER TABLE Employee ADD CONSTRAINT unique_phone UNIQUE (Phone);
ALTER TABLE Employee ADD CONSTRAINT unique_email UNIQUE (Email);

CREATE INDEX idx_email ON Employee (Email);
SELECT*FROM Employee WHERE Email='brian.otieno@cityhospital.org';

UPDATE Employee
SET Department = 'Pharmacy'
WHERE Emp_ID = 2;

SELECT Emp_ID, Emp_Name, Department, Phone, Email
FROM Employee
WHERE Address LIKE '%A';
