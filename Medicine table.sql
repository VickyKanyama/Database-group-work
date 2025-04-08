CREATE DATABASE MedicineStock;

USE MedicineStock;

CREATE TABLE Medicine(
Medicine_ID INT AUTO_INCREMENT NOT NULL,
Medicine_Name VARCHAR(100),
Date_Supplied DATE,
Expiry_Date DATE NOT NULL,
Quantity_available INT NOT NULL,
Price_for_each dec(10,2),
PRIMARY KEY (Medicine_ID)
  );

INSERT INTO Medicine(Medicine_Name,Date_Supplied,Expiry_Date,Quantity_available,Price_for_each)
VALUES
  ('Asprin','2024-6-26','2026-6-26',150,150.00),
  ('Cetrizine','2024-12-5','2027-12-26',370,48.00),
  ('Dextromethorphan','2023-3-6','2028-3-6',100,900.00),
  ('Fluconazole','2020-7-20','2025-7-20',42,250.00);

UPDATE Medicine
SET Quantity_Available = 200,
Price_for_each = 160.00
WHERE Medicine_ID = 1;

CREATE index idx_Medicine_Name ON Medicine (Medicine_Name);
SELECT*FROM Medicine
WHERE Medicine_Name = 'Asprin';;

SELECT*FROM Medicine;
