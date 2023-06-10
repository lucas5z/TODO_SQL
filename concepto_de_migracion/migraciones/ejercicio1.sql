--cambia los atributos de una columna
ALTER TABLE tasks MODIFY COLUMN descripcion VARCHAR(1024) NOT NULL;

--añade un index ala tabla
ALTER TABLE  tasks add index(titulo);
--añade una columna ala tabla
ALTER TABLE tasks ADD COLUMN is_deleted BOOLEAN NOT NULL default false;


ALTER TABLE users MODIFY COLUMN created_at time.time NOT NULL;