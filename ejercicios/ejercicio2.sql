DROP DATABASE IF EXISTS taxis;

CREATE DATABASE taxis;

USE taxis;

CREATE TABLE conductor (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    numero_de_telefono VARCHAR(255) NOT NULL
);

CREATE Table parkings (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ciudad VARCHAR(255) NOT NULL,
    calle VARCHAR(255) NOT NULL,
    numero VARCHAR(255) NOT NULL
);

CREATE TABLE veiculo (
    id INT UNIQUE AUTO_INCREMENT PRIMARY KEY,
    parking_id INT UNSIGNED NULL,
    placa_veiculo VARCHAR(255) NOT NULL,
    brand VARCHAR(255) NOT NULL,
    modelo VARCHAR(255) NOT NULL,

    FOREIGN KEY(parking_id) REFERENCES parkings(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL

);

CREATE TABLE imagenes_veiculo (
    veiculo_id INT UNIQUE NOT NULL,
    url VARCHAR(255) NOT NULL UNIQUE,
    FOREIGN KEY (veiculo_id) REFERENCES veiculo(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE conductores_veiculos (
    conductor_id INT UNSIGNED NOT NULL PRIMARY KEY,
    veiculo_id INT NOT NULL UNIQUE,
    fecha_inicio DATETIME NOT NULL,
    fecha_fin DATETIME NOT NULL,

    FOREIGN KEY (conductor_id) REFERENCES conductor(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (veiculo_id) REFERENCES veiculo(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);