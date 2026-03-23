## 문제1
select 고객회사명
,concat('**', substr(고객회사명, 3)) as 고객회사명2
,전화번호
,replace(substr(전화번호,2), ')', '-') as 전화번호2
from 고객;

## 문제2
select *
,단가 * 주문수량 as 주문금액
,truncate(단가 * 주문수량 * 할인율, -1) as 할인금액
,단가 * 주문수량 - truncate(단가 * 주문수량 * 할인율, -1) as 실주문금액
from 주문세부;

## 문제3
select 이름
,생일
,timestampdiff(year, 생일, curdate()) as 만나이
,입사일
,datediff(curdate(), 입사일) as 입사일수
,adddate(입사일, 500) as '500일후'
from 사원;

## 문제4
select 담당자명, 고객회사명, 도시
,if(도시 like '%특별시' or 도시 like '%광역시', '대도시', '도시') as 도시구분
,마일리지
,case when 마일리지 >= 100000 then 'vvip 고객'
when 마일리지 >= 10000 then 'vip 고객'
else '일반고객'
end as 마일리지구분
from 고객;

## 문제5
select 주문번호, 고객번호, 주문일
,year(주문일) as 주문년도
,quarter(주문일) as 주문분기
,month(주문일) as 주문월
,day(주문일) as 주문일
,weekday(주문일) as 주문요일
,case weekday(주문일)
 when 0 then '월요일'
  when 1 then '화요일'
   when 2 then '수요일'
    when 3 then '목요일'
     when 4 then '금요일'
      when 5 then '토요일'
      else '일요일'
      end as 한글요일
      from 주문;

select *
,datediff(발송일, 요청일) as 지연일수
from 주문
where datediff(발송일, 요청일) >= 7;