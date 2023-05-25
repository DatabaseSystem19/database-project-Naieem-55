--alter table books drop column edition2;
--alter table members drop column birth_date2;

alter table books add edition char(20);
alter table members add birth_date char(15);

alter table books modify edition char(15);
alter table members modify birth_date char(12);

alter table books rename column edition to edition2;
alter table members rename column birth_date to birth_date2;