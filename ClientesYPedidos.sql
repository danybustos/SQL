-- CREAR BASE DE DATOS
CREATE DATABASE forward_engineer;
USE forward_engineer;

-- CREAR TABLAS
CREATE TABLE clientes (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    direccion VARCHAR(40) NOT NULL,
    telefono INT NOT NULL
);

CREATE TABLE pedidos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    cliente INT,
    FOREIGN KEY(cliente) REFERENCES clientes(id),
    fecha DATE NOT NULL,
    total FLOAT NOT NULL
);

-- GENERAR CLIENTES
INSERT INTO clientes (nombre, direccion, telefono)
VALUES ('Marta', 'Calle 4 Norte, Viña del Mar', 945331751),
		('Carlos', 'Avda Suecia 20, Providencia', 946975136),
        ('Juana', 'Calle Carmen, Linares', 962485763),
        ('Anna', 'Calle Aconcahua, Quillota', 916253548),
        ('Camilo', 'Calle Loreto, Recoleta', 964531278);
        
-- GENERAR PEDIDOS
INSERT INTO pedidos (cliente, fecha, total)
VALUES (3, '2024-05-09', 50.00),
		(1, '2024-06-10', 20.00),
		(4, '2024-12-08', 30.00),
        (4, '2024-12-08', 40.00),
        (5, '2024-02-04', 15.00),
        (4, '2024-12-08', 20.00),
        (5, '2024-02-04', 10.00),
        (2, '2024-07-09', 50.00),
        (2, '2024-07-09', 25.00),
        (3, '2024-05-09', 30.00);
        
-- CLIENTES Y SUS PEDIDOS
SELECT c.nombre, c.direccion, c.telefono, p.fecha, p.total FROM pedidos p RIGHT JOIN clientes c ON p.cliente = c.id;

-- PEDIDOS DE 1 CLIENTE
SELECT * FROM pedidos WHERE cliente = 2;

-- SUMA DE PEDIDOS DE CADA CLIENTE
-- MARTA
SELECT sum(total) AS suma_pedido FROM pedidos WHERE cliente = 1;
-- CARLOS
SELECT sum(total) AS suma_pedido FROM pedidos WHERE cliente = 2;
-- JUANA
SELECT sum(total) AS suma_pedido FROM pedidos WHERE cliente = 3;
-- ANNA
SELECT sum(total) AS suma_pedido FROM pedidos WHERE cliente = 4;
-- CAMILO
SELECT sum(total) AS suma_pedido FROM pedidos WHERE cliente = 5;

-- ELIMINAR CLIENTE Y SUS PEDIDOS
DELETE FROM pedidos WHERE cliente = 3;
DELETE FROM clientes WHERE id=3;

-- CLIENTES CON MÁS PEDIDOS
SELECT cliente, count(*) AS cantidad_de_pedidos FROM pedidos GROUP BY cliente ORDER BY cantidad_de_pedidos DESC LIMIT 3;