-- DESAFÍO: ARQUITECTURA RELACIONAL Y CONSULTAS BÁSICAS EN SQL

-- CONSULTA 1
SELECT nombre, correo
FROM clientes
WHERE ciudad = 'Valparaíso';

-- CONSULTA 2
SELECT c.nombre, v.total
FROM ventas v
JOIN clientes c
    ON v.id_cliente = c.id_cliente
WHERE strftime('%m', v.fecha) = '06';

-- CONSULTA 3
SELECT
    s.nombre_sucursal,
    SUM(v.cantidad) AS total_productos_vendidos
FROM ventas v
JOIN sucursales s
    ON v.id_sucursal = s.id_sucursal
GROUP BY s.nombre_sucursal;