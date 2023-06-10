INSERT INTO clients (name, id_document_number) VALUES
("Manolo Rodrigo", "12345678D"),
("Manuel Pepe", "87654321C"),
("Paco de las Cuevas", "54326754C");

INSERT INTO insurances
(client_id, percentage_covered, start_date, end_date,annual_cost, type) VALUES
(1, 30, "2022-01-01", "2023-01-01", 424.35, "propiedad"),
(1, 25, "2019-03-01", "2020-03-01", 180.45, "vehiculo"),
(1, 15, "2020-05-01", "2021-05-01", 82.31, "vehiculo"),
(2, 60, "2021-06-01", "2023-06-01", 980.39, "propiedad"),
(2, 45, "2021-07-01", "2023-07-01", 893.34, "propiedad"),
(3, 10, "2020-02-01", "2021-02-01", 59.43, "vehiculo");

INSERT INTO vehiculos (insurance_id, plate_number, price) VALUES
(2, "1234BCD", 8000),
(3, "4321BCD", 4000),
(6, "4356CDB", 3000);

INSERT INTO propideda (seguro_id, area, ciudad, nombre, unidad) VALUES
(1, 200, "Barcelona", "La Concha", NULL),
(4, 220, "Madrid", "Manolo de las Cuevas", "A"),
(5, 180, "Madrid", "Paseo del mar", "C");
