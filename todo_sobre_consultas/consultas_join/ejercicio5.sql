select * from clientes join seguros;

select * from clientes join seguros
on clientes.id = seguros.cliente_id

--queremos ver nombre del cliente, tipos de seguro q tiene y el coste anual 
select name,type,costo_anul from clientes join seguros on seguros.cliente_id=clientes.id;
select clientes.name,seguros.type,seguros.costo_anul from clientes join seguros on seguros.cliente_id=clientes.id;

--queros saber el numero de matricula, precio y costo anul del seguros de los vehiculos
select vehiculos.precio,vehiculos.numero_placa,seguros.costo_anul from vehiculos
join seguros on vehiculos.seguro_id=seguros.id;

select 
clientes.document_number_id as nombre,
propideda.area,
propideda.ciudad,
seguros.costo_anul
from clientes 
join seguros on clientes.id=seguros.cliente_id 
join propideda on seguros.id=propideda.seguro_id;
