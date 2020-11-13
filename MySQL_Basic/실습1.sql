-- 혼자 풀기 문제
use sakila;
-- 1번
desc film;

-- 2번
select film_id, title, rating, special_features from film;

-- 3번
select film_id, title, rating, special_features from film where rating ='R';

-- 4번
select film_id, title, rental_rate, rental_duration from film 
where rental_duration = 5 order by rental_rate desc;
-- 5번
select film_id, title, rental_rate, length from film where length > 180 and rental_rate <= 0.99;

-- 6번, 7번
select address_id, address, district, city_id from Address where district in("Texas", "California");

-- 8번
select title, description from film where description like "%thrilling%"; 

-- 9번
desc city;
select * from country where country like "%korea%"; -- 86
desc city;
select * from city where country_id = 86; -- 113, 268, 357, 539, 553
select address_id, address, district, city_id from address where city_id in(113, 268, 357, 539, 553);

-- 10번
select film_id, title as "China_Movie", description, rental_rate from film 
where description like "%china%" order by rental_rate asc;

-- 11번
select distinct rating as '영화등급의 종류' from film;

-- 12번
select address_id, address2 from address where  address2 is null;
select count(address2) from address;

-- 13번
select sum(length)/60 as "entire_hour" from film;

-- 14번
select avg(length) as "영화길이평균" from film;

-- 15번
select * from payment limit 40;
select min(amount) as '최소값' , max(amount) as '최대값' from payment;

-- 16번
select * from customer limit 40;
select store_id , count(active) from customer 
where active = 1 group by store_id;

-- 17번
select rating, count(film_id) as "number" from film group by rating having number >= 180 order by number desc;
select rating, count(rating) as 'number' from film group by rating having number >= 180 order by number desc;

-- 18번
select customer_id, concat(first_name, last_name) as 'full_name', 
case
when (active = 1) then 'active'
else 'inactive'
end as 'Status'
from customer;

-- 19번
select title, 
case
when (rental_duration<=3) then 'short'
when (rental_duration<6) then 'medium'
when (rental_duration>=6) then 'long'
else null
end as 'Duration'
from film;

-- 20번, 21번
select a.country_id, a.country, b.city_id, b.city
from country a
left join city b
on a.country_id = b.country_id;

-- 22번
select a.rental_id, a.customer_id, b.film_id, b.inventory_id
from rental a
left join inventory b
on a.inventory_id = b.inventory_id;

-- 23번
select  b.inventory_id, a.customer_id, b.film_id, a.rental_id
from rental a
right join inventory b
on a.inventory_id = b.inventory_id;

-- 24번
desc customer;
select * from payment;

select customer_id, concat(first_name, " ", last_name) as 'full_name', email, active
from customer where customer_id in(select customer_id from payment where amount=9.99);

-- 25번 상점번호 = 스테프번호 였음
select customer_id, sum(amount) as '총금액', staff_id as '상점번호'
from (select amount, customer_id, staff_id from payment where amount < 2.99 and staff_id=1) sub group by sub.customer_id having sum(sub.amount)>=5; 

select customer_id, sum(amount) from (select payment_id, customer_id, amount from payment a where a.staff_id=1) sub
where sub.amount < 2.99 group by sub.customer_id having sum(sub.amount) >= 5;

select customer_id, sum(amount) from (select payment_id, customer_id, amount from payment a where a.staff_id=1) sub
where sub.amount<2.99 group by sub.customer_id having sum(sub.amount) >= 5;
-- 26번
select concat(first_name, " ", last_name) as 'full_name' from customer;

-- 27번
select customer_id, substring(first_name,1,3) as 'name' from customer;

-- 28번
 select customer_id, round(avg(amount),2) from payment group by customer_id; 