Create Database MedicineStock;

Use  MedicineStock;

Create table Medicine(
Medicine_ID INT AUTO_INCREMENT NOT NULL,
Medicine_Name VARCHAR(255),
Date_Supplied DATE,
Expiry_Date DATE NOT NULL,
Quantity_available INT NOT NULL,
Price_for_each dec(10,2),
PRIMARY KEY (Medicine_ID)
  );

Insert into Medicine(Medicine_Name,Date_Supplied,Expiry_Date,Quantity_available,Price_for_each)
  Values
  ('Asprin','2026-6-26',150,150.00),
  ('Cetrizine','2025-12-5',370,48.00),
  ('Dextromethorphan','2027-3-6',100,900.00),
  ('Fluconazole','2027-7-20',42,250.00);

UPDATE Medicine
Set Quantity_Available = 200,
Price_for_each = 160.00
WHERE Medicine_ID = 1;

CREATE index idx_Medicine_Name ON Medicine (Medicine_Name);
SELECT*FROM Medicine
WHERE Medicine_Name = 'Asprin';;

SELECT*FROM Medicine;
