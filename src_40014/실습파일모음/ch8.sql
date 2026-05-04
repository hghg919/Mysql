create database 한빛학사;
use 한빛학사;

create table 학과
(
 학과번호 char(2)
,학과명 varchar(20)
,학과장명 varchar(20)
);

insert into 학과
values('AA','컴퓨터공학과','배경민')
	 ,('BB','소프트웨어학과','김남준')
	 ,('CC','디자인융합학과','박선영');
     
create table 학생
(
 학번 char(5)
,이름 varchar(20)
,생일 date
,연락처 varchar(20)
,학과번호 char(2)
);

insert into 학생
values('S0001','이윤주','2020-01-30','01033334444','AA')
	 ,('S0001','이승은','2021-02-23',NUll,'AA')
	 ,('S0003','백재용','2018-03-31','01077778888','DD');
     
create table 휴학생 as
	select *
    from 학생
    where 1 = 2;
    
create table 회원
(
 아이디 varchar(20) primary key
,회원명 varchar(20)
,키 int
,몸무게 int
,체질량지수 decimal(4,1) as (몸무게 / power(키 / 100, 2)) stored
);   

insert into 회원(아이디, 회원명, 키, 몸무게)
values('APPLE','김사과','178','70');

alter table 학생 add 성별 char(1);

alter table 학생 modify column 성별 varchar(2);

alter table 학생 drop column 성별;

alter table 휴학생 rename 졸업생;

drop table 학과;
drop table 학생;