create database mynosql_test;
use mynosql_test;

create table users (id int primary key, name varchar(255), email varchar(255));

insert into users (id, name, email) values (1, "Ross", "ross@example.com");
insert into users (id, name, email) values (2, "Colin", "colin@example.com");
