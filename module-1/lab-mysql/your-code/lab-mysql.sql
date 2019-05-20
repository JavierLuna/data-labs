CREATE DATABASE lab_mysql;
USE lab_mysql;

-- CREO TABLA CARS
CREATE TABLE CARS (ID VARCHAR(20), VIN VARCHAR(17), MANUFACTURER VARCHAR(20), MODEL VARCHAR(20), CREATE DATABASE lab_mysql;

-- CREO TABLA CARS
CREATE TABLE CARS (ID VARCHAR(20), VIN VARCHAR(17), MANUFACTURER VARCHAR(20), MODEL VARCHAR(20), YEAR VARCHAR(4), COLOR VARCHAR(20));

-- CREO TABLA CUSTOMERS
CREATE TABLE CUSTOMERS (ID VARCHAR(20), CUSTOMER_ID VARCHAR(5), NAME VARCHAR(20), PHONE VARCHAR(20), EMAIL VARCHAR(20), ADDRESS VARCHAR(25), CITY VARCHAR(20), STATE_PROVINCE VARCHAR(20), COUNTRY VARCHAR(20), POSTAL VARCHAR(5));

-- CREO TABLA SALESPERSONS
CREATE TABLE SALESPERSONS (ID VARCHAR(20), STAFF_ID VARCHAR(5), NAME VARCHAR(20), STORE VARCHAR(20));

-- CREO TABLA INVOICES
CREATE TABLE INVOICES (ID VARCHAR(20), INVOICE_NUMBER VARCHAR(9), DATE DATE, CAR VARCHAR(20), CUSTOMER VARCHAR(20), SALES_PERSON VARCHAR(20));

-- INSERTO FILAS EN CARS
INSERT INTO CARS (ID, VIN, MANUFACTURER, MODEL, YEAR, COLOR) VALUES(0, "3K096I98581DHSNUP", "Volkswagen", "Tiguan", 2019, "Blue");
INSERT INTO CARS (ID, VIN, MANUFACTURER, MODEL, YEAR, COLOR) VALUES(1, "ZM8G7BEUQZ97IH46V", "Peugeot", "Rifter", 2019, "Red");
INSERT INTO CARS (ID, VIN, MANUFACTURER, MODEL, YEAR, COLOR) VALUES(2, "RKXVNNIHLVVZOUB4M", "Ford", "Fusion", 2018, "White");
INSERT INTO CARS (ID, VIN, MANUFACTURER, MODEL, YEAR, COLOR) VALUES(3, "HKNDGS7CU31E9Z7JW", "Toyota", "RAV4", 2018, "Silver");
INSERT INTO CARS (ID, VIN, MANUFACTURER, MODEL, YEAR, COLOR) VALUES(4, "DAM41UDN3CHU2WVF6", "Volvo", "V60", 2019, "Gray");
INSERT INTO CARS (ID, VIN, MANUFACTURER, MODEL, YEAR, COLOR) VALUES(5, "DAM41UDN3CHU2WVF6", "Volvo", "V60 Cross Country", 2019, "Gray");

-- INSERTO FILAS EN CUSTOMERS
INSERT INTO CUSTOMERS (ID, CUSTOMER_ID, NAME, PHONE, EMAIL, ADDRESS, CITY, STATE_PROVINCE, COUNTRY, POSTAL) VALUES(0, 10001, "Pablo Picasso", "+34 636 17 63 82", "-", "Paseo de la Chopera, 14", "Madrid", "Madrid", "Spain", 28045);
INSERT INTO CUSTOMERS (ID, CUSTOMER_ID, NAME, PHONE, EMAIL, ADDRESS, CITY, STATE_PROVINCE, COUNTRY, POSTAL) VALUES(1, 20001, "Abraham Lincoln", "+1 305 907 7086", "-", "120 SW 8th St", "Miami", "Florida", "United States", 33130);
INSERT INTO CUSTOMERS (ID, CUSTOMER_ID, NAME, PHONE, EMAIL, ADDRESS, CITY, STATE_PROVINCE, COUNTRY, POSTAL) VALUES(2, 30001, "Napoléon Bonaparte", "+33 1 79 75 40 00", "-", "40 Rue du Colisée", "Paris", "Île-de-France", "France", 75008);

-- INSERTO DATOS EN SALESPERSONS
INSERT INTO SALESPERSONS (ID, STAFF_ID, NAME, STORE) VALUES(0, 00001, "Petey Cruiser", "Madrid");
INSERT INTO SALESPERSONS (ID, STAFF_ID, NAME, STORE) VALUES(1, 00002, "Anna Sthesia", "Barcelona");
INSERT INTO SALESPERSONS (ID, STAFF_ID, NAME, STORE) VALUES(2, 00003, "Paul Molive", "Berlin");
INSERT INTO SALESPERSONS (ID, STAFF_ID, NAME, STORE) VALUES(3, 00004, "Gail Forcewind", "Paris");
INSERT INTO SALESPERSONS (ID, STAFF_ID, NAME, STORE) VALUES(4, 00005, "Paige Turner", "Mimia");
INSERT INTO SALESPERSONS (ID, STAFF_ID, NAME, STORE) VALUES(5, 00006, "Bob Frapples", "Mexico City");
INSERT INTO SALESPERSONS (ID, STAFF_ID, NAME, STORE) VALUES(6, 00007, "Walter Melon", "Amsterdam");
INSERT INTO SALESPERSONS (ID, STAFF_ID, NAME, STORE) VALUES(7, 00008, "Shonda Leer", "Sao Paulo");

-- INSERTO DATOS EN INVOICES
INSERT INTO INVOICES (ID, INVOICE_NUMBER, DATE, CAR, CUSTOMER, SALES_PERSON) VALUES(0, 852399038, "2018-08-22", 0, 1, 3);
INSERT INTO INVOICES (ID, INVOICE_NUMBER, DATE, CAR, CUSTOMER, SALES_PERSON) VALUES(1, 731166526, "2018-12-31", 3, 0, 5);
INSERT INTO INVOICES (ID, INVOICE_NUMBER, DATE, CAR, CUSTOMER, SALES_PERSON) VALUES(2, 271135104, "2019-01-22", 2, 2, 7);

