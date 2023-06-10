DROP DATABASE IF EXISTS ig;

CREATE DATABASE ig;

USE ig;

CREATE TABLE users (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    nombre VARCHAR(255) NOT NULL

);

CREATE TABLE perfil (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    user_name VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    perfil_foto VARCHAR(255) NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE follows (
    perfil_id INT UNSIGNED NOT NULL,
    follows_perfil_id INT UNSIGNED NOT NULL,
    
    PRIMARY KEY (perfil_id,follows_perfil_id),
    
    FOREIGN KEY (perfil_id) REFERENCES perfil(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
        
    FOREIGN KEY (follows_perfil_id) REFERENCES perfil(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
  
);

CREATE TABLE posts (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    perfil_id INT UNSIGNED NULL,
    descripcion VARCHAR(511) NULL,
    dato VARCHAR(255) NOT NULL,

    FOREIGN KEY (perfil_id) REFERENCES perfil(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE post_img (
    post_id INT UNSIGNED NOT NULL,
    url VARCHAR(255) NOT NULL,

    FOREIGN KEY (post_id) REFERENCES posts(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE comentarios (
    perfil_id INT UNSIGNED NULL,
    post_id INT UNSIGNED NULL,
    comentario VARCHAR(511) NOT NULL,
    dato VARCHAR(255) NOT NULL,

    FOREIGN KEY (perfil_id) REFERENCES perfil(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    FOREIGN KEY (post_id) REFERENCES posts(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE

);