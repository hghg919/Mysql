select 고객번호
	   ,고객회사명
       ,마일리지
       ,avg(마일리지) OVER() as 평균마일리지
       ,마일리지 - avg(마일리지) OVER() as 차이
from 고객
where 도시 = '부산광역시';

select 고객번호
	  ,고객회사명
      ,담당자명
      ,마일리지
      ,rank() over(order by 마일리지 desc) as 순위
from 고객
where 도시 = '부산광역시';

select 고객번호
	  ,고객회사명
      ,도시
      ,마일리지
      ,rank() over(partition by 도시 order by 마일리지 desc) as 순위
from 고객
where 지역 = '경기도';

