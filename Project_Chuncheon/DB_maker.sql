create database tourdb;
use tourdb;
-- usertbl 만들기
create table usertbl
(user_ID varchar(20) not null primary key,
user_name varchar(10) not null,
user_mobile char(11));

-- place 테이블 만들기
create table place
(place_ID smallint unsigned not null primary key,
place_name varchar(30) not null,
price int,
place_sort text,
place_location text not null,
region varchar(5) not null,
bus_num varchar(5));

-- 식당 테이블 만들기
CREATE TABLE restaurant
    (restaurant_ID smallint unsigned not null primary key,
    restaurant_name varchar(20) not null,
    restaurant_mobile char(15),
    restaurant_sort text not null,
     nearplace smallint unsigned,
     reataurant_location text not null,
     region varchar(5) not null,
   bus_num varchar(5));
   
   -- 관광지 평가 테이블 만들기
    CREATE TABLE place_review
(place_ID smallint unsigned not null ,
user_ID varchar(20) not null,
place_review varchar(40) not null,
place_score int(10) not null,
constraint p_review primary key(place_ID, user_ID));

-- 맛집 평가 테이블 만들기
CREATE TABLE restaurant_review
(restaurant_ID smallint unsigned not null, 
user_ID varchar(20) not null,
restaurant_review varchar(40) not null,
restaurant_score int(10) not null,
primary key(restaurant_ID,user_ID));

-- 관광코스 테이블 만들기
create table travel_route
(route_ID varchar(50) not null  primary key,
route_name char(4) not null,
region varchar(5) not null,
place_1 smallint unsigned not null,
place_2 smallint unsigned not null,
place_3 smallint unsigned  not null,
place_4 smallint unsigned  not null);

-- 버스 테이블 만들기
create table bus
(bus_num varchar(5) not null primary key,
bus_time varchar(12) not null,
bus_operation_time varchar(30) not null);

-- forein key 연결하기
alter table place add price int after place_name;
alter table restaurant_review add(foreign key(user_ID) references usertbl(user_ID));
alter table restaurant_review add(foreign key(restaurant_ID) references restaurant(restaurant_ID));
alter table restaurant add(foreign key(nearplace) references place(place_ID));
alter table place_review add(foreign key(place_ID) references place(place_ID));
alter table place_review add(foreign key(user_ID) references usertbl(user_ID));
alter table restaurant add(foreign key(bus_num) references bus(bus_num));
alter table place add(foreign key(bus_num) references bus(bus_num));
alter table travel_route add(foreign key(place_1) references place(place_ID));
alter table travel_route add(foreign key(place_2) references place(place_ID));
alter table travel_route add(foreign key(place_3) references place(place_ID));
alter table travel_route add(foreign key(place_4) references place(place_ID));
-- 데이터 정리

-- 사용자 데이터
insert into usertbl values (1, '김선빈', '01090532671'),(2,'황보민서','01082386740');
-- 버스데이터
insert into bus values 
('2','15분','오전6시40분~오후21시40분'),('4','30분','오전6시~오후21시35분'),('8','10분','오전7시~오후21시35분'),('10','30분','오전6시~오후21시35분'),('11','20분','오전5시55분~오후22:00'),('12','10분','오전7시~오후21시35분')
,('7','70분','오전5시50분~오후19시'),('400','25분','오전6시~오후21시35분') ;
-- 관광지 데이터
insert into place values
(1,'검봉산',2000,'자연명소','강원도 춘천시 남산면 강촌리','남산면','7'),
(2,'구곡폭포',0,'자연명소','강원도 춘천시 남산면 강촌구곡길 254','남산면','7'),
(4,'청평사',2000,'문화유산','강원 춘천시 북산면 오봉산길 810','북산면','12'),
(5,'소양강스카이워크',2000,'기타명소','강원도 춘천시 영서로 2663','근화동','11'),
(6,'의암호스카이워크',0,'기타명소','강원도 춘천시 칠전동 485','칠전동','7');
-- 맛집데이터
insert into restaurant values (20, '남경', '033-256-5114', '중식', null, '강원도 춘천시 소양고개길 20', '소양동', 11),
(22, '5gam', '010-9305-0800', '카페', null, '강원도 춘천시 옛경춘로 803', '강남동', 4),
 (23, '북경관', '033-243-3001', '중식', null, '강원도 춘천시 공지로 426', '근화동', 8),
(24, '대원장', '033-254-4520', '중식', null, '강원도 춘천시 금강로 20-1', '소양동', 11),
 (25, '만강', '033-262-5900', '일식', null, '강원도 춘천시 동내면 외솔길길 19번지 61', '동내면', 10),
(26, 'bloom in coffee', '033-253-1301', '카페', null, '강원도 춘천시 후석로 441번길 6', '후평1동', 12),
 (27, '이비가짬뽕춘천점', '033-252-9388', '중식', null, '강원도 춘천시 영서로 2652 2층', '근화동', 8),
(1,'50년전통닭갈비막국수',033-243-7776,'한식',null,'강원도 춘천시 춘주로 92번길 38','온의동',400),
(2,'50년평양냉면',033-252-5042,'한식',null,'강원도 춘천시 아침길 17-21','조양동',2),
(3,'가야촌유황오리',033-262-9897,'한식',null,'강원도 춘천시 동내면 춘천순환로 65','동내면',2),
(4,'델모니코스',033-252-0999,'양식',null,'강원도 춘천시 동면 순환대로 1154-106','장학리',400),
(5,'돈까스클럽','033-256-5836','양식',null,'강원도 춘천시 춘천로 429','후평동',2),
(6,'돈스간스',033-252-9957,'양식',null,'강원도 춘천시 충열로16번길 21-10','우두동',11);
 
-- 관광지, 맛집 평가데이터
insert into restaurant_review values(20, 1, '탕수육이 정말 맛있습니다',5),(22, 1,'인스타 감성 카페, 가격이 비싸요',2),(25,2,'조용한 분위기 좋아하시면 추천드립니다. 맛은 그럭저럭',3);
insert into place_review values(4,2,'청평사를 갈 때 마다 마음이 편안해집니다.',5),(5,1,'아이들과 함께 갔는데 정말 좋아했어요',4),(1,1,'가는길이 조금 불편하네요.',1);