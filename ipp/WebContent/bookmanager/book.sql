CREATE table "BOOK" (
    "ISBN"      NUMBER(11) NOT NULL,
    "TITLE"    VARCHAR2(50) NOT NULL,
    "AUTHOR"   VARCHAR2(50),
    "PUB" VARCHAR2(50) NOT NULL,
    "PRICE"   NUMBER(10) NOT NULL,
    "DDATE"     VARCHAR2(20),
    constraint  "BOOK_PK" primary key ("ISBN")
)
/
select * from Book;


CREATE sequence "BOOK_SEQ" 
/
drop trigger bi_book;
drop sequence Book_SEQ;

drop table Book;

CREATE trigger "BI_BOOK"  
  before insert on "BOOK"              
  for each row 
begin  
  if :NEW."ISBN" is null then
    select "BOOK_SEQ".nextval into :NEW."ISBN" from dual;
  end if;
end;