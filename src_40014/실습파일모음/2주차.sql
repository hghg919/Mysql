select *
from 한빛무역.고객;

select 고객번호,담당자명,고객회사명,마일리지 as "포인트",마일리지*1.1 as "10%인상된 마일리지"
from 고객;

select 고객번호,담당자명,마일리지
from 고객
WHERE 마일리지 >= 10000;

select 고객번호,담당자명,도시,마일리지 as 포인트
from 고객
WHERE 도시 = '부산광역시'
order by 마일리지 asc;

select *
from 고객
limit 5;

select *
from 고객
order by 마일리지 desc
limit 5;

select distinct 도시
from 고객;