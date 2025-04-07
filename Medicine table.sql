Create Database MedicineStock;

Use  MedicineStock;

Create table Medicine(
Medicine_ID int not null,
Medicine_Name varchar(20),
Date_Supplied date ENUM('Pending','complete'),
Expiry_Date date not null,
Quantity_Available int null,
Price_for_each dec(10.2),
primary key (Medicine_ID),
Supplier_Name varchar(100));

describe Medicine;
Insert into Medicine(Medicine_ID,Medicine_Name,Date_Supplied,Expiry_Date,Quantity_Available,Price)
  Values
  ('1','Asprin','Hawa.A','Pending','2026-6-26','150','150.00'),
  ('2','Cetrizine','Karen.K.','pending','2025-12-5','370','48.00'),
  ('3','Dextromethorphan','Cherie.D.','complete','2027-3-6','100','900.00'),
 ('4','Fluconazole','Canesten','Pending','2027-7-20','42','250.00');

Select *from Medicine;

Create table Supplier(
Supplier_ID int not null,
Sup_Name varchar(20)not null,
Email varchar(25)not null,
Address varchar(150),
Phone_No varchar(10)not null,
primary key (Supplier_ID),
Medicine_ID int not null);

Describe Supplier;

Alter table Medicine
Add Constraint FK_Medicine_Supplier Foreign Key (Supplier_ID) references Medicine(Medicine_ID)
