set serveroutput on
declare

b_id books.book_id % type;
b_title books.title % type;
b_quantity books.quantity % type;

begin
  select book_id , title , quantity into b_id , b_title , b_quantity  from books where book_id = 1010;
  dbms_output.put_line('Book Id :  ' || b_id || '  Book Title :  ' || b_title || '  Quantity :  ' || b_quantity );
end;
/

set serveroutput on
declare

b_id books.book_id % type := 1011;
b_title books.title % type := 'Html & CSS';
b_quantity books.quantity % type := 14  ;

begin
  insert into books vlues(b_id , b_title , b_quantity);
end;
/


set serveroutput ON
DECLARE

books_rowType books%rowtype;
BEGIN
    SELECT BOOK_ID, TITLE , AUTHOR ,ISBN into books_rowType.book_id , books_rowType.title  , books_rowType.AUTHOR , books_rowType.ISBN from books where BOOK_ID =  1004; 
END;
/


set serveroutput ON
declare

cursor c is select * from BOOKS;
row books%rowtype;

BEGIN
open c;
fetch c into row.book_id , row.title , row.author , row.ISBN, row.year_published , row.publisher , row.quantity;

while c%found LOOP
dbms_output.put_line('Book id : ' || row.book_id || ' Title : ' || row.title || '  Author : ' || row.author);
dbms_output.put_line('Row count : ' || c%rowcount);
dbms_output.put_line(' ');
fetch c into row.book_id , row.title , row.author , row.ISBN, row.year_published , row.publisher , row.quantity;
end LOOP;

close c;
end;
/


create or replace procedure proc1(
  var1 in number,
  var2 out VARCHAR,
  var3 in out number
)
as 
  t_show char(30);

begin
   t_show := 'From Procedure : ';
   select title into var2 from books where book_id in (select BOOK_ID from loans where LOAN_ID = var1);
   var3 := var1 ;
   dbms_output.put_line(t_show || '  ' || var1 || ' ' || var2 || ' ' || var3 );
end;
/
set serveroutput ON
declare

loan_idd loans.LOAN_ID%type := 2005;
titlee books.TITLE%TYPE;
countt books.QUANTITY%type;

BEGIN
   proc1(loan_idd , titlee , countt);
END;
/


set serveroutput on
create or replace function fun1(var1 in number) return varchar AS value books.TITLE%type;
begin
  select TITLE into value from books where book_id=var1; 
  return value;
end;
/

set serveroutput on
declare 
ans varchar(60);
begin
ans:=fun1(1005);
dbms_output.put_line(ans);
end;
/

drop PROCEDURE proc1;
drop function fun1;