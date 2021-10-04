Ejercicios filtering 

¿Cuáles pagos no son del cliente con ID 5, y cuyo monto sea mayor a 8 o cuya fecha sea 23 de Agosto de 2005?

```sql
select *
from  payment p 
where p.customer_id != 5 and (p.amount > 8 or p.payment_date between '2005-08-23 00:00:00' and '2005-08-23 23:59:59');
```

¿Cuáles pagos son del cliente con ID 5 y cuyo monto no sea mayor a 6 y su fecha tampoco sea del 19 de Junio de 2005?

```sql
select *
from payment p
where p.customer_id = 5 and p.amount <= 6 and p.payment_date not between '2005-06-19 00:00:00' and '2005-06-19 23:59:59';
```


¿Cuáles pagos tienen el monto 1.98, 7.98 o 9.98?

```sql
select *
from payment p
where p.amount in (1.98,7.98,9.98);
```

¿Cuál es la suma total pagada por los clientes que tienen una letra A en la segunda posición de su apellido y una W en cualquier lugar después de la A?

```sql
select sum(p.amount)
from payment p join rental r on(p.customer_id = r.customer_id)
join customer c on(r.customer_id = c.customer_id)
where c.last_name like '_A%W%';
```

###Construyan un query que regrese emails inválidos de la tabla dada

```sql
create table correos.superheroes (
	nombre varchar(50),
	email varchar(100)
);

drop table correos.superheroes;

insert into correos.superheroes(nombre, email) values 
('Wanda Maximoff',	'wanda.maximoff@avengers.org'), 
('Pietro Maximoff', 'pietro@mail.sokovia.ru'),
('Erik Lensherr', 'fuck_you_charles@brotherhood.of.evil.mutants.space'),
('Charles Xavier', 'i.am.secretely.filled.with.hubris@xavier-school-4-gifted-youngste.'),
('Anthony Edward Stark', 'iamironman@avengers.gov'),
('Steve Rogers', 'americas_ass@anti_avengers'),
('The Vision', 'vis@westview.sword.gov'),
('Clint Barton', 'bul@lse.ye'),
('Natasha Romanov','blackwidow@kgb.ru'),
('Thor', 'god_of_thunder-^_^@royalty.asgard.gov'),
('Logan','wolverine@cyclops_is_a_jerk.com'),
('Ororo Monroe', 'ororo@weather.co'), 
('Scott Summers','o@x'),
('Nathan Summers', 'cable@xfact.or'), 
('Groot', 'iamgroot@asgardiansofthegalaxyledbythor.quillsux'),
('Nebula', 'idonthaveelektras@complex.thanos'),
('Gamora', 'thefiercestwomaninthegalaxy@thanos.'),
('Rocket', 'shhhhhhhh@darknet.ru');

select s.email 
from correos.superheroes s 
where s.email not like '%@%.__%';
```
