CREATE TABLE departamento (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

CREATE TABLE alumno (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nif VARCHAR(255) UNIQUE,
    nombre VARCHAR(255) NOT NULL,
    apellido1 VARCHAR(255) NOT NULL,
    apellido2 VARCHAR(255) NULL,
    ciudad VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono VARCHAR(255),
    fecha_nacimiento DATETIME NOT NULL,
    sexo ENUM("H", "M") NOT NULL
);
CREATE TABLE profesor (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nif VARCHAR(255) UNIQUE,
    nombre VARCHAR(255) NOT NULL,
    apellido1 VARCHAR(255) NOT NULL,
    apellido2 VARCHAR(255),
    ciudad VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono VARCHAR(255),
    fecha_nacimiento DATE NOT NULL,
    sexo ENUM("H", "M") NOT NULL,

    id_departamento INT UNSIGNED NOT NULL,

    FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);
 
 CREATE TABLE grado (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);
 
CREATE TABLE asignatura (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    nombre VARCHAR(255) NOT NULL,
    creditos FLOAT UNSIGNED NOT NULL,
    tipo ENUM("basica", "obligatoria", "optativa") NOT NULL,
    curso TINYINT UNSIGNED NOT NULL,
    cuatrimestre TINYINT UNSIGNED NOT NULL,

    id_profesor INT UNSIGNED NULL,
    id_grado INT UNSIGNED NOT NULL,

    FOREIGN KEY(id_profesor) REFERENCES profesor(id),
    FOREIGN KEY(id_grado) REFERENCES grado(id)
);
INSERT INTO asignatura VALUES ("Ingeniería del Software", 6, "obligatoria", 2, 1, 14, 4);
INSERT INTO asignatura VALUES ("Álgegra lineal y matemática discreta", 6, "basica", 1, 1, NULL, 4);
INSERT INTO asignatura VALUES ("Fisiología animal", 4.5, "obligatoria", 3, 1, NULL, 7);
CREATE TABLE curso_escolar (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    fecha_inicio YEAR NOT NULL,
    fecha_fin YEAR NOT NULL
);

CREATE TABLE alumno_se_matricula_asignatura (
    id_alumno INT UNSIGNED NOT NULL,
    id_asignatura INT UNSIGNED NOT NULL,
    id_curso_escolar INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_alumno, id_asignatura, id_curso_escolar),

    FOREIGN KEY (id_alumno) REFERENCES alumno(id),
    FOREIGN KEY (id_asignatura) REFERENCES asignatura(id),
    FOREIGN KEY (id_curso_escolar) REFERENCES curso_escolar(id)
);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 1, 2);
 
 /* Departamento */
INSERT INTO departamento(nombre) VALUES ("Informática");
INSERT INTO departamento(nombre) VALUES ("Matemáticas");
INSERT INTO departamento(nombre) VALUES ("Economía y Empresa");
INSERT INTO departamento(nombre) VALUES ("Educación");
INSERT INTO departamento(nombre) VALUES ("Agronomía");
INSERT INTO departamento(nombre) VALUES ("Química y Física");
INSERT INTO departamento(nombre) VALUES ("Filología");
INSERT INTO departamento(nombre) VALUES ("Derecho");
INSERT INTO departamento(nombre) VALUES ("Biología y Geología");
 
 /* alumno */
INSERT INTO alumno VALUES ("89542419S", "Juan", "Saez", "Vega", "Almería", "C/ Mercurio", "618253876", "1992/08/08", "H");
INSERT INTO alumno VALUES ("26902806M", "Salvador", "Sánchez", "Pérez", "Almería", "C/ Real del barrio alto", "950254837", "1991/03/28", "H");
INSERT INTO alumno VALUES ("17105885A", "Pedro", "Heller", "Pagac", "Almería", "C/ Estrella fugaz", NULL, "2000/10/05", "H");
INSERT INTO alumno VALUES ("04233869Y", "José", "Koss", "Bayer", "Almería", "C/ Júpiter", "628349590", "1998/01/28", "H");
INSERT INTO alumno VALUES ("97258166K", "Ismael", "Strosin", "Turcotte", "Almería", "C/ Neptuno", NULL, "1999/05/24", "H");
INSERT INTO alumno VALUES ("82842571K", "Ramón", "Herzog", "Tremblay", "Almería", "C/ Urano", "626351429", "1996/11/21", "H");
INSERT INTO alumno VALUES ("46900725E", "Daniel", "Herman", "Pacocha", "Almería", "C/ Andarax", "679837625", "1997/04/26", "H");
INSERT INTO alumno VALUES ("11578526G", "Inma", "Lakin", "Yundt", "Almería", "C/ Picos de Europa", "678652431", "1998/09/01", "M");
INSERT INTO alumno VALUES ("79089577Y", "Juan", "Gutiérrez", "López", "Almería", "C/ Los pinos", "678652431", "1998/01/01", "H");
INSERT INTO alumno VALUES ("41491230N", "Antonio", "Domínguez", "Guerrero", "Almería", "C/ Cabo de Gata", "626652498", "1999/02/11", "H");
INSERT INTO alumno VALUES ("64753215G", "Irene", "Hernández", "Martínez", "Almería", "C/ Zapillo", "628452384", "1996/03/12", "M");
INSERT INTO alumno VALUES ("85135690V", "Sonia", "Gea", "Ruiz", "Almería", "C/ Mercurio", "678812017", "1995/04/13", "M");


/* Profesor */
INSERT INTO profesor VALUES ("11105554G", "Zoe", "Ramirez", "Gea", "Almería", "C/ Marte", "618223876", "1979/08/19", "M", 1);
INSERT INTO profesor VALUES ("38223286T", "David", "Schmidt", "Fisher", "Almería", "C/ Venus", "678516294", "1978/01/19", "H", 2);
INSERT INTO profesor VALUES ("79503962T", "Cristina", "Lemke", "Rutherford", "Almería", "C/ Saturno", "669162534", "1977/08/21", "M", 3);
INSERT INTO profesor VALUES ("61142000L", "Esther", "Spencer", "Lakin", "Almería", "C/ Plutón", NULL, "1977/05/19", "M", 4);
INSERT INTO profesor VALUES ("85366986W", "Carmen", "Streich", "Hirthe", "Almería", "C/ Almanzora", NULL, "1971-04-29", "M", 4);
INSERT INTO profesor VALUES ("73571384L", "Alfredo", "Stiedemann", "Morissette", "Almería", "C/ Guadalquivir", "950896725", "1980/02/01", "H", 6);
INSERT INTO profesor VALUES ("82937751G", "Manolo", "Hamill", "Kozey", "Almería", "C/ Duero", "950263514", "1977/01/02", "H", 1);
INSERT INTO profesor VALUES ("80502866Z", "Alejandro", "Kohler", "Schoen", "Almería", "C/ Tajo", "668726354", "1980/03/14", "H", 2);
INSERT INTO profesor VALUES ("10485008K", "Antonio", "Fahey", "Considine", "Almería", "C/ Sierra de los Filabres", NULL, "1982/03/18", "H", 3);
INSERT INTO profesor VALUES ("85869555K", "Guillermo", "Ruecker", "Upton", "Almería", "C/ Sierra de Gádor", NULL, "1973/05/05", "H", 4);
INSERT INTO profesor VALUES ("04326833G", "Micaela", "Monahan", "Murray", "Almería", "C/ Veleta", "662765413", "1976/02/25", "H", 5);
INSERT INTO profesor VALUES ("79221403L", "Francesca", "Schowalter", "Muller", "Almería", "C/ Quinto pino", NULL, "1980/10/31", "H", 6);
INSERT INTO profesor VALUES ("13175769N", "Pepe", "Sánchez", "Ruiz", "Almería", "C/ Quinto pino", NULL, "1980/10/16", "H", 1);
INSERT INTO profesor VALUES ("98816696W", "Juan", "Guerrero", "Martínez", "Almería", "C/ Quinto pino", NULL, "1980/11/21", "H", 1);
INSERT INTO profesor VALUES ("77194445M", "María", "Domínguez", "Hernández", "Almería", "C/ Quinto pino", NULL, "1980/12/13", "M", 2);

/* Grado */
INSERT INTO grado VALUES ("Grado en Ingeniería Agrícola (Plan 2015)");
INSERT INTO grado VALUES ("Grado en Ingeniería Eléctrica (Plan 2014)");
INSERT INTO grado VALUES ("Grado en Ingeniería Electrónica Industrial (Plan 2010)");
INSERT INTO grado VALUES ("Grado en Ingeniería Informática (Plan 2015)");
INSERT INTO grado VALUES ("Grado en Ingeniería Mecánica (Plan 2010)");
INSERT INTO grado VALUES ("Grado en Ingeniería Química Industrial (Plan 2010)");
INSERT INTO grado VALUES ("Grado en Biotecnología (Plan 2015)");
INSERT INTO grado VALUES ("Grado en Ciencias Ambientales (Plan 2009)");
INSERT INTO grado VALUES ("Grado en Matemáticas (Plan 2010)");
INSERT INTO grado VALUES ("Grado en Química (Plan 2009)");
 
/* Asignatura */
INSERT INTO asignatura VALUES ("Álgegra lineal y matemática discreta", 6, "basica", 1, 1, NULL, 4);
INSERT INTO asignatura VALUES ("Cálculo", 6, "basica", 1, 1, NULL, 4);
INSERT INTO asignatura VALUES ("Física para informática", 6, "basica", 1, 1, NULL, 4);
INSERT INTO asignatura VALUES ("Introducción a la programación", 6, "basica", 1, 1, NULL, 4);
INSERT INTO asignatura VALUES ("Organización y gestión de empresas", 6, "basica", 1, 1, NULL, 4);
INSERT INTO asignatura VALUES ("Estadística", 6, "basica", 1, 2, NULL, 4);
INSERT INTO asignatura VALUES ("Estructura y tecnología de computadores", 6, "basica", 1, 2, NULL, 4);
INSERT INTO asignatura VALUES ("Fundamentos de electrónica", 6, "basica", 1, 2, NULL, 4);
INSERT INTO asignatura VALUES ("Lógica y algorítmica", 6, "basica", 1, 2, NULL, 4);
INSERT INTO asignatura VALUES ("Metodología de la programación", 6, "basica", 1, 2, NULL, 4);
INSERT INTO asignatura VALUES ("Arquitectura de Computadores", 6, "basica", 2, 1, 3, 4);
INSERT INTO asignatura VALUES ("Estructura de Datos y Algoritmos I", 6, "obligatoria", 2, 1, 3, 4);
INSERT INTO asignatura VALUES ("Ingeniería del Software", 6, "obligatoria", 2, 1, 14, 4);
INSERT INTO asignatura VALUES ("Sistemas Inteligentes", 6, "obligatoria", 2, 1, 3, 4);
INSERT INTO asignatura VALUES ("Sistemas Operativos", 6, "obligatoria", 2, 1, 14, 4);
INSERT INTO asignatura VALUES ("Bases de Datos", 6, "basica", 2, 2, 14, 4);
INSERT INTO asignatura VALUES ("Estructura de Datos y Algoritmos II", 6, "obligatoria", 2, 2, 14, 4);
INSERT INTO asignatura VALUES ("Fundamentos de Redes de Computadores", 6 ,"obligatoria", 2, 2, 3, 4);
INSERT INTO asignatura VALUES ("Planificación y Gestión de Proyectos Informáticos", 6, "obligatoria", 2, 2, 3, 4);
INSERT INTO asignatura VALUES ("Programación de Servicios Software", 6, "obligatoria", 2, 2, 14, 4);
INSERT INTO asignatura VALUES ("Desarrollo de interfaces de usuario", 6, "obligatoria", 3, 1, 14, 4);
INSERT INTO asignatura VALUES ("Ingeniería de Requisitos", 6, "optativa", 3, 1, NULL, 4);
INSERT INTO asignatura VALUES ("Integración de las Tecnologías de la Información en las Organizaciones", 6, "optativa", 3, 1, NULL, 4);
INSERT INTO asignatura VALUES ("Modelado y Diseño del Software 1", 6, "optativa", 3, 1, NULL, 4);
INSERT INTO asignatura VALUES ("Multiprocesadores", 6, "optativa", 3, 1, NULL, 4);
INSERT INTO asignatura VALUES ("Seguridad y cumplimiento normativo", 6, "optativa", 3, 1, NULL, 4);
INSERT INTO asignatura VALUES ("Sistema de Información para las Organizaciones", 6, "optativa", 3, 1, NULL, 4); 
INSERT INTO asignatura VALUES ("Tecnologías web", 6, "optativa", 3, 1, NULL, 4);
INSERT INTO asignatura VALUES ("Teoría de códigos y criptografía", 6, "optativa", 3, 1, NULL, 4);
INSERT INTO asignatura VALUES ("Administración de bases de datos", 6, "optativa", 3, 2, NULL, 4);
INSERT INTO asignatura VALUES ("Herramientas y Métodos de Ingeniería del Software", 6, "optativa", 3, 2, NULL, 4);
INSERT INTO asignatura VALUES ("Informática industrial y robótica", 6, "optativa", 3, 2, NULL, 4);
INSERT INTO asignatura VALUES ("Ingeniería de Sistemas de Información", 6, "optativa", 3, 2, NULL, 4);
INSERT INTO asignatura VALUES ("Modelado y Diseño del Software 2", 6, "optativa", 3, 2, NULL, 4);
INSERT INTO asignatura VALUES ("Negocio Electrónico", 6, "optativa", 3, 2, NULL, 4);
INSERT INTO asignatura VALUES ("Periféricos e interfaces", 6, "optativa", 3, 2, NULL, 4);
INSERT INTO asignatura VALUES ("Sistemas de tiempo real", 6, "optativa", 3, 2, NULL, 4);
INSERT INTO asignatura VALUES ("Tecnologías de acceso a red", 6, "optativa", 3, 2, NULL, 4);
INSERT INTO asignatura VALUES ("Tratamiento digital de imágenes", 6, "optativa", 3, 2, NULL, 4);
INSERT INTO asignatura VALUES ("Administración de redes y sistemas operativos", 6, "optativa", 4, 1, NULL, 4);
INSERT INTO asignatura VALUES ("Almacenes de Datos", 6, "optativa", 4, 1, NULL, 4);
INSERT INTO asignatura VALUES ("Fiabilidad y Gestión de Riesgos", 6, "optativa", 4, 1, NULL, 4);
INSERT INTO asignatura VALUES ("Líneas de Productos Software", 6, "optativa", 4, 1, NULL, 4);
INSERT INTO asignatura VALUES ("Procesos de Ingeniería del Software 1", 6, "optativa", 4, 1, NULL, 4);
INSERT INTO asignatura VALUES ("Tecnologías multimedia", 6, "optativa", 4, 1, NULL, 4);
INSERT INTO asignatura VALUES ("Análisis y planificación de las TI", 6, "optativa", 4, 2, NULL, 4);
INSERT INTO asignatura VALUES ("Desarrollo Rápido de Aplicaciones", 6, "optativa", 4, 2, NULL, 4);
INSERT INTO asignatura VALUES ("Gestión de la Calidad y de la Innovación Tecnológica", 6, "optativa", 4, 2, NULL, 4);
INSERT INTO asignatura VALUES ("Inteligencia del Negocio", 6, "optativa", 4, 2, NULL, 4);
INSERT INTO asignatura VALUES ("Procesos de Ingeniería del Software 2", 6, "optativa", 4, 2, NULL, 4);
INSERT INTO asignatura VALUES ("Seguridad Informática", 6, "optativa", 4, 2, NULL, 4);
INSERT INTO asignatura VALUES ("Biologia celular", 6, "basica", 1, 1, NULL, 7);
INSERT INTO asignatura VALUES ("Física", 6, "basica", 1, 1, NULL, 7);
INSERT INTO asignatura VALUES ("Matemáticas I", 6, "basica", 1, 1, NULL, 7);
INSERT INTO asignatura VALUES ("Química general", 6, "basica", 1, 1, NULL, 7);
INSERT INTO asignatura VALUES ("Química orgánica", 6, "basica", 1, 1, NULL, 7);
INSERT INTO asignatura VALUES ("Biología vegetal y animal", 6, "basica", 1, 2, NULL, 7);
INSERT INTO asignatura VALUES ("Bioquímica", 6, "basica", 1, 2, NULL, 7);
INSERT INTO asignatura VALUES ("Genética", 6, "basica", 1, 2, NULL, 7);
INSERT INTO asignatura VALUES ("Matemáticas II", 6, "basica", 1, 2, NULL, 7);
INSERT INTO asignatura VALUES ("Microbiología", 6, "basica", 1, 2, NULL, 7);
INSERT INTO asignatura VALUES ("Botánica agrícola", 6, "obligatoria", 2, 1, NULL, 7);
INSERT INTO asignatura VALUES ("Fisiología vegetal", 6, "obligatoria", 2, 1, NULL, 7);
INSERT INTO asignatura VALUES ("Genética molecular", 6, "obligatoria", 2, 1, NULL, 7);
INSERT INTO asignatura VALUES ("Ingeniería bioquímica", 6, "obligatoria", 2, 1, NULL, 7);
INSERT INTO asignatura VALUES ("Termodinámica y cinética química aplicada", 6, "obligatoria", 2, 1, NULL, 7);
INSERT INTO asignatura VALUES ("Biorreactores", 6, "obligatoria", 2, 2, NULL, 7);
INSERT INTO asignatura VALUES ("Biotecnología microbiana", 6, "obligatoria", 2, 2, NULL, 7);
INSERT INTO asignatura VALUES ("Ingeniería genética", 6, "obligatoria", 2, 2, NULL, 7);
INSERT INTO asignatura VALUES ("Inmunología", 6, "obligatoria", 2, 2, NULL, 7);
INSERT INTO asignatura VALUES ("Virología", 6, "obligatoria", 2, 2, NULL, 7);
INSERT INTO asignatura VALUES ("Bases moleculares del desarrollo vegetal", 4.5, "obligatoria", 3, 1, NULL, 7);
INSERT INTO asignatura VALUES ("Fisiología animal", 4.5, "obligatoria", 3, 1, NULL, 7);
INSERT INTO asignatura VALUES ("Metabolismo y biosíntesis de biomoléculas", 6, "obligatoria", 3, 1, NULL, 7);
INSERT INTO asignatura VALUES ("Operaciones de separación", 6, "obligatoria", 3, 1, NULL, 7);
INSERT INTO asignatura VALUES ("Patología molecular de plantas", 4.5, "obligatoria", 3, 1, NULL, 7);
INSERT INTO asignatura VALUES ("Técnicas instrumentales basicas", 4.5, "obligatoria", 3, 1, NULL, 7);
INSERT INTO asignatura VALUES ("Bioinformática", 4.5, "obligatoria", 3, 2, NULL, 7);
INSERT INTO asignatura VALUES ("Biotecnología de los productos hortofrutículas", 4.5, "obligatoria", 3, 2, NULL, 7);
INSERT INTO asignatura VALUES ("Biotecnología vegetal", 6, "obligatoria", 3, 2, NULL, 7);
INSERT INTO asignatura VALUES ("Genómica y proteómica", 4.5, "obligatoria", 3, 2, NULL, 7);
INSERT INTO asignatura VALUES ("Procesos biotecnológicos", 6, "obligatoria", 3, 2, NULL, 7);
INSERT INTO asignatura VALUES ("Técnicas instrumentales avanzadas", 4.5, "obligatoria", 3, 2, NULL, 7);

/* Curso escolar */
INSERT INTO curso_escolar VALUES (2014, 2015);
INSERT INTO curso_escolar VALUES (2015, 2016);
INSERT INTO curso_escolar VALUES (2016, 2017);
INSERT INTO curso_escolar VALUES (2017, 2018);

/* Alumno se matricula en asignatura */
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 1, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 2, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 3, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 4, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 5, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 6, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 7, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 8, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 9, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 10, 1);

INSERT INTO alumno_se_matricula_asignatura VALUES (1, 1, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 2, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 3, 2);

INSERT INTO alumno_se_matricula_asignatura VALUES (1, 1, 3);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 2, 3);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 3, 3);

INSERT INTO alumno_se_matricula_asignatura VALUES (1, 1, 4);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 2, 4);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 3, 4);

INSERT INTO alumno_se_matricula_asignatura VALUES (2, 1, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (2, 2, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (2, 3, 1);

INSERT INTO alumno_se_matricula_asignatura VALUES (4, 1, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 2, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 3, 1);

INSERT INTO alumno_se_matricula_asignatura VALUES (4, 1, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 2, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 3, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 4, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 5, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 6, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 7, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 8, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 9, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 10, 2);