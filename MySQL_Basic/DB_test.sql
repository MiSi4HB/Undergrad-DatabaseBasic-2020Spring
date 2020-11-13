use tourdb;

-- 테이블 출력문
select * from usertbl;
select * from place;
select * from place_review;
select * from restaurant;
select * from restaurant_review;
select * from bus;
select * from travel_route;

-- 식당과 버스 테이블 조인하기
select r.restaurant_ID,r.restaurant_name,b.bus_num,b.bus_time,b.bus_operation_time
from restaurant r
left join bus b
on r.bus_num =b.bus_num; 

-- 관광지와 버스 테이블 조인하기
select p.place_ID, p.place_name, p.place_location, b.bus_num,b.bus_time,b.bus_operation_time
from place p
left join bus b
on p.bus_num =b.bus_num; 

-- 관광지 주위 맛집 : 관광지 지역을 기준으로 조인해보기 
select p.region, p.place_name, r.restaurant_name, r.restaurant_sort
from place p
left join restaurant r
on p.region = r.region
where  r.restaurant_name is not null; 

-- 관광지와 사용자 평가를 함께보기
select p.place_ID, p.place_name,p.place_sort, r.user_id, r.place_review, r.place_score
from place p
right join place_review r
on p.place_ID = r.place_ID;

-- 맛집과 사용자 평가를 함께보기
select r.restaurant_ID, r.restaurant_name, r.restaurant_sort, v.user_id, v.restaurant_review, v.restaurant_score
from restaurant r
right join restaurant_review v
on r.restaurant_ID = v.restaurant_ID;