-- Lo primero de todo creamos una base de datos con el comando siguiente:

CREATE DATABASE lab_mysql;

-- Para poder actuar sobre esta base de datos ejecutamos el comando USE:
USE lab_mysql;

-- Para crear una tabla dentro de la base de datos utilizamos CREATE TABLE y entre paréntesis, a modo de parámetros escribimos
-- los nombres de las columnas con el tipo de dato que vamos a utilizar:

CREATE TABLE car ( VIN VARCHAR(20), Manufacturer VARCHAR(45), Model VARCHAR(20), Year INT, Color VARCHAR(45), Adapted BOOL, Electric BOOL, Hybrid BOOL, Diesel BOOL, Gas BOOL);

-- A continuación seguimos generando las tablas que hemos considerado para realizar la base de datos:

CREATE TABLE customer (id_customer INT, Name VARCHAR(45), Lastname VARCHAR(45), Phone_number INT, email VARCHAR(45), Address VARCHAR(45), City VARCHAR(45), State_Province VARCHAR(45), Country VARCHAR(20), ZIP_Postal_Code VARCHAR(20), Date_of_birth DATE );

-- Hemos observado que hay caracteres especiales que no podemos utilizar para los nombres de campos como / o -
CREATE TABLE invoice (id_invoice INT, date DATE, VIN VARCHAR(45), id_customer INT, id_staff INT, id_store INT);
CREATE TABLE salesperson (id_staff INT, Name VARCHAR(45), Lastname VARCHAR(45), id_store INT);
CREATE TABLE store (id_store INT, Address VARCHAR(45), City VARCHAR(45), State_Province VARCHAR(45), Country VARCHAR(20), ZIP_Postal_Code VARCHAR(20));


CREATE SCHEMA IF NOT EXISTS