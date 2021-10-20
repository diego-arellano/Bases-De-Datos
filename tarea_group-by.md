#### Diego Arellano Zamudio
# Ejercicios Group By III

## ¿Cómo obtenemos todos los nombres y correos de nuestros clientes canadienses para una campaña?

```sql
select c.first_name || ' ' || c.last_name full_name, c.email, c3.country 
from customer c join address a using(address_id)
join city c2 using(city_id)
join country c3 using (country_id)
where c3.country = 'Canada';
```
## ¿Qué cliente ha rentado más de nuestra sección de adultos?

```sql
select c.first_name || ' ' || c.last_name full_name, count(r.customer_id)
from film f join inventory i using(film_id) 
join rental r using(inventory_id)
join customer c using(customer_id)
where f.rating = 'NC-17'
group by c.customer_id 
order by count(r.customer_id) desc
limit 1;
```

## ¿Qué películas son las más rentadas en todas nuestras stores?

```sql
select distinct on(i.store_id) i.store_id ,f.title, count(f.film_id)
from film f join inventory i using(film_id)
join rental r using(inventory_id)
group by i.store_id, f.film_id 
order by i.store_id, count(f.film_id) desc;
```

## ¿Cuál es nuestro revenue por store?

```sql
select i.store_id, sum(p.amount)
from inventory i join rental r using(inventory_id)
join payment p using(rental_id)
group by i.store_id;
```
