# 🗄️ Diseño y manipulación de tablas SQL

## 📝 Descripción del proyecto

En esta prueba trabajé con la creación y manipulación de información dentro de una base de datos utilizando **SQL**.

El caso consistió en incorporar un nuevo módulo de **proveedores de capacitación**, creando una tabla con diferentes restricciones y posteriormente realizando operaciones para insertar, actualizar y eliminar información de manera controlada.

---

## 🎯 Objetivos

Durante el desarrollo se trabajó principalmente en:

1. 🏗️ Crear una tabla utilizando comandos **DDL**.
2. ➕ Insertar y validar nuevos registros.
3. ✏️ Actualizar información existente.
4. 🗑️ Eliminar registros utilizando condiciones.
5. 🔐 Aplicar restricciones para mantener la integridad de los datos.

---

## 🏗️ Creación de la tabla

Se creó la tabla:

`proveedores_capacitaciones`

La estructura incorporó diferentes campos y restricciones:

- 🔑 `id_proveedor` — Clave primaria.
- 🏢 `razon_social` — Nombre o razón social del proveedor.
- 🪪 `rut` — Identificador único y obligatorio.
- 📂 `categoria` — Clasificación como **Interno** o **Externo**.
- ✅ `estado` — Estado del proveedor con valor predeterminado verdadero.

---

## ➕ Inserción y validación de registros

Se utilizaron sentencias **INSERT INTO** para incorporar proveedores a la base de datos.

También se realizaron pruebas con registros incorrectos para comprobar las restricciones establecidas:

- ⚠️ Intento de ingresar un **RUT duplicado**.
- ⚠️ Intento de ingresar una **categoría no permitida**.

Estas pruebas permitieron comprobar que las validaciones de la tabla funcionaban correctamente.

---

## ✏️ Actualización de información

Mediante sentencias **UPDATE** se realizaron modificaciones sobre los registros existentes.

Entre ellas:

- 🔄 Cambio de categoría de un proveedor de **Interno a Externo**.
- ⛔ Cambio del estado de otro proveedor a **FALSE**.

---

## 🗑️ Eliminación de registros

Se utilizó la sentencia **DELETE** junto con la cláusula **WHERE** para eliminar únicamente el registro que cumplía con la condición indicada.

El uso correcto de `WHERE` es importante para evitar eliminar información que no corresponde.

---

## 💻 Comandos SQL utilizados

Durante el desarrollo se aplicaron principalmente:

- `CREATE TABLE`
- `PRIMARY KEY`
- `UNIQUE`
- `NOT NULL`
- `CHECK`
- `DEFAULT`
- `INSERT INTO`
- `UPDATE`
- `DELETE`
- `WHERE`

---

## 📁 Archivo del proyecto

Puedes revisar el código SQL completo aquí:

📄 [Ver archivo SQL - Diseño y manipulación de tablas](Prueba%20-%20Dise%C3%B1o%20y%20manipulaci%C3%B3n%20de%20tablas%20SQL.sql)

---

## 🛠️ Herramientas y conocimientos aplicados

- 🗄️ SQL
- 🏗️ DDL — Data Definition Language
- ✏️ DML — Data Manipulation Language
- 🔑 Claves primarias
- 🔒 Restricciones de integridad
- 🔍 Cláusula WHERE
- ✅ Validación de datos

---

## 💡 Aprendizaje

Esta prueba me permitió practicar la creación y modificación de estructuras en una base de datos, además de comprender la importancia de establecer restricciones y utilizar condiciones correctamente al modificar o eliminar información.

También permitió aplicar comandos SQL en situaciones similares a las que se pueden presentar al trabajar con bases de datos reales.

---

⭐ **Proyecto desarrollado como parte de mi formación en Análisis de Datos.**
