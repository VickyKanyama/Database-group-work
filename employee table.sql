CREATE TABLE Employee (
    Emp_ID INT AUTO_INCREMENT PRIMARY KEY,
    Emp_Name VARCHAR(35) NOT NULL,
    Department_Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

ALTER TABLE Employee ADD CONSTRAINT unique_department UNIQUE (Department_Name);
ALTER TABLE Employee ADD CONSTRAINT unique_phone UNIQUE (Phone);
ALTER TABLE Employee ADD CONSTRAINT unique_email UNIQUE (Email);

CREATE INDEX idx_email ON Employee (Email);

INSERT INTO Employee (Emp_Name, Department_Name, Phone, Email) VALUES
('Alice Njoki', 'HR', '0712345678', 'alice@company.com'),
('Brian Otieno', 'IT', '0723456789', 'brian@company.com'),
('Cynthia Mwangi', 'Procurement', '0734567890', 'cynthia@company.com');

UPDATE Employee
SET Department_Name = 'Finance'
WHERE Emp_ID = 3;

