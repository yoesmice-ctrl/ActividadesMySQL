-- 1. Crear tabla clientes con los campos del reto
CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(50),
    fecha_registro DATE
);

-- 2. Insertar registros de prueba
INSERT INTO clientes (nombre, ciudad, fecha_registro) VALUES
('Carlos Pérez', 'Bogotá', '2026-01-10'),
('Ana Gómez', 'Bogotá', '2026-03-15'),
('Luis Martínez', 'Medellín', '2026-02-01'),
('María Rodríguez', 'Bogotá', '2026-05-20'),
('Jorge López', 'Bogotá', '2026-06-11'),
('Diana Torres', 'Bogotá', '2026-07-01'),
('Pedro Ramírez', 'Bogotá', '2026-04-10');

-- 3. CONSULTA DEL RETO
SELECT nombre, fecha_registro
FROM clientes
WHERE ciudad = 'Bogotá'
ORDER BY fecha_registro DESC
LIMIT 5;