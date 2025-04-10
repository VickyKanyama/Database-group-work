CREATE TABLE Doctor (
    Doctor_ID INT AUTO_INCREMENT PRIMARY KEY,
    Doc_Name VARCHAR(255) NOT NULL,
    Department VARCHAR(255) NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

INSERT INTO Doctor(Doc_Name, Department, Phone, Email)
VALUES
('Lucy Nduta', 'Optician', '0712345678', 'lucy.nduta@cityhospital.org'),
('Brian Otieno', 'Vascular Surgery', '0723456789', 'brian.otieno@cityhospital.org'),
('Cynthia Mwangi', 'Pediatric', '0734567890', 'cynthia.mwangi@cityhospital.org');

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
