CREATE schema lab_mysql;
USE lab_mysql;

CREATE TABLE IF NOT EXISTS Cars (
'car_id' VARCHAR(20) NOT NULL,
'vin' VARCHAR(17) NOT NULL, 
'manufacturer' VARCHAR(20) NOT NULL, 
'model' VARCHAR(20) NOT NULL, 
'year' INT(4) NOT NULL, 
'color' VARCHAR(20) NOT NULL,
PRIMARY KEY ('car_id')
);

CREATE TABLE IF NOT EXISTS Invoices (
'invoice_id' VARCHAR(20) NOT NULL, 
'invoice_number' INT(20) NOT NULL, 
'invoice_date' DATE NOT NULL, 
'car_id' VARCHAR(20) NOT NULL, 
'customer_id' VARCHAR(20) NOT NULL, 
'staff_id' VARCHAR(20) NOT NULL,
PRIMARY KEY ('invoice_id', 'car_id', 'staff_id', 'customer_id')
);

CREATE TABLE IF NOT EXISTS Salespeople (
'staff_id' VARCHAR(20) NOT NULL, 
'salesman_id' VARCHAR(20) NOT NULL, 
'name' VARCHAR(20) NOT NULL, 
'shop' VARCHAR(20) NOT NULL,
PRIMARY KEY ('staff_id')
);

CREATE TABLE IF NOT EXISTS Customers (
'customer_id' VARCHAR(20) NOT NULL, 
'customer_id_number' VARCHAR(20) NOT NULL, 
'name' VARCHAR(20) NOT NULL, 
'phone' INT(15) NOT NULL, 
'email' VARCHAR(80) NULL, 
'address' VARCHAR(120) NOT NULL, 
'city' VARCHAR(30) NOT NULL, 
'state' VARCHAR(30) NOT NULL, 
'country' VARCHAR(30) NOT NULL, 
'postal_code' VARCHAR(10) NOT NULL,
PRIMARY KEY ('customer_id')
);

