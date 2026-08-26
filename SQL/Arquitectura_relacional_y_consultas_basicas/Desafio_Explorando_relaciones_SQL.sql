
-- Script base para el desafío: Arquitectura relacional y consultas básicas en SQL

-- Eliminar tablas si existen previamente
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS sucursales;
DROP TABLE IF EXISTS clientes;

-- Crear tabla de clientes
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre TEXT,
    correo TEXT,
    ciudad TEXT
);

-- Crear tabla de productos
CREATE TABLE productos (
    id_producto INT PRIMARY KEY,
    nombre_producto TEXT,
    categoria TEXT,
    precio NUMERIC
);

-- Crear tabla de sucursales
CREATE TABLE sucursales (
    id_sucursal INT PRIMARY KEY,
    nombre_sucursal TEXT,
    ciudad TEXT
);

-- Crear tabla de ventas
CREATE TABLE ventas (
    id_venta INT PRIMARY KEY,
    id_cliente INT,
    id_producto INT,
    id_sucursal INT,
    fecha DATE,
    cantidad INT,
    total NUMERIC,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal)
);

-- Insertar datos de ejemplo en clientes
INSERT INTO clientes VALUES
(1, 'Camila Rojas', 'camila@mail.com', 'Valparaíso'),
(2, 'Luis Pérez', 'luis@mail.com', 'Santiago'),
(3, 'Daniela Soto', 'daniela@mail.com', 'Concepción');

-- Insertar datos de ejemplo en productos
INSERT INTO productos VALUES
(1, 'Notebook Lenovo', 'Tecnología', 550000),
(2, 'Mouse Inalámbrico', 'Accesorios', 15000),
(3, 'Teclado Mecánico', 'Accesorios', 45000);

-- Insertar datos de ejemplo en sucursales
INSERT INTO sucursales VALUES
(1, 'Tienda Centro', 'Santiago'),
(2, 'Tienda Online', 'Internet'),
(3, 'Tienda Valpo', 'Valparaíso');

-- Insertar datos de ejemplo en ventas
INSERT INTO ventas VALUES
(1, 1, 1, 2, '2024-06-21', 1, 550000),
(2, 2, 2, 1, '2024-06-22', 2, 30000),
(3, 3, 3, 3, '2024-06-23', 1, 45000),
(4, 1, 2, 2, '2024-07-01', 1, 15000);
-- Verificar los datos de clientes
SELECT * FROM clientes;

-- Verificar los datos de productos
SELECT * FROM productos;

-- Verificar los datos de sucursales
SELECT * FROM sucursales;

-- Verificar los datos de ventas
SELECT * FROM ventas;

-- Consulta 1: Mostrar cliente, producto y sucursal
-- para las ventas realizadas durante el mes de julio

SELECT
    c.nombre AS cliente,
    p.nombre_producto AS producto,
    s.nombre_sucursal AS tienda
FROM ventas AS v
INNER JOIN clientes AS c
    ON v.id_cliente = c.id_cliente
INNER JOIN productos AS p
    ON v.id_producto = p.id_producto
INNER JOIN sucursales AS s
    ON v.id_sucursal = s.id_sucursal
WHERE strftime('%m', v.fecha) = '07';

-- Consulta 2: Mostrar el total de ventas por ciudad de la sucursal

SELECT
    s.ciudad AS ciudad,
    SUM(v.total) AS total_ventas
FROM ventas AS v
INNER JOIN sucursales AS s
    ON v.id_sucursal = s.id_sucursal
GROUP BY s.ciudad;

-- Consulta 3: Mostrar los productos con más de 1 unidad vendida

SELECT
    p.nombre_producto AS producto,
    SUM(v.cantidad) AS cantidad_total_vendida
FROM ventas AS v
INNER JOIN productos AS p
    ON v.id_producto = p.id_producto
GROUP BY p.id_producto, p.nombre_producto
HAVING SUM(v.cantidad) > 1;

-- Consulta 4: Mostrar la cantidad de ventas realizadas por cada sucursal
-- y el promedio del total vendido por venta

SELECT
    s.nombre_sucursal AS sucursal,
    COUNT(v.id_venta) AS cantidad_ventas,
    AVG(v.total) AS promedio_venta
FROM sucursales AS s
INNER JOIN ventas AS v
    ON s.id_sucursal = v.id_sucursal
GROUP BY s.id_sucursal, s.nombre_sucursal;

-- Consulta 5: Mostrar los clientes que realizaron compras
-- mayores al promedio general de ventas

SELECT DISTINCT
    c.nombre AS cliente
FROM clientes AS c
INNER JOIN ventas AS v
    ON c.id_cliente = v.id_cliente
WHERE v.total > (
    SELECT AVG(total)
    FROM ventas
);

-- Consulta 6: Mostrar el nombre del producto más caro vendido

SELECT
    p.nombre_producto AS producto_mas_caro
FROM productos AS p
INNER JOIN ventas AS v
    ON p.id_producto = v.id_producto
WHERE p.precio = (
    SELECT MAX(p2.precio)
    FROM productos AS p2
    INNER JOIN ventas AS v2
        ON p2.id_producto = v2.id_producto
);