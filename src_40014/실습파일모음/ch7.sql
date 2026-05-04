insert into 부서
values('A5', '마케팅부');

select * from 부서;

insert into 부서
values('A6', '관리부');

select * from 부서;

insert into 제품
values(91, '연어피클소스', null, 5000, 40);

select * from 제품;

insert into 제품
values(90, '연어피클소스', null, 5000, 40);

insert into 사원(사원번호,이름,직위,성별,입사일)
values('E20', '김사과', '수습사원', '남', curdate())
	,('E21', '박나나나', '수습사원', '여', curdate())
    ,('E22', '정오렌지', '수습사원', '여', curdate());
    
select * from 사원;

update 사원
set 이름 = '김레몬'
where 사원번호 = 'E20';

update 제품
set 포장단위 = '200 ml bottles'
where 제품번호 = 91;

update 제품
set 단가 = 단가 * 1.1, 재고 = 재고 - 10
where 제품번호 = 91;

delete from 제품
where 제품번호 = 91;

delete from 사원
order by 입사일 desc
limit 3;

select *
from 사원
where 이름 in ('김레몬','박바나나','정오렌지');

insert into 제품(제품번호, 제품명, 단가, 재고)
values(91, '연어피클핫소스', 6000, 50)
on duplicate key update
제품명 = '연어피클핫소스', 단가 = 6000, 재고 = 50;

create table 고객주문요약
(
고객번호 char(5) primary key
,고객회사명 varchar(50)
,주문건수 int
,최종주문일 date
);

insert into 고객주문요약
	   select 고객.고객번호, 고객회사명, count(*), max(주문일)
       from 고객, 주문
       where 고객.고객번호 = 주문.고객번호
       group by 고객.고객번호, 고객회사명;
       
update 제품
set 단가 = (
		   select *
           from (
				 select avg(단가)
                 from 제품
                 where 제품명 like '%소스%'
                 ) as t
           )
where 제품번호 = 91;           

use 한빛무역1;

update 고객
	  ,(select distinct 고객번호
        from 주문) as 주문고객
set 마일리지 = 마일리지 * 1.1
where 고객.고객번호 in (주문고객.고객번호);
 
select *
from 고객
where 고객번호 in (select distinct 고객번호
				 from 주문
                 );
                 
update 고객
inner join 마일리지등급
on 마일리지 between 하한마일리지 and 상한마일리지
set 마일리지 = 마일리지 + 1000
where 등급명 = 'S';

select 고객번호, 고객회사명 ,마일리지
from 고객
inner join 마일리지등급
on 마일리지 between 하한마일리지 and 상한마일리지
where 등급명 = 'S';     

delete from 주문
where 주문번호 not in (
					select distinct 주문번호
					from 주문세부
                    );
                    
select *
from 주문
where 주문번호 = 'H0248';

select *
from 주문세부
where 주문번호 = 'H0248';

delete 주문 ,주문세부
from 주문
inner join 주문세부
on 주문.주문번호 = 주문세부.주문번호
where 주문.주문번호 = 'H0248';

select 고객.*
from 고객
left outer join 주문
on 고객.고객번호 = 주문.주문번호
where 주문.고객번호 is null;

delete 고객
from 고객
left join 주문
on 고객.고객번호 = 주문.주문번호
where 주문.고객번호 is null;

select *
from 고객
where 고객번호 in ('BQQZA', 'RISPA', 'SSAFI', 'TTRAN');

#점검문제
