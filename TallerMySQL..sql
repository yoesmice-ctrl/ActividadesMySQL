-- ============================================================================
-- PREPARACIÓN DEL ENTORNO (Sin comandos de DATABASE)
-- ============================================================================
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;

-- ============================================================================
-- EJERCICIO 01: Construir la base (DDL)
-- ============================================================================
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    ciudad VARCHAR(50) NOT NULL
);

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL CHECK (stock >= 0)
);

CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    fecha_venta DATE NOT NULL,
    CONSTRAINT fk_ventas_clientes FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    CONSTRAINT fk_ventas_productos FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- ============================================================================
-- EJERCICIO 02: Modificar una estructura (ALTER TABLE)
-- ============================================================================
ALTER TABLE clientes ADD COLUMN telefono VARCHAR(20);
ALTER TABLE productos MODIFY COLUMN nombre VARCHAR(150) NOT NULL;

-- ============================================================================
-- EJERCICIO 03: Cargar productos y clientes (DML - INSERT)
-- ============================================================================
INSERT INTO productos (nombre, categoria, precio, stock) VALUES
('Mouse Inalámbrico X', 'Perifericos', 45000.00, 30),
('Teclado Mecánico RGB', 'Perifericos', 120000.00, 15),
('Monitor 24 FHD 75Hz', 'Monitores', 550000.00, 10),
('Monitor Curvo 27 144Hz', 'Monitores', 950000.00, 6),
('Portátil Gamer i7 16GB', 'Computadores', 3500000.00, 4),
('SSD NVMe 1TB HighSpeed', 'Almacenamiento', 280000.00, 20),
('Diadema Gamer 7.1', 'Audio', 180000.00, 12),
('Hub USB-C 6 en 1', 'Accesorios', 75000.00, 25);

INSERT INTO clientes (nombre, email, ciudad, telefono) VALUES
('Carlos Mendoza', 'carlos.m@mail.com', 'Cucuta', '3001234567'),
('Ana María Gómez', 'ana.gomez@mail.com', 'Bogota', '3109876543'),
('Luis Martínez', 'luis.m@mail.com', 'Medellin', '3205554433'),
('Laura Rodríguez', 'laura.r@mail.com', 'Bogota', '3151112233'),
('Pedro Ramírez', 'pedro.r@mail.com', 'Cali', '3189998877'),
('Sofia Torres', 'sofia.t@mail.com', 'Bucaramanga', '3014445566');

-- ============================================================================
-- EJERCICIO 04: Registrar ventas con sentido (DML - INSERT)
-- ============================================================================
INSERT INTO ventas (id_cliente, id_producto, cantidad, fecha_venta) VALUES
(1, 1, 2, '2026-01-10'),
(1, 3, 1, '2026-01-15'),
(2, 2, 1, '2026-01-18'),
(2, 6, 2, '2026-02-01'),
(3, 5, 1, '2026-02-05'),
(3, 7, 1, '2026-02-10'),
(4, 1, 1, '2026-02-12'),
(4, 8, 3, '2026-02-15'),
(5, 4, 1, '2026-02-20'),
(5, 6, 1, '2026-02-22'),
(6, 2, 1, '2026-03-01'),
(6, 8, 2, '2026-03-05');

-- ============================================================================
-- EJERCICIO 05: Corregir y eliminar con seguridad (UPDATE / DELETE)
-- ============================================================================
UPDATE productos SET precio = 48000.00 WHERE id_producto = 1;
UPDATE productos SET stock = stock - 1 WHERE id_producto = 5;
DELETE FROM ventas WHERE id_venta = 12;

-- ============================================================================
-- CONSULTAS DE COMPROBACIÓN (Ejercicios 06 al 10)
-- ============================================================================
-- Ejercicio 06
SELECT nombre, precio AS precio_unitario_cop FROM productos;

-- Ejercicio 07
SELECT * FROM productos WHERE precio > 200000;

-- Ejercicio 08
SELECT * FROM productos WHERE categoria = 'Perifericos' AND precio < 100000;

-- Ejercicio 09
SELECT * FROM productos WHERE precio BETWEEN 100000 AND 600000;

-- Ejercicio 10
SELECT * FROM productos ORDER BY precio ASC;