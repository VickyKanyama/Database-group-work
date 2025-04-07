
-- Create Department table
CREATE TABLE Department (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(100)
);

-- Create Employee table
CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Department_ID INT,
    Phone VARCHAR(20),
    Email VARCHAR(100),
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
);
