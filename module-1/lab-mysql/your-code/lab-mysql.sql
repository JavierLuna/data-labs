-- CHALLENGE 2 --

CREATE DATABASE lab_mysql;
USE lab_mysql;

-- CREO TABLA CARS
CREATE TABLE IF NOT EXISTS lab_mysql. cars (
	car_ID INT NOT NULL AUTO_INCREMENT,
	VIN VARCHAR(20) NOT NULL,
	manufacturer VARCHAR(20) NOT NULL,
	model VARCHAR(20) NOT NULL,
	registration_year INT NULL,
	color VARCHAR(20) NULL,
	PRIMARY KEY (car_ID));
    
-- CREO TABLA CUSTOMERS
CREATE TABLE IF NOT EXISTS lab_mysql. customers (
	customer_ID INT NOT NULL AUTO_INCREMENT,
    customer_ID_number VARCHAR(20) NOT NULL,
    name VARCHAR(45) NOT NULL,
    phone VARCHAR(45) NULL,
    email VARCHAR(45) NULL,
    address VARCHAR(50) NULL,
    city VARCHAR(20) NULL,
    state VARCHAR(20) NULL,
    country VARCHAR(20) NULL,
    postal_code VARCHAR(10) NULL,
    PRIMARY KEY (customer_ID));
    
-- CREO TABLA SALESPERSONS
CREATE TABLE IF NOT EXISTS lab_mysql. salespersons (
	staff_ID INT NOT NULL AUTO_INCREMENT,
	staff_ID_number VARCHAR(20) NOT NULL,
    name VARCHAR(20) NOT NULL,
    store VARCHAR(20) NOT NULL,
    PRIMARY KEY(staff_ID));
    
-- CREO TABLA INVOICES
CREATE TABLE IF NOT EXISTS lab_mysql. invoices (
	invoice_ID INT NOT NULL AUTO_INCREMENT,
    invoice_number INT NOT NULL,
    emision_date DATE NOT NULL,
    car_ID INT NOT NULL,
    customer_ID INT NOT NULL,
    staff_ID INT NOT NULL,
    PRIMARY KEY(invoice_ID));
    
-- CHALLENGE 3 --

-- INSERTO FILAS EN CARS
INSERT INTO cars (VIN, manufacturer, model, registration_year, color)
VALUES
("3K096I98581DHSNUP", "Volkswagen", "Tiguan", 2019, "Blue"),
("ZM8G7BEUQZ97IH46V", "Peugeot", "Rifter", 2019, "Red"),
("RKXVNNIHLVVZOUB4M", "Ford", "Fusion", 2018, "White"),
("HKNDGS7CU31E9Z7JW", "Toyota", "RAV4", 2018, "Silver"),
("DAM41UDN3CHU2WVF6", "Volvo", "V60", 2019, "Gray"),
("DAM41UDN3CHU2WVF6", "Volvo", "V60 Cross Country", 2019, "Gray");

-- INSERTO FILAS EN CUSTOMERS
INSERT INTO customers (customer_ID_number, name, phone, email, address, city, state, country, postal_code)
VALUES
(10001, "Pablo Picasso", "+34 636 17 63 82", "-", "Paseo de la Chopera, 14", "Madrid", "Madrid", "Spain", 28045),
(20001, "Abraham Lincoln", "+1 305 907 7086", "-", "120 SW 8th St", "Miami", "Florida", "United States", 33130),
(30001, "Napoléon Bonaparte", "+33 1 79 75 40 00", "-", "40 Rue du Colisée", "Paris", "Île-de-France", "France", 75008);

-- INSERTO DATOS EN SALESPERSONS
INSERT INTO salespersons (staff_ID_number, name, store)
VALUES
(00001, "Petey Cruiser", "Madrid"),
(00002, "Anna Sthesia", "Barcelona"),
(00003, "Paul Molive", "Berlin"),
(00004, "Gail Forcewind", "Paris"),
(00005, "Paige Turner", "Mimia"),
(00006, "Bob Frapples", "Mexico City"),
(00007, "Walter Melon", "Amsterdam"),
(00008, "Shonda Leer", "Sao Paulo");

-- INSERTO DATOS EN INVOICES
INSERT INTO invoices (invoice_number, emision_date, car_ID, customer_ID, staff_ID)
VALUES
(852399038, "2018-08-22", 0, 1, 3),
(731166526, "2018-12-31", 3, 0, 5),
(271135104, "2019-01-22", 2, 2, 7);

-- BONUS CHALLENGE --

-- ARREGLAMOS UN FALLO EN LA TABLA SALESPERSONS E INSERTAMOS NUEVA INFO EN CUSTOMERS
UPDATE salespersons
SET store = "Maimi"
WHERE store = "Mimia";

UPDATE customers
SET email = "ppicasso@gmail.com" WHERE name = "Pablo Picasso";
UPDATE customers
SET email = "lincoln@us.gov" WHERE name = "Abraham Lincoln";
UPDATE customers
SET email = "hello@napoleon.me" WHERE name = "Napoléon Bonaparte";

-- ELIMINAMOS UN DUPLICADO
DELETE FROM cars WHERE car_ID = 5;
