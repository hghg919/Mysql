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

