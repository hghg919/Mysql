select 제품번호, sum(주문수량) as 주문수량합, sum(단가) as 주문금액합
from 주문세부
group by 제품번호;

select 주문번호,group_concat(제품번호) as 제품번호목록,sum(단가) as 주문금액합
from 주문세부
group by 주문번호;

select 고객번호, count(*) as 주문건수
from 주문
group by 고객번호
limit 3;