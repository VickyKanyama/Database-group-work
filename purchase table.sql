CREATE DATABASE purchase;
USE purchase;
CREATE TABLE purchase(purchase_ID INT AUTO_INCREMENT NOT NULL,
    medicine_ID INT NOT NULL,
    supplier_ID INT NOT NULL,
    purchase_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    quantity INT NOT NULL,
    status ENUM('pending','complete') NOT NULL,
    PRIMARY KEY(purchase_ID)),
    FOREIGN KEY (medicine_ID) REFERENCES medicine(medicine_ID) ON DELETE CASCADE,
    FOREIGN KEY (supplier_ID) REFERENCES supplier(supplier_ID) ON DELETE CASCADE );
INSERT INTO purchase(medicine_ID,supplier_ID,quantity,status)
VALUES(1,1,300,'pending'),
      (2,2,400,'complete'),
      (3,4,10,'complete'),
      (3,3,100,'complete'),
      (2,2,700,'complete'),
      (4,4,250,'complete');
SELECT p.purchase_ID,m.medicine_name,p.purchase_date,p.quantity,m.price,p.status ,(m.price*p.quantity) AS total_price FROM purchase p
INNER JOIN medicine m ON p.medicine_ID=m.medicine_ID
WHERE m.medicine_name="Aspirin";

DELETE FROM purchase WHERE medicine_ID=3;

ALTER TABLE purchase CHANGE COLUMN status purchase_status ENUM('pending', 'complete') NOT NULL;

UPDATE purchase SET purchase_status="complete" WHERE medicine_ID=1;

SELECT DISTINCT medicine_ID,status FROM purchase;

SELECT p.*,m.* FROM purchase p
INNER JOIN medicine m ON p.medicine_ID=m.medicine_ID
ORDER BY p.purchase_date DESC;

CREATE INDEX purchase_index ON purchase(medicine_ID, purchase_status); SELECT * FROM purchase WHERE medicine_ID = 2 AND purchase_status = 'complete';
