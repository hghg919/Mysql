-- 섹션4 트리거앞은 기업 들으러 가서 공부 안했으니 해야함

-- create table 제품로그
-- (
-- 로그번호 int auto_increment primary key,
-- 처리 varchar(10),
-- 내용 varchar(100),
-- 처리일 timestamp default current_timestamp
-- );

delimiter $$
create trigger trigger_제품추가로그
after insert on 제품 
for each row
begin
    insert into 제품로그(처리, 내용)
    values('insert', concat('제품번호:', new.제품번호, '제품명:', new.제품명));
end $$
delimiter ;

insert into 제품(제품번호,제품명,단가,재고)
value(100, '레몬주스', 5000, 5);

select *
from 제품
where 제품번호 = 100;

select *
from 제품로그;

