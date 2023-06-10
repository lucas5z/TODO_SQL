--suma del costo total de seguros
select sum(costo_anul) from seguros;
--cuanto cuesta el seguro mas caro y el mas barato 
select max(costo_anul) as seguro_mas_caro from seguros;
select min(costo_anul) from seguros;

--cual es el seguro mas caro y mas barato
select * from seguros 
where costo_anul=(select max(costo_anul) as seguro_mas_caro from seguros);
select * from seguros 
where costo_anul=(select min(costo_anul) from seguros);

--quien a contratado el seguro mas caro 
select clientes.document_number_id as nombre
from seguros 
join clientes on clientes.id=seguros.cliente_id
where costo_anul=(select max(costo_anul) as seguro_mas_caro from seguros);

--cuanto dinero a ingresato en 2021
select sum(costo_anul) from seguros 
where extract(year from fecha_inicio)=2021;

--cual es el precio promedio de los veiculos asegurados 
select avg(precio) from vehiculos ;

--cuantos seguros de propiedad hemos vendido
select count(seguro_id) from propideda;

--duanto hsa ingresado por cada tipo de seguro;
select type,sum(costo_anul) from seguros group by type;
--para cada seguro
select sum(costo_anul) from seguros 
where type="vehiculo";

select sum(costo_anul) from seguros 
where type="propiedad";

--cuanto nos a pagado en total cada cliente
select document_number_id as nombre,sum(costo_anul) from seguros 
join clientes 
on clientes.id=seguros.cliente_id 
group by document_number_id,;

--cuanto nos a pagado el cliente por cada tipo de seguro
select document_number_id as nombre,type,sum(costo_anul) from seguros 
join clientes 
on clientes.id=seguros.cliente_id 
group by document_number_id,type;

--cuantos seguros de coche y de propiedad tiene cada cliente
select document_number_id as nombre,type,count(cliente_id) from seguros 
join clientes
on clientes.id=seguros.cliente_id
group by document_number_id,type;