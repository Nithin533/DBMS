create database school;
use school;
create table student
( USN varchar(15),
name varchar(15),
age int,
m1 int,
m2 int);
create table attendence
( Date  date,
Day varchar(10));
create table staff
( Name varchar(20),
age int,
salary float,
subject varchar(20),
designation varchar(30));
create table cricket
(bat int,
ball int,
wicket int,
kitbag int,
fundsinitialted float,
fundsleft float);
alter table staff modify designation varchar(31);
alter table student
add ( m3 int);