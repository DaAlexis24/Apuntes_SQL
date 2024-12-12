--CREATE TABLE Concept (
--	idConcept tinyint IDENTITY (1,1) NOT NULL PRIMARY KEY,
--	description varchar(100) NOT NULL
--)

-- tipo de datos de usuario: se usan para evitar incongruencia entre los campos que tienen el mismo nomnbre
-- Como se hace? BBDD -> Programmability -> Types -> User-Defined Data Types -> llena el name y el tipo de dato -> Guarda
-- AHORA DESDE EL QUERY
--CREATE TYPE history from int not null
CREATE TYPE observation from varchar(1000) not null
-- Ahora, ya habiendo creado el TIPO DE DATO, vamos a editar la tabla correspondiente