--lista del primer y segundo apellido y nombre de los alunmos 
--alfaveticamente de menor a mayor ;
SELECT apellido1,apellido2,nombre
FROM alumno ORDER BY apellido1,apellido2,nombre ;

--nombre y apellidos de los alumnos q no an dado sus numeros
SELECT nombre,apellido1,apellido2 from alumno
where telefono is NULL;
--lista de alumnos q nacieron en 1999
SELECT * from alumno 
where extract(year from fecha_nacimiento)=1999;
--lista de profesores q no dieron su telefono y nif
SELECT nombre,apellido1,apellido2 from profesor
where telefono is NULL and nif is NULL;
--lista de las asignatures primer cutrimestre del tercer curso grado con identificador 7
select nombre from asignatura 
where cuatrimestre=1 and curso=3 and id_grado=7;