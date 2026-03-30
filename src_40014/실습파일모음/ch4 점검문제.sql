select count(도시), count(distinct 도시)
from 고객;

select year(주문일) as 주문년도, count(*) as 주문건수
from 주문
group by year(주문일);

select year(주문일) as 주문년도, quarter(주문일) as 분기, count(*) as 주문건수
from 주문
group by year(주문일), quarter(주문일)
with rollup;

select month(주문일) as 주문월, count(*) as 주문건수
from 주문
where 요청일 < 발송일
group by month(주문일)
order by month(주문일);

select 제품명, sum(재고) as 재고합
from 제품
where 제품명 like '%아이스크림%'
group by 제품명;

select if(마일리지>=50000, 'VIP고객', '일반고객') as 고객구분, count(*) as 고객순, avg(마일리지) as 평균마일리지
from 고객
group by if(마일리지>=50000, 'VIP고객', '일반고객');