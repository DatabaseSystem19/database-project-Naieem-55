drop table loans;
drop table reservations;
drop table books;
drop table members;

CREATE TABLE books (
   book_id NUMBER(10) PRIMARY KEY,
   title varchar(60),
   author VARCHAR(60),
   isbn VARCHAR(10),
   year_published NUMBER(10),
   publisher VARCHAR(60),
   quantity NUMBER(1
);

create table members(
   member_id NUMBER(10) PRIMARY KEY,
   name VARCHAR(60),
   email VARCHAR(60),
   phone_number VARCHAR(15),
   address VARCHAR(60)
);


CREATE TABLE loans (
   loan_id NUMBER(10) PRIMARY KEY,
   book_id NUMBER(10),
   member_id NUMBER(10),
   loan_date VARCHAR(15),
   due_date VARCHAR(15),
   return_date VARCHAR(15),
   FOREIGN KEY(book_id) REFERENCES books(book_id),
   FOREIGN KEY(member_id) REFERENCES members(member_id)
);


create table reservations(
   reservation_id NUMBER(10) PRIMARY KEY,
   book_id NUMBER(10),
   member_id NUMBER(10),
   reservation_date VARCHAR(15),
   FOREIGN KEY (book_id) REFERENCES books(book_id),
   FOREIGN KEY (member_id) REFERENCES members(member_id)
);

INSERT INTO books VALUES (1001,'Learn C++','Md.Islam','15548',2002,'A publication',11);
INSERT INTO books VALUES (1002,'Machine learning','Anderson','15549',2000,'B publication',12);
INSERT INTO books VALUES (1003,'Basic Electrical','Pitter','15550',1995,'C publication',13);
INSERT INTO books VALUES (1004,'Region Planning','Jhon','15551',2003,'D publication',14);
INSERT INTO books VALUES (1005,'Learn java','Erik','15552',2004,'E publication',15);
INSERT INTO books VALUES (1006,'Fluid Mechanics','Ererson','15553',2005,'F publication',16);
INSERT INTO books VALUES (1007,'Electronics','Witter','15554',2006,'G publication',17);
INSERT INTO books VALUES (1008,'Urban','Jak','15555',2007,'H publication',18);
INSERT INTO books VALUES (1009,'Basic Electrical','Pitter','15556',1995,'I publication',19);
INSERT INTO books VALUES (1010,'Urban Planning','Jhon','15557',2003,'J publication',20);

INSERT INTO members VALUES (501,'Abdullah','abdullah@gmail.com','01234567891','Dhaka');
INSERT INTO members VALUES (502,'karim','karim@gmail.com','01234567892','Rajshahi');
INSERT INTO members VALUES (503,'Islam','islam@gmail.com','01234567893','Rajshahi');
INSERT INTO members VALUES (504,'Mobin','mobin@gmail.com','01234567894','Chittagong');
INSERT INTO members VALUES (505,'Erik','erik@gmail.com','01234567895','Dhaka');
INSERT INTO members VALUES (506,'Riad','riad@gmail.com','01234567896','Rangpur');
INSERT INTO members VALUES (507,'Tasnim','tasnim@gmail.com','01234567897','Barisal');
INSERT INTO members VALUES (508,'Ohid','ohid@gmail.com','01234567898','Chittagong');
INSERT INTO members VALUES (509,'Syam','syam@gmail.com','01234567899','Rajshahi');
INSERT INTO members VALUES (510,'Ajij','ajij@gmail.com','01234567900','Khulna');


INSERT INTO loans values(2001,1001,501,'01/10/2018','01/11/2018','15/10/2018');
INSERT INTO loans values(2002,1002,502,'14/9/2018','14/10/2018','01/09/2018');
INSERT INTO loans values(2003,1003,503,'10/05/2018','10/06/2018','10/06/2018');
INSERT INTO loans values(2004,1004,504,'07/02/2018','07/03/2018','05/03/2018');
INSERT INTO loans values(2005,1005,505,'15/01/2018','15/02/2018','10/02/2018');
INSERT INTO loans values(2006,1006,506,'09/09/2018','09/10/2018','10/10/2018');
INSERT INTO loans values(2007,1007,507,'10/05/2018','10/06/2018','09/06/2018');
INSERT INTO loans values(2008,1008,508,'07/02/2018','07/03/2018','10/03/2018');
INSERT INTO loans values(2009,1009,509,'06/05/2018','06/06/2018','01/06/2018');
INSERT INTO loans values(2010,1010,510,'21/02/2018','21/03/2018','17/03/2018');

INSERT INTO reservations values(101,1001,501,'07/07/2017');
INSERT INTO reservations values(102,1002,502,'12/03/2017');
INSERT INTO reservations values(103,1003,503,'19/04/2017');
INSERT INTO reservations values(104,1004,504,'14/05/2017');
INSERT INTO reservations values(105,1005,505,'08/07/2017');
INSERT INTO reservations values(106,1006,506,'10/03/2017');
INSERT INTO reservations values(107,1007,507,'03/04/2017');
INSERT INTO reservations values(108,1008,508,'17/05/2017');
INSERT INTO reservations values(109,1009,509,'19/04/2017');
INSERT INTO reservations values(110,1010,510,'15/05/2017');

select * from books;
select * from members;
select * from loans;
select * from reservationsselect * from books where year_published = 2003;
select * from members where address='Rajshahi';

update books set title='Learn Asp.net' where book_id = 1010;

select * from books;

delete from books where book_id = 1010;

select title from books where title like 'L%' union select title from books where title like 'B%';

with max_value(value) as (select max(quantity) from books)
select * from books,max_value where books.quantity = max_value.value;

SET COLSEP ","
SET HEADING OFF
SET PAGESIZE 200
SET FEEDBACK OFF
SPOOL G:\DatabaseXml.csv
SELECT * FROM books;
SPOOL OFF

select count(*) from books;
select count(book_id) as total_book from books;

select avg(quantity) as average from books;
select title, avg(quantity) from books group by title;
select title, avg(quantity) from books group by title having avg(quantity) > 16;

select title from books where book_id=(select book_id from loans where loan_id = 2006);

select * from books where quantity > some(select quantity from books where QUANTITY > 14);
select * from books where quantity > all(select quantity from books where QUANTITY > 14);

select * from books where quantity > 17 and exists(select * from members where ADDRESS LIKE 'R%');

select * from MEMBERS where ADDRESS LIKE 'R%';
select * from MEMBERS where ADDRESS LIKE '%D';

select * FROM BOOKS NATURAL JOIN LOANS where BOOK_ID = 1007;
select AUTHOR, TITLE FROM BOOKS JOIN LOANS USING(BOOK_ID);
select AUTHOR, TITLE FROM BOOKS JOIN LOANS on BOOKS.BOOK_ID = LOANS.BOOK_ID;
select AUTHOR, TITLE FROM BOOKS LEFT OUTER JOIN LOANS USING(BOOK_ID);
select AUTHOR, TITLE FROM BOOKS RIGHT OUTER JOIN LOANS USING(BOOK_ID);
select AUTHOR, TITLE FROM BOOKS FULL OUTER JOIN LOANS USING(BOOK_ID);

create view temp_table as SELECT MEMBER_ID , LOAN_DATE from LOANS;
SELECT * from TEMP_TABLE;

create view temp_table2 as SELECT * from BOOKS WHERE QUANTITY > 15;
SELECT * FROM temp_table2;


select * from books;


