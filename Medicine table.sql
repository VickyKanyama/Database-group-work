Create Database MedicineStock;

Use  MedicineStock;

Create table Medicine(
Medicine_ID int NOT NULL,
Medicine_Name varchar(20),
Date_Supplied date ENUM('Pending','complete'),
Expiry_Date date NOT NULL,
Quantity_Available int NULL,
Price_for_each dec(10.2),
primary key (Medicine_ID),
Supplier_Name varchar(100) Null);

describe Medicine;
Insert into Medicine(Medicine_ID,Medicine_Name,Date_Supplied,Expiry_Date,Quantity_Available,Price,Supplier_Name)
  Values
  ('1','Asprin','Pending','2026-6-26',150,150.00,''),
  ('2','Cetrizine','pending','2025-12-5',370,48.00,''),
  ('3','Dextromethorphan','complete','2027-3-6',100,900.00,''),
 ('4','Fluconazole','Pending','2027-7-20',42,250.00,'');

Select *from Medicine;

drop table Medicine;


