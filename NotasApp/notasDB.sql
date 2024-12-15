CREATE DATABASE notasDB;
USE notasDB;

CREATE TABLE estudiantes (
    cedula VARCHAR(20) PRIMARY KEY,  
    nombre VARCHAR(100) NOT NULL,    
    nota DECIMAL(5, 2),            
    estado VARCHAR(20)            
);

ALTER TABLE estudiantes MODIFY column nota INT;

INSERT INTO estudiantes (cedula, nombre, nota, estado)
VALUES
('001-1234567-8', 'Juan Pérez', NULL, NULL),
('002-9876543-2', 'María López', NULL, NULL),
('003-4567890-1', 'Luis Rodríguez', NULL, NULL),
('004-6543210-5', 'Ana Torres', NULL, NULL),
('005-7890123-6', 'Carlos Méndez', NULL, NULL),
('006-3456789-4', 'Elena Ramírez', NULL, NULL),
('007-9871234-0', 'Fernando Castillo', NULL, NULL),
('008-1230987-1', 'Gabriela Fernández', NULL, NULL),
('009-6549873-2', 'Hugo Sánchez', NULL, NULL),
('010-7896541-7', 'Isabel Vega', NULL, NULL),
('011-3214569-3', 'Jorge Morales', NULL, NULL);

select * from estudiantes;

select e.cedula, e.nombre, e.nota, e.estado 
from notasDB.estudiantes e;