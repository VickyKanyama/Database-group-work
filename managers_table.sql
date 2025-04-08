CREATE TABLE managers (
    manager_id INT AUTO_INCREMENT PRIMARY KEY,
    manager_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number CHAR(10) UNIQUE NOT NULL
);

INSERT INTO managers (manager_name, email, phone_number)
VALUES 
('John Were', 'john.were@cityhospital.org', '0746753743'),
('Jane Smith', 'jane.smith@cityhospital.org', '0756473921'),
('Emily Turner', 'emily.turner@cityhospital.org', '0739821754'),
('Mark Johnson', 'mark.johnson@cityhospital.org', '0726472839');
SELECT * FROM managers;

UPDATE managers
SET phone_number = '0746610394'
WHERE manager_id = 1;

DELETE FROM managers
WHERE manager_id = 2; CREATE INDEX manager_index ON managers(manager_name, email); SELECT * FROM managers WHERE manager_name = 'john Were' AND email = 'john.were@cityhospital.org';