--seguros con un precio superior a 400
select * from seguros where costo_anul > 400;

--seguros q cubran el 30% o mas
SELECT * FROM seguros where porcentage_cubierto >= 30;

--seguros contradados antas del 2021
SELECT * FROM seguros where fecha_inicio < "2021-01-01";
SELECT * FROM seguros where extract(year from fecha_inicio)<2021;

--seguros contradados entre 2019 y2021
SELECT * FROM seguros 
where fecha_inicio>= "2019-01-01" and fecha_inicio <="2021-01-01";
SELECT * from seguros 
where  extract(year from fecha_inicio)>= 2019 and extract(year from fecha_inicio)<=2021;
--0
where  extract(year from fecha_inicio) BETWEEN 2019 and 2021;


select * from seguros where costo_anul < 400 or (
fecha_inicio>="2019-01-01" and fecha_inicio <"2020-01-01");

select * from seguros where costo_anul > 400 or extract(year from fecha_inicio) = 2019;


