select 제품명, sum(주문수량) as 주문수량합, sum(주문수량 * 주문세부.단가) as 주문금액합
from 제품
inner join 주문세부
on 제품.제품번호 = 주문세부.제품번호
group by 제품명;

select year(주문일) as 주문년도, 제품명, sum(주문수량) as 주문수량합
from 제품
inner join 주문세부
on 제품.제품번호 = 주문세부.제품번호
inner join 주문
on 주문세부.주문번호 = 주문.주문번호
where 제품명 like '%아이스크림'
group by year(주문일), 제품명
order by 1,2;

select 제품명, sum(주문수량) as 주문수량합
from 제품
left outer join 주문세부
on 제품.제품번호 = 주문세부.제품번호
group by 제품명;

select 고객번호, 고객회사명, 담당자명, 등급명, 마일리지
from 고객
inner join 마일리지등급
on 마일리지 between 하한마일리지 and 상한마일리지
where 등급명 = 'A';