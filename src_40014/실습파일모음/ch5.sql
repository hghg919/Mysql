select 부서.부서번호
		,부서명
        ,이름
        ,사원.부서번호
from 부서
cross join 사원
where 이름 = '배재용';

select 사원번호, 직위, 사원.부서번호, 부서명
from 사원
inner join 부서
on 사원.부서번호 = 부서.부서번호
where 이름 = '이소미';

select 고객.고객번호, 담당자명, 고객회사명, count(*) as 주문건수
from 고객
inner join 주문
on 고객.고객번호 = 주문.고객번호
group by 고객.고객번호, 담당자명, 고객회사명
order by count(*) desc;

select 고객.고객번호, 담당자명, 고객회사명, sum(주문수량 * 단가) as 주문금액합
from 고객
inner join 주문
on 고객.고객번호 = 주문.고객번호
inner join 주문세부
on 주문.주문번호 = 주문세부.주문번호
group by 고객.고객번호 ,담당자명, 고객회사명
order by 4 desc;

select 고객번호,담당자명,마일리지,등급.*
from 고객
cross join 마일리지등급 as 등급
where 담당자명 = '이은광';

select 고객번호, 고객회사명, 담당자명, 마일리지, 등급명
from 고객
inner join 마일리지등급
on 마일리지 between 하한마일리지 and 상한마일리지
where 담당자명 = '이은광';

select 사원번호, 이름, 부서명
from 사원
left outer join 부서
on 사원.부서번호 = 부서.부서번호
where 성별 = '여';

select 부서명, 사원.*
from 사원
right outer join 부서
on 사원.부서번호 = 부서.부서번호;

select 부서명, 사원.*
from 사원
right outer join 부서
on 사원.부서번호 = 부서.부서번호
where 사원.부서번호 is null;

select 이름, 부서.*
from 사원
left outer join 부서
on 사원.부서번호 = 부서.부서번호
where 부서.부서번호 is null;

select 이름, 직위, 생일, 성별, 부서명
from 사원
left outer join 부서
on 사원.부서번호 = 부서.부서번호
where 부서명 = '영업부';

select 사원.사원번호, 사원.이름, 상사.사원번호 as '상사의 사원번호', 상사.이름 as '상사의 이름'
from 사원
inner join 사원 as 상사
on 사원.상사번호 = 상사.사원번호;

select 사원.이름 as 이름, 사원.직위, 상사.이름 as '상사이름'
from 사원 as 상사
right outer join 사원
on 사원.상사번호 = 상사.사원번호
order by 상사이름;