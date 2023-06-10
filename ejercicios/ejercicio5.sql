DROP DATABASE IF EXISTS seguros;

CREATE DATABASE seguros;

USE seguros;

CREATE TABLE clientes (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    document_number_id VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL

);

CREATE TABLE seguros (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT UNSIGNED NOT NULL,
    porcentage_cubierto TINYINT UNSIGNED NOT NULL,
    fecha_inicio DATETIME NOT NULL,
    fecha_final DATETIME NOT NULL,
    costo_anul DECIMAL(8,2) NOT NULL,
    type ENUM("vehiculo","propiedad"),
    
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CHECK (porcentage_cubierto <= 100)

);

CREATE TABLE vehiculos (
    seguro_id INT UNSIGNED NOT NULL,
    precio DECIMAL(8,2) NOT NULL,
    numero_placa VARCHAR(255) NOT NULL UNIQUE,

    FOREIGN KEY (seguro_id) REFERENCES seguros(id)
);

CREATE TABLE propideda (
    seguro_id INT UNSIGNED NOT NULL,
    area DECIMAL(6,2) NOT NULL,
    ciudad VARCHAR(255) NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    unidad VARCHAR(255) NULL,

    FOREIGN KEY (seguro_id) REFERENCES seguros(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);