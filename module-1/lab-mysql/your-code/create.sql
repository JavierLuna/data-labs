-- Tables lab_mysql.cars
CREATE TABLE IF NOT EXISTS 'lab_mysql'.'cars'
'customer_id' INT NOT NULL AUTO_INCREMENT,
'customer_id_number' VARCHAR(20) NOT NULL,
'name' VARCHAR(45) NOT NULL,
'phone' VARCHAR(45) NULL,
'email' VARCHAR(45) NULL,
'address' VARCHAR(100) NULL,
'city' VARCHAR(45) NULL,
'country' VARCHAR(45) NULL,
'postal' VARCHAR(45) NULL