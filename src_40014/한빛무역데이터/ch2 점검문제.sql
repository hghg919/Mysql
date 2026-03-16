# ch2 점검문제

select *
from 고객
where 전화번호 like '%45';

select *
from 고객
where 전화번호 like '%45_';

select *
from 고객
where 전화번호 like '%45%';

select *
from 고객
where 도시 like '서울%'
and 마일리지 between 15000 and 20000;

select distinct 지역, 도시
from 고객
order by 1,2;

select *
from 고객
where 도시 in ('춘천시', '과천시', '광명시')
and (담당자직위 like '%이사%' or 담당자직위 like '%사원%');

select *
from 고객
where not (도시 like '%광역시' or 도시 like '%특별시')
order by 마일리지 desc
limit 3;

select *
from 고객
where 지역 is not null
and 담당자직위 <> '대표이사';