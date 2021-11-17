##### Diego Arellano Zamudio

# Tarea 2 Funciones

```sql
-- Cada cajita de Blu-Ray mide 20cm x 13.5cm x 1.5cm, y para que el brazo pueda manipular 
--adecuadamente cada cajita, debe estar contenida dentro de un arnés que cambia las medidas a
--30cm x 21cm x 8cm para un espacio total de 5040 centímetros cúbicos y un peso de 500 gr por película.

--Se nos ha encargado formular la medida de dichos cilindros de manera tal que quepan todas las copias 
--de los Blu-Rays de cada uno de nuestros stores. 
--Las medidas deben ser estándar, es decir, la misma para todas nuestras stores, y en cada store pueden ser instalados más de 1 de estos cilindros. 
--Cada cilindro aguanta un peso máximo de 50kg como máximo. 

--Número de películas en las tiendas
with num_peliculas as (
	select s.store_id, count(i.inventory_id) as num_pelis
 	from inventory i join store s using(store_id)
 	group by s.store_id
 ), 
 --Cada cilindro puede contener 50kg, como las películas pesan 500 gr, podemos alamcenar 100 en un cilindro 
 --La altura del cilindro será la altura de cada película con el arnés 8 cm * 100 = 800 cm
altura_cilindro as (
	select 8 * 100 as altura_cilindro
), 
--El diametro del cilindro debe ser suficiente para almacenar la película. Con un radio de 16 cm es suficiente 
radio_cilindro as (
	select 16 as radio_cilindro
), 
--Para saber cuantos cilindros necesita cada tienda dividimos el número de películas entre 100
cilindros_tienda as (
	select np.store_id, ceiling(np.num_pelis/100 :: numeric) as num_cilindros
	from num_peliculas np
)

--Cilindros necesarios en cada tienda 
select * 
from cilindros_tienda

--Calculamos el volumen del cilindro 
select altura_cilindro, radio_cilindro, pi()*power(radio_cilindro, 2)*altura_cilindro as volumen_cilindro
from altura_cilindro, radio_cilindro
```
