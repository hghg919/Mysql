select *
from 제품
where 제품명 like '%주스%';

select *
from 제품
where 제품명 like '%주스%'
and 단가 between 5000 and 10000;

select *
from 제품
where 제품번호 in('1','2','4','7','11','20');

select 제품번호, 제품명, 단가, 재고, 단가*재고 as 재고금액
from 제품
order by 재고금액 desc
limit 10;

