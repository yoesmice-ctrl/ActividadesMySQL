-- 1. Crear tabla con la estructura completa para este reto
CREATE TABLE IF NOT EXISTS productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10,2),
    id_categoria INT
);

-- 2. Insertar registros de prueba con precios e id_categoria
INSERT INTO productos (nombre, precio, id_categoria) VALUES
('Televisor 55"', 450000.00, 1),
('Minibar', 200000.00, 1),
('Audífonos Bluetooth', 80000.00, 2),
('Consola de Juegos', 600000.00, 3),
('Control Inalámbrico', 150000.00, 3);

-- 3. CONSULTA DEL RETO
SELECT id_categoria, AVG(precio) AS precio_promedio
FROM productos
GROUP BY id_categoria
HAVING AVG(precio) > 300000;