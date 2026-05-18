use 한빛무역1;

create or replace view view_사원
as
select 이름
	  ,집전화 as 전화번호
      ,입사일
      ,주소
from 사원;

select *
from view_사원;

create or replace view view_제품별주문수량합
as
select 제품명, sum(주문수량) as 주문수량합
from 제품
inner join 주문세부
on 제품.제품번호 = 주문세부.제품번호
group by 제품명;

select *
from view_제품별주문수량합;

create or replace view view_사원_여
as
select 이름, 집전화 as 전화번호, 입사일, 주소, 성별
from 사원
where 성별 = '여';

select *
from view_사원_여;

select *
from view_사원_여
where 전화번호 like '%88%';

select *
from view_제품별주문수량합
where 주문수량합 >= 1200;

select *
from information_schema.views
where table_name = 'view_사원';

show create view view_사원;

drop view view_사원;

create or replace view view_사원_여
as
select 사원번호, 이름, 집전화 as 전화번호, 입사일, 주소, 성별
from 사원
where 성별 = '여';

insert into view_사원_여(사원번호, 이름, 전화번호, 입사일, 주소, 성별)
value('E12', '황여름', '(02)587-4989','2023-02-10','서울시 강남구 청담동 23-5','여');

select *
from view_사원_여
where 사원번호 = 'E12';

select *
from 사원
where 사원번호 = 'E12';

insert into view_사원_여(사원번호, 이름, 입사일, 주소, 성별)
value('E13', '강겨울', '2023-02-10','서울시 성북구 장위동 123-7','남');

select *
from view_사원_여
where 사원번호 = 'E13';

select *
from 사원
where 사원번호 = 'E13';

create or replace view view_사원_여
as
select 사원번호, 이름, 집전화 as 전화번호, 입사일, 주소, 성별
from 사원
where 성별 = '여'
with check option;

insert into view_사원_여(사원번호, 이름, 성별)
value('E14', '유봄','남');

update view_사원_여
set 성별 = '남'
where 이름 = '황여름';

create view veiw_도시_직위별_고객수
as
select 도시
	   ,sum(case when 담당자직위 = '대표 이사' then 1 else 0 end) as '대표이사'
       ,sum(case when 담당자직위 = '영업%' then 1 else 0 end) as '영업'
       ,sum(case when 담당자직위 = '마케팅%' then 1 else 0 end) as '마케팅'
       ,sum(case when 담당자직위 = '회계%' then 1 else 0 end) as '회계'
from 고객
group by 도시;
     
-- create view veiw_상위3고객
-- as
-- select 고객번호, 고객회사명, 담당자명, sum() as 주문금액합
-- from 고객
-- inner join 주문
-- on 고객.고객번호 = 주문.고객번호
-- group by 주문금액합
-- limit 3;  