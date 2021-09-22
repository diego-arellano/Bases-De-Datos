
--Reporte de edades
select e.first_name, e.last_name, age(e.birth_date) 
from employees e;

--Orden más reciente por cliente 
select c.contact_name, max(o.order_date) 
from orders o join customers c on (c.customer_id = o.customer_id)
group by c.contact_name;  

--de nuestros clientes, ¿qué función desempeñan y cuántos son?
select c.contact_title, count(c.contact_title) 
from customers c 
group by c.contact_title;

--¿Cuántos productos tenemos de cada categoría?
select c.category_name, count(p.category_id)
from products p join categories c on(c.category_id = p.category_id)
group by p.category_id, c.category_name
order by p.category_id asc;

--¿Cómo podemos generar el reporte de reorder?
select p.product_name, p.reorder_level 
from products p;

--select o.customer_id, count(o.customer_id) > 1 as reorder
--from orders o
--group by o.customer_id;

--¿A donde va nuestro envío más voluminoso?
select od.quantity, o.ship_country 
from order_details od join orders o on (od.order_id = o.order_id)
order by od.quantity desc limit 1;

--¿Cómo creamos una columna en customers que nos diga si un cliente es bueno, regular, o malo?
alter table customers 
add column calidad varchar(7) default 'regular';

alter table customers
add constraint CK_customers_calidad check (calidad in ('bueno', 'regular', 'malo'); 

--¿Qué colaboradores chambearon durante las fiestas de navidad?
select e.first_name, e.last_name 
from orders o join employees e on (o.employee_id = e.employee_id)
where extract(month from o.shipped_date) = 12 and extract(day from o.shipped_date) = 25;

--¿Qué productos mandamos en navidad?
select p.product_name 
from products p join order_details od on (p.product_id = od.product_id) join orders o on (od.order_id = o.order_id)
where extract(month from o.shipped_date) = 12 and extract(day from o.shipped_date) = 25;

--¿Qué país recibe el mayor volumen de producto?
select o.ship_country, sum(od.quantity) 
from order_details od join orders o on (od.order_id = o.order_id)
group by o.ship_country 
order by sum(od.quantity) desc limit 1;
