select 고객번호, 고객회사명, 담당자명, 마일리지
from 고객
where 마일리지 = (select max(마일리지)
				from 고객);
                
select 고객회사명, 담당자명
from 고객
where 고객번호 = (select 고객번호
				from 주문
				where 주문번호 = 'H0250');
                
select 고객회사명, 담당자명
from 고객
inner join 주문
on 고객.고객번호 = 주문.고객번호
where 주문번호 = 'H0250';

select count(*) as 고객수
from 고객
where 마일리지 > (select max(마일리지)
				from 고객
                where 도시 = '부산광역시');
                
select max(마일리지)
from 고객
where 도시 = '부산광역시';

select count(*)
from 고객
where 도시 = '부산광역시';

select count(*) as 주문건수
from 주문
where 고객번호 in (select 고객번호
				from 고객
                where 도시 = '부산광역시');
                
select count(*) #담당자명,고객회사명,마일리지
from 고객
where 마일리지 > any (select 마일리지
					from 고객
                    where 도시 = '부산광역시');
                    
select 담당자명, 고객회사명, 마일리지
from 고객
where 마일리지 > all (select avg(마일리지)
					from 고객
					group by 지역);
                    
select distinct 고객번호, 고객회사명
from 고객
where exists (select *
			  from 주문
              where 고객번호 = 고객.고객번호);
                    
select 고객번호, 고객회사명
from 고객
where 고객번호 in (select distinct 고객번호
				from 주문);
                
select distinct 고객.고객번호, 고객회사명
from 고객
inner join 주문
on 고객.고객번호 = 주문.고객번호;

select 도시, avg(마일리지) as 평균마일리지
from 고객
group by 도시
having avg(마일리지) > (select avg(마일리지)
					 from 고객);
                     
select 담당자명, 고객회사명, 마일리지, 고객.도시, 도시_평균마일리지, 도시_평균마일리지 - 마일리지 as 차이
from 고객,
	 (select 도시, avg(마일리지) AS 도시_평균마일리지
     from 고객
     group by 도시) as 도시별요약
where 고객.도시 = 도시별요약.도시;

select 고객번호,담당자명, (select max(주문일)
					  from 주문
                      where 주문.고객번호 = 고객.고객번호) as 최종주문일
from 고객;

with 도시별요약 as
	(
	 select 도시,avg(마일리지) as 도시_평균마일리지
     from 고객
     group by 도시
     )
     
select 담당자명,고객회사명,마일리지,고객.도시,도시_평균마일리지,도시_평균마일리지 - 마일리지 as 차이
from 고객, 도시별요약
where 고객.도시 = 도시별요약.도시;    

# select 사원번호, 이름, 상사번호, (select d이 