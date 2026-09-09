-- 1. Crear tabla de prueba
CREATE TABLE IF NOT EXISTS productos (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10,2)
);

-- 2. Insertar los productos de prueba
INSERT INTO productos (id_producto, nombre, precio) 
VALUES (310, 'Producto A', 45.90), (118, 'Producto B', 100.00)
ON DUPLICATE KEY UPDATE id_producto=id_producto;

-- 3. SOLUCIÓN DEL RETO 4
UPDATE productos 
SET precio = 549.00 
WHERE id_producto = 310;

DELETE FROM productos 
WHERE id_producto = 118;

-- 4. Mostrar el resultado final
SELECT * FROM productos;