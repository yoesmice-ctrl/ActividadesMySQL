-- 1) Eliminar la tabla si existe para evitar el error
DROP TABLE IF EXISTS productos_prueba;

-- Prerrequisito: Crear la tabla clientes en la sesión
CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- 2) Agregar la columna telefono (texto, máximo 20 caracteres) a la tabla clientes
ALTER TABLE clientes 
ADD COLUMN telefono VARCHAR(20);
DESCRIBE clientes;