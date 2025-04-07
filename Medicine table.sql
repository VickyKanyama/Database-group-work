Create Database MedicineStock;

Use  MedicineStock;

Create table Medicine(
Medicine_ID Char(4),
Medicine_Name varchar(20),
Date_Supplied date,
Expiry_Date date,
Quantity_Available int,
Price dec(10.2),
primary key (Medicine_ID),
Supplier_Name varchar(100));

describe Medicine;

Create table Supplier(
Supplier_ID char(4),
Supplier_Name varchar(100),
Email varchar(255),
Address varchar(150),
Phone_No varchar(15),
primary key (Supplier_ID),
Medicine_ID char(4));

Describe Supplier;

Alter table Medicine
Add Constraint FK_Medicine_Supplier Foreign Key (Supplier_ID) references Medicine(Medicine_ID)
