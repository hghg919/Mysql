# 공백처리 실습

select 도시,count(*) as 고객수,avg(마일리지) as 평균마일리지

from 고객

where 지역 is NULL

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