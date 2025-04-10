CREATE TABLE managers (
    manager_id INT AUTO_INCREMENT PRIMARY KEY,
    manager_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
);

INSERT INTO managers (manager_name, email)
VALUES 
('John Were', 'john.were@cityhospital.org'),
('Jane Smith', 'jane.smith@cityhospital.org'),
('Emily Turner', 'emily.turner@cityhospital.org'),
('Mark Johnson', 'mark.johnson@cityhospital.org');

CREATE TABLE manager_phone_numbers (
  phone_id INT AUTO_INCREMENT PRIMARY KEY,
  manager_id INT,
  phone_number CHAR(10) NOT NULL,
  FOREIGN KEY (manager_id) REFERENCES managers(manager_id)
);
INSERT INTO manager_phone_numbers (manager_id, phone_number)
VALUES
((SELECT manager_id FROM managers WHERE email = 'john.were@cityhospital.org'), '0746753743'),
((SELECT manager_id FROM managers WHERE email = 'jane.smith@cityhospital.org'), '0756473921'),
((SELECT manager_id FROM managers WHERE email = 'jane.smith@cityhospital.org'), '0712506739'),
((SELECT manager_id FROM managers WHERE email = 'emily.turner@cityhospital.org'), '0739821754'),
((SELECT manager_id FROM managers WHERE email = 'mark.johnson@cityhospital.org'), '0726472839');

SELECT * FROM managers;
SELECT * FROM manager_phone_numbers;

UPDATE manager_phone_numbers
SET phone_number = '0746610394'
WHERE phone_number = '0739821754' ;

DELETE FROM managers
WHERE manager_name = 'Jane Smith';
CREATE INDEX manager_index ON managers(manager_name, email); SELECT * FROM managers WHERE manager_name = 'John Were' AND email = 'john.were@cityhospital.org';
