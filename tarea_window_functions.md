##### Diego Arellano Zamudio

# Tarea Window Functions

#### Debemos calcular para cada cliente su promedio mensual de deltas en los pagos de sus órdenes en la tabla order_details en la BD de Northwind, es decir, la diferencia entre el monto total de una orden en tiempo t y el anterior en t-1, para tener la foto completa sobre el customer lifetime value de cada miembro de nuestra cartera.

```sql
with pagos as ( --Obtenemos los pagos de los clientes 
	select o.customer_id, o.order_date as fecha,sum(od.quantity*od.unit_price*(1 - od.discount)) :: numeric as pago_t
	from order_details od join orders o using (order_id)
	group by o.customer_id, fecha
	order by o.customer_id, fecha
), deltas as ( --Obtenemos la diferencia de los pagos usando window functions 
	select *, lag(p.pago_t, 1, 0.0) over w as pago_tmenos1, p.pago_t - lag(p.pago_t, 1, 0.0) over w as delta
	from pagos p
	
	window w as (partition by p.customer_id)
)

--Agrupamos las deltas por cliente, año y mes, sacamos el promedio de las delta en el mes
select d.customer_id, extract(year from d.fecha) as anio,extract(month from d.fecha) as mes, avg(d.delta) as promedio_mes_deltas
from deltas d
group by d.customer_id, extract(year from d.fecha), extract(month from d.fecha)
order by d.customer_id, extract(year from d.fecha), extract(month from d.fecha)
```
