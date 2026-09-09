-- Primero borramos las tablas (en este orden por la foreign key)
DROP TABLE IF EXISTS empleados;
DROP TABLE IF EXISTS departamentos;

-- Ahora las creamos
CREATE TABLE departamentos (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    salario DECIMAL(10,2) CHECK (salario >= 0),
    id_departamento INT NOT NULL,
    fecha_contratacion DATE,
    CONSTRAINT fk_departamento FOREIGN KEY (id_departamento) 
        REFERENCES departamentos(id_departamento)
);

-- Insertar un departamento de prueba
INSERT INTO departamentos (nombre) VALUES ('Tecnología');

-- Insertar un empleado vinculado al departamento
INSERT INTO empleados (nombre, email, salario, id_departamento, fecha_contratacion) 
VALUES ('Carlos Pérez', 'carlos@example.com', 2500.00, 1, '2026-01-15');

-- Consultar los datos para ver el resultado en pantalla
SELECT 
    e.id_empleado, 
    e.nombre AS empleado, 
    e.email, 
    e.salario, 
    d.nombre AS departamento
FROM empleados e
JOIN departamentos d ON e.id_departamento = d.id_departamento;