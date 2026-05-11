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

create table 학과
(
 학과번호 char(2) primary key
 ,학과명 varchar(20) not null
 ,확과장명 varchar(20)
);

create table 학생
(
 학번 char(5) primary key
 ,이름 varchar(20) not null
 ,생일 date not null
 ,연락처 varchar(20) unique
 ,학과번호 char(2) references 학과(학과번호)
 ,성별 char(1) check(성별 in ('남','여'))
 ,등록일 date default(curdate())
 ,foreign key(학과번호) references 학과(학과번호)
);

create table 과목
(
 과목번호 char(5) primary key
,과목명 varchar(20) not null
,학점 int not null check(학점 between 2 and 4)
,구분 varchar(20) check(구분 in('전공','교양','일반'))
);

create table 수강_1
(
 수강년도 char(4) not null
,수강학기 varchar(20) not null check(수강학기 in ('1학기','2학기','여름학기','겨울학기'))
,학번 char(5) not null
,과목번호 char(5) not null
,성적 numeric(3,1) check(성적 between 0 and 4.5)
,primary key(수강년도, 수강학기, 학번, 과목번호)
,foreign key(학번) references 학생(학번)
,foreign key(과목번호) references 과목(과목번호)
);

create table 수강_2
(
 수강번호 int primary key auto_increment
,수강년도 char(4) not null
,수강학기 varchar(20) not null check(수강학기 in ('1학기','2학기','여름학기','겨울학기'))
,학번 char(5) not null
,과목번호 char(5) not null
,성적 numeric(3,1) check(성적 between 0 and 4.5)
,foreign key(학번) references 학생(학번)
,foreign key(과목번호) references 과목(과목번호)
);

insert into 학과
values ('AA','컴퓨터학과','배경민');
insert into 학과
values ('BB','소프트웨어학과','김남준');
insert into 학과
values ('CC','디자인융합학과','박선영');

insert into 학생(학번,이름,생일,학과번호)
values ('S0001', '이윤주', '2020-01-30', 'AA');
insert into 학생(학번,이름,생일,학과번호)
values ('S0002', '이윤주', '2020-01-30', 'AA');
insert into 학생(학번,이름,생일,학과번호)
values ('S0003', '백재용', '2018-03-31', 'CC');

insert into 과목(과목번호, 과목명, 구분,학점)
values ('C0001','데이터베이스실습','전공',3);
insert into 과목(과목번호, 과목명, 구분,학점)
values ('C0002','데이터베이스 설계와 구축','전공',3);
insert into 과목(과목번호, 과목명, 구분,학점)
values ('C0003','데이터 분석','전공',3);

insert into 수강_2(수강년도, 수강학기, 학번, 과목번호, 성적)
values('2023','1학기','S0001','C0001',4.3);
insert into 수강_2(수강년도, 수강학기, 학번, 과목번호, 성적)
values('2023','1학기','S0001','C0001',4.5);

alter table 학생 add constraint check(학번 like 'S%');

select *
from INFORMATION_SCHEMA.table_constraints
where constraint_schema = '한빛학사'
and table_name = '학생';

alter table 학생 drop constraint 연락처;

alter table 학생 drop constraint 학생_chk_1;
alter table 학생 drop constraint 학생_chk_2;
alter table 학생 add check (학번 like 'S%');

use 한빛무역1;

# 점검문제
## 문제1
alter table 제품 add check(재고 >= 0);

## 문제2
alter table 제품 add 재고금액 int as (단가 * 재고) stored;

## 문제3
alter table 주문세부 add foreign key(제품번호) references 제품(제품번호) on delete cascade;

create database movie;
use movie;

create table 영화
(
 영화번호 char(5) primary key
,타이틀 varchar(100) not null
,장르 varchar(20) check(장르 in('코미디','드라마','다큐','SF','액션','역사','기타'))
,배우 varchar(100) not null
,감독 varchar(50) not null
,제작사 varchar(50) not null
,개봉일 date
,등록일 date default(curdate())
);

insert into 영화 (영화번호, 타이틀, 장르, 배우, 감독, 제작사, 개봉일)
values ('12345', 'GOAT', '다큐', '크리스티아누','호날두','첼시','1998-10-23');

create table 평점관리
(
 번호 int ## 여기에 일련번호 자동 입력
,평가자닉네임 varchar(50) not null
,영화번호 char(5) primary key references 영화(영화번호)
,평점 int not null check(평점 between 1 and 5)
,평가 varchar(2000) not null
,등록일 date default(curdate())
);