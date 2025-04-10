CREATE TABLE stock_management (
    movement_id INT AUTO_INCREMENT,
    medicine_ID INT NOT NULL,
    quantity_change INT NOT NULL,
    type ENUM('purchase', 'supply', 'usage') NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(movement_id),
    FOREIGN KEY (medicine_ID) REFERENCES medicine(medicine_ID) ON DELETE CASCADE
);

INSERT INTO stock_management (medicine_ID, quantity_change, type)
VALUES
    (1, 300, 'purchase'),
    (2, 400, 'purchase'),
    (3, 100, 'purchase'),
    (4, 250, 'purchase'),
    (1, -50, 'usage'),
    (2, -30, 'usage'),
    (1, 100, 'supply');

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


