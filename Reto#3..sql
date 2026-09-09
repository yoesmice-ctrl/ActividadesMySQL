-- 1) Se agrega IF EXISTS para evitar el error si la tabla no existe previamente
DROP TABLE IF EXISTS productos_prueba;

-- Prerrequisito para OneCompiler: Crear la tabla clientes si no existe
CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- 2) Agregar la columna telefono a la tabla clientes
ALTER TABLE clientes 
ADD COLUMN telefono VARCHAR(20);

