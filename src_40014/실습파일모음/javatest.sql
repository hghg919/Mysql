create database sample_db;
use sample_db;

create table student (
	id int auto_increment primary key,
    name varchar(50) not null,
    major varchar(50),
    phone varchar(20)
);