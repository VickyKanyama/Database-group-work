Create Database MedicineStock;

Use  MedicineStock;

Create table Medicine(
Medicine_ID int not null,
Medicine_Name varchar(20),
Date_Supplied date null,
Expiry_Date date not null,
Quantity_Available int null,
Price dec(10.2),
primary key (Medicine_ID),
Supplier_Name varchar(100));

describe Medicine;
Insert into Medicine(Medicine_ID,Medicine_Name,Date_Supplied,Expiry_Date,Quantity_Available,Price)
  Values
  ('Asprin','Hawa.A','Pending','','',''),
  ('Cetrizine','Karen.K.','pending','','',''),
  ('Dextromethorphan','Cherie.D.','complete','','',''),
 ('Fluconazole','Canesten','Pending','','',''
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
