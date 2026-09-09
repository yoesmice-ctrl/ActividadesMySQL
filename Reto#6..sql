-- 1. Crear tabla de prueba
CREATE TABLE IF NOT EXISTS productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    categoria VARCHAR(50)
);

-- 2. Insertar registros de prueba
INSERT INTO productos (nombre, categoria) VALUES
('Smart TV 55"', 'Tecnología'),
('Licuadora Digital', 'Electrodomésticos'),
('Nevera Smart', 'Electrodomésticos'),
('Smartphone', 'Tecnología'),
('Cafetera Tradicional', 'Electrodomésticos'),
('Smart Watch', 'Ropa');

-- 3. CONSULTA DEL RETO
SELECT *
FROM productos
WHERE categoria IN ('Electrodomésticos', 'Tecnología')
  AND nombre LIKE '%Smart%';