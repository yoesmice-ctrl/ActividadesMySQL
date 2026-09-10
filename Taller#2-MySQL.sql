-- 1. Crear la tabla Producto
CREATE TABLE Producto (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10,2)
);

-- 2. Crear la tabla Venta
CREATE TABLE Venta (
    id_venta INT PRIMARY KEY,
    id_producto INT,
    cantidad INT,
    fecha VARCHAR(10),
    FOREIGN KEY (id_producto) REFERENCES Producto(id)
);

-- 3. Insertar datos de prueba en Producto
INSERT INTO Producto (id, nombre, precio) VALUES 
(1, 'Teclado Mecánico', 85.50),
(2, 'Monitor 24 pulg', 180.00),
(3, 'Mouse Gamer', 45.00);

-- 4. Insertar datos de prueba en Venta
INSERT INTO Venta (id_venta, id_producto, cantidad, fecha) VALUES 
(101, 1, 2, '2026-09-01'),
(102, 2, 1, '2026-09-02'),
(103, 3, 5, '2026-09-03');

-- 5. Consulta final (usa CONCAT para SQL Server)
SELECT 
    p.nombre,
    p.precio,
    v.cantidad,
    v.fecha,
    CONCAT(p.nombre, ' vendido el ', v.fecha) AS detalle_venta
FROM Producto p
JOIN Venta v ON p.id = v.id_producto
ORDER BY p.precio DESC;