DROP DATABASE IF EXISTS banco;

CREATE DATABASE banco;

USE banco;

CREATE TABLE users (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    nombre VARCHAR(255) NOT NULL

);

CREATE TABLE cuenta (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NULL ,
    nombre VARCHAR(255) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    balance VARCHAR(255) NOT NULL,
    type ENUM("PERSONAL","CORPORACION"),

    FOREIGN KEY (user_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT

);

CREATE TABLE tranferencia_cuenta (
    from_cuenta_id INT UNSIGNED NULL,
    to_cuenta_id INT UNSIGNED NULL,
    monto DECIMAL(8,2) NOT NULL,
    dato VARCHAR(255) NOT NULL,
    status VARCHAR(255) NOT NULL,

    FOREIGN KEY (from_cuenta_id) REFERENCES cuenta(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (to_cuenta_id) REFERENCES cuenta(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT

);

CREATE TABLE cuenta_corporativa (
    cuenta_id INT UNSIGNED NULL,

    FOREIGN KEY (cuenta_id) REFERENCES cuenta(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT

);

CREATE TABLE bank_cuenta (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    numero INT NOT NULL UNIQUE

);

CREATE TABLE bank_cuenta_asociada (
    bank_cuenta_id INT UNSIGNED NULL,
    cuenta_id INT UNSIGNED NULL,

    UNIQUE (bank_cuenta_id,cuenta_id),

    FOREIGN KEY (bank_cuenta_id) REFERENCES bank_cuenta(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (cuenta_id) REFERENCES cuenta(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE tranferencia_bank (
    bank_cuenta_id INT UNSIGNED NULL,
    cuenta_id INT UNSIGNED NULL,
    direccion VARCHAR(255) not NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    status VARCHAR(255) NOT NULL,
    monto DECIMAL(8,2) NOT NULL,

    FOREIGN KEY (bank_cuenta_id) REFERENCES bank_cuenta(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (cuenta_id) REFERENCES cuenta(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);




