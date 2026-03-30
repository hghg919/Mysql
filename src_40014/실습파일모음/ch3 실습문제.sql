select *
from 고객
where 담당자명 like '%_정%';

select *
from 고객
where instr(담당자명,'정') >1;

select * 
from 주문
where year(주문일) = 2020 and quarter(주문일)=2;

select 제품번호, 제품명, 재고,
		case when 재고 >= 100 then '과다재고'
        when 재고 >= 10 then '적정'
        else '재고부족' end as 재고구분
from 제품;

select 이름,부서번호,직위,입사일,
datediff(curdate(), 입사일) as 입사일수,
timestampdiff(month, 입사일, curdate()) as 입사개월수
from 사원
where timestampdiff(month, 입사일, curdate()) > 40;