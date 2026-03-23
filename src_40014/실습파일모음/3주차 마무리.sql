select 도시, sum(마일리지)
FROM 고객
where 고객번호 like 'T%'
group by 도시
having sum(마일리지) >= 1000;

select 도시, count(*) as 고객수
from 고객
group by 도시
having count(*) >= 4;

select 도시, count(*) as 고객수, avg(마일리지) as 평균마일리지
from 고객
where 지역 is null
group by 도시
with rollup;

set sql_safe_updates = 0;
update 고객
set 지역=null
where 지역='';
set sql_safe_updates = 1;

select *
from 고객
where 지역 is null;

select 담당자직위, 도시, count(*) as 고객수
from 고객
where 담당자직위 like '%마케팅%'
group by 담당자직위, 도시
with rollup;

select group_concat(distinct 지역)
from 고객;

select 도시, group_concat(고객회사명) as 고객회사명목록
from 고객
group by 도시;