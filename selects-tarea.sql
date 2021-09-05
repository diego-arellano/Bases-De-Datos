
--�Qu� contactos de proveedores tienen la posici�n de sales representative?
select  s.contact_name
from suppliers s 
where s.contact_title = 'Sales Representative';

--�Qu� contactos de proveedores no son marketing managers?
select s.contact_name 
from suppliers s 
where s.contact_title != 'Marketing Manager';

--�Cuales �rdenes no vienen de clientes en Estados Unidos?
select o.order_id, c.customer_id, c.country 
from orders o, customers c 
where o.customer_id = c.customer_id and c.country != 'USA';


--�Qu� productos de los que transportamos son quesos?
select distinct p.product_id, p.product_name 
from order_details od, products p, categories c 
where od.product_id = p.product_id and p.category_id = c.category_id and c.category_name = 'Dairy Products';

--�Qu� ordenes van a B�lgica o Francia?
select o.order_id,o.customer_id, o.ship_country 
from orders o
where o.ship_country = 'Belgium' or o.ship_country = 'France';

--�Qu� �rdenes van a LATAM?
select o.order_id, o.ship_country 
from orders o 
where o.ship_country = 'Mexico' or o.ship_country = 'Brazil' or o.ship_country = 'Venezuela' 
or o.ship_country = 'Argentina';

--�Qu� �rdenes no van a LATAM?
select o.order_id, o.ship_country 
from orders o 
where o.ship_country != 'Mexico' and o.ship_country != 'Brazil' and o.ship_country != 'Venezuela' 
and o.ship_country != 'Argentina';

--Necesitamos los nombres completos de los empleados, nombres y apellidos unidos en un mismo registro
select e.first_name || ' ' || e.last_name full_name
from employees e;

--�Cu�nta lana tenemos en inventario?
select sum(p.units_in_stock*p.unit_price) 
from products p;

--�Cuantos clientes tenemos de cada pa�s?
select c.country, count(c.country) 
from customers c
group by c.country;
