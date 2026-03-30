select 23 + 5 as 더하기
,23-5 as 빼기
,23*5 as 곱하기
,23/5 as 나누기
,23 div 5 as 정수나누기
,23 % 5 as 나머지1
,23 mod 5 as 나누기2;

select 23>= 5
, 23 <= 5
,23 = 23
,23 <> 23;

select *
from 고객
where 담당자직위 <> '대표 이사';

select *
from 고객
where 도시 = '부산광역시'
or 마일리지 < 1000;

select 고객번호,담당자명,마일리지,도시
from 고객
where 도시 = '부산광역시'
union
select 고객번호,담당자명,마일리지,도시
from 고객
where 마일리지 < 1000
order by 1;

select 고객번호,담당자명,마일리지,도시
from 고객
where 도시 = '부산광역시'
or 마일리지 < 1000
order by 1;

select *
from 고객
where 지역 is null;

select *
from 고객
where 지역 = '';

select 고객번호,담당자명,담당자직위
from 고객
where 담당자직위 = '영업 과장'
or 담당자직위 = '마케팅 과장';

select 고객번호,담당자명,담당자직위
from 고객
where 담당자직위 in ('영업 과장','마케팅 과장');

select 담당자명, 마일리지
from 고객
where 마일리지 >= 100000
and 마일리지 <= 200000;

select 담당자명, 마일리지
from 고객
where 마일리지 between 100000 and 200000;

select *
from 고객
where 도시 like '%광역시' 
and (고객번호 like '_C%' or 고객번호 like '__C%');