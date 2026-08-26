-- Creación de la tabla proveedores de capacitaciones
CREATE TABLE proveedores_capacitaciones (
    id_proveedor INTEGER PRIMARY KEY AUTOINCREMENT,
    razon_social TEXT NOT NULL,
    rut TEXT NOT NULL UNIQUE,
    categoria TEXT NOT NULL CHECK (categoria IN ('Interno', 'Externo')),
    estado BOOLEAN NOT NULL DEFAULT TRUE
);

-- Inserción de 4 proveedores válidos
INSERT INTO proveedores_capacitaciones (razon_social, rut, categoria)
VALUES
('Capacitaciones Andes', '76.111.111-1', 'Interno'),
('Formacion Chile', '76.222.222-2', 'Externo'),
('Aprende SPA', '76.333.333-3', 'Interno'),
('Consultora Pacifico', '76.444.444-4', 'Externo');

-- Verificamos que los proveedores fueron ingresados correctamente
SELECT * FROM proveedores_capacitaciones;

-- Prueba de error: RUT duplicado
-- Este registro no debe ingresarse porque el RUT ya existe.
INSERT INTO proveedores_capacitaciones (razon_social, rut, categoria)
VALUES ('Capacitaciones Sur', '76.111.111-1', 'Externo');

-- Prueba de error: categoría no válida
-- Este registro no debe ingresarse porque la categoría solo puede ser Interno o Externo.
INSERT INTO proveedores_capacitaciones (razon_social, rut, categoria)
VALUES ('Centro de Estudios', '76.555.555-5', 'Nacional');


-- Verificamos el proveedor antes de actualizar
SELECT * FROM proveedores_capacitaciones
WHERE id_proveedor = 1;

-- Cambiamos la categoría de Interno a Externo
UPDATE proveedores_capacitaciones
SET categoria = 'Externo'
WHERE id_proveedor = 1;

-- Verificamos el cambio realizado
SELECT * FROM proveedores_capacitaciones
WHERE id_proveedor = 1;


-- Verificamos el proveedor antes de actualizar su estado
SELECT * FROM proveedores_capacitaciones
WHERE id_proveedor = 2;

-- Cambiamos el estado del proveedor a FALSE
UPDATE proveedores_capacitaciones
SET estado = FALSE
WHERE id_proveedor = 2;

-- Verificamos el cambio realizado
SELECT * FROM proveedores_capacitaciones
WHERE id_proveedor = 2;

-- Verificamos qué proveedor tiene estado FALSE antes de eliminar
SELECT * FROM proveedores_capacitaciones
WHERE estado = FALSE;

-- Eliminamos únicamente al proveedor que tiene estado FALSE
-- Es importante usar WHERE para evitar eliminar todos los registros de la tabla.
DELETE FROM proveedores_capacitaciones
WHERE estado = FALSE;

-- Verificamos los registros que quedan después de eliminar
SELECT * FROM proveedores_capacitaciones;