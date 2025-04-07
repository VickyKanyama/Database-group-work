CREATE TABLE Employee (
    Emp_ID INT AUTO_INCREMENT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Department VARCHAR(100),
    Phone VARCHAR(20),
    Email VARCHAR(100)
);

INSERT INTO Employee (Emp_Name, Department, Phone, Email) VALUES
('Alice Njoki', 'HR', '0712345678', 'alice@company.com'),
('Brian Otieno', 'IT', '0723456789', 'brian@company.com'),
('Cynthia Mwangi', 'Procurement', '0734567890', 'cynthia@company.com');
