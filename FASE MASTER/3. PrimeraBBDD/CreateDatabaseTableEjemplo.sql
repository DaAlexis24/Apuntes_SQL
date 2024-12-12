--CREATE DATABASE Example

-- CREACION DE TABLA MEDIANTE TRANSAC SQL
CREATE TABLE Patient1(
	idPatient int NOT NULL,
	name varchar(50) NOT NULL,
	surname varchar(50) NULL,
	birthDay date NULL,
	address varchar(50) NULL,
	idCountry char(3) NULL,
	phoneNumber varchar(20) NULL,
	email varchar(30) NULL,
	remark varchar(1000) NULL,
	releaseDate datetime NOT NULL,
	CONSTRAINT PK_idPatient PRIMARY KEY (idPatient)
)