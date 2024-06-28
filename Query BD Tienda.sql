-- CREACION BASE DE DATOS

CREATE DATABASE Tienda;
USE Tienda;

-- CREACION TABLAS

CREATE TABLE CLIENTES (
    ID_CLIENTE INT PRIMARY KEY IDENTITY(1,1),
    NOMBRE VARCHAR(100),
    DIRECCION VARCHAR(255),
    TELEFONO VARCHAR(20)
);

CREATE TABLE PROVEEDORES (
    ID_PROVEEDOR INT PRIMARY KEY IDENTITY(1,1),
    NOMBRE VARCHAR(100),
    DIRECCION VARCHAR(255),
    TELEFONO VARCHAR(20)
);

CREATE TABLE CATEGORIAS (
    ID_CATEGORIA INT PRIMARY KEY IDENTITY(1,1),
    DESCRIPCION VARCHAR(255)
);

CREATE TABLE PRODUCTOS (
    ID_PRODUCTO INT PRIMARY KEY IDENTITY(1,1),
    DESCRIPCION VARCHAR(255),
    PRECIO DECIMAL(10, 2),
    ID_CATEGORIA INT,
    ID_PROVEEDOR INT,
    FOREIGN KEY (ID_CATEGORIA) REFERENCES CATEGORIAS(ID_CATEGORIA),
    FOREIGN KEY (ID_PROVEEDOR) REFERENCES PROVEEDORES(ID_PROVEEDOR)
);

CREATE TABLE FACTURAS (
    ID_FACTURA INT PRIMARY KEY IDENTITY(1,1),
    FECHA DATE,
    ID_CLIENTE INT,
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES(ID_CLIENTE)
);

CREATE TABLE VENTAS (
    ID_VENTA INT PRIMARY KEY IDENTITY(1,1),
    ID_FACTURA INT,
    ID_PRODUCTO INT,
    CANTIDAD INT,
    FOREIGN KEY (ID_FACTURA) REFERENCES FACTURAS(ID_FACTURA),
    FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTOS(ID_PRODUCTO)
);

-- INSERTAR DATOS

INSERT INTO CLIENTES (NOMBRE, DIRECCION, TELEFONO) VALUES
('Juan Perez', 'Calle 123', '123456789'),
('Maria Lopez', 'Avenida 456', '987654321'),
('Carlos Gomez', 'Boulevard 789', '555123456'),
('Ana Torres', 'Calle Libertad 456', '555987654');
GO

INSERT INTO PROVEEDORES (NOMBRE, DIRECCION, TELEFONO) VALUES
('Proveedor Central', 'Av. Central 123', '111222333'),
('Distribuidora Norte', 'Calle Norte 456', '444555666'),
('Proveedora Sur', 'Avenida Sur 789', '777888999'),
('Comercial Este', 'Boulevard Este 101', '999888777');
GO

INSERT INTO CATEGORIAS (DESCRIPCION) VALUES
('Electr�nica'),
('Ropa'),
('Alimentos'),
('Hogar');
GO

INSERT INTO PRODUCTOS (DESCRIPCION, PRECIO, ID_CATEGORIA, ID_PROVEEDOR) VALUES
('Televisor 55"', 799.99, 1, 1),
('Laptop Gamer', 1299.99, 1, 2),
('Camisa Algod�n', 25.99, 2, 3),
('Pantal�n Jeans', 39.99, 2, 3),
('Cereal 500g', 4.99, 3, 4),
('Sofa 3 Plazas', 299.99, 4, 1);
GO

INSERT INTO FACTURAS (FECHA, ID_CLIENTE) VALUES
('2024-06-25', 1),
('2024-06-26', 2),
('2024-06-27', 3),
('2024-06-28', 4);
GO

INSERT INTO VENTAS (ID_FACTURA, ID_PRODUCTO, CANTIDAD) VALUES
(1, 1, 1),
(1, 3, 2),
(2, 2, 1),
(3, 5, 5),
(3, 4, 1),
(4, 6, 1);