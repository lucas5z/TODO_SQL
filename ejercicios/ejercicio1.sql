CREATE TABLE users (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    contraseña VARCHAR(255) NOT NULL

);

CREATE TABLE tasks (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT UNSIGNED NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    descripcion VARCHAR(512) NOT NULL,
    estado BOOLEAN NOT NULL,
    fecha DATETIME NOT NULL,

    FOREIGN KEY (usuario_id) REFERENCES users(id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE

);