--CREATE TABLE Payment (
--	idPayment int IDENTITY(1,1) NOT NULL PRIMARY KEY,
--	concept tinyint NOT NULL,
--	datePayment datetime NOT NULL,
--	amount money NOT NULL,
--	state tinyint,
--	remark varchar(1000) 
--)

-- TABLA DE RELACION ENTRE PAGO/PACIENTE/TURNO: Ya que el PACIENTE va a un TURNO y para ello debe de realizar un PAGO
CREATE TABLE PatientPayment (
	idPayment int NOT NULL,
	idPatient int NOT NULL,
	idDuty int NOT NULL,
	PRIMARY KEY (idPayment, idPatient, idDuty)
)