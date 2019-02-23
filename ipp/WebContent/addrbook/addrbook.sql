# for mysql
CREATE TABLE `addrbook` (
  `ab_id` int(11) NOT NULL AUTO_INCREMENT,
  `ab_name` varchar(15) NOT NULL,
  `ab_email` varchar(50) DEFAULT NULL,
  `ab_comdept` varchar(20) NOT NULL,
  `ab_birth` varchar(10) NOT NULL,
  `ab_tel` varchar(20) DEFAULT NULL,
  `ab_memo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# for oracle
CREATE table "ADDRBOOK" (
    "AB_ID"      NUMBER(11) NOT NULL,
    "AB_NAME"    VARCHAR2(15) NOT NULL,
    "AB_EMAIL"   VARCHAR2(50),
    "AB_COMDEPT" VARCHAR2(20) NOT NULL,
    "AB_BIRTH"   VARCHAR2(10) NOT NULL,
    "AB_TEL"     VARCHAR2(20),
    "AB_MEMO"    VARCHAR2(100),
    constraint  "ADDRBOOK_PK" primary key ("AB_ID")
)
/

CREATE sequence "ADDRBOOK_SEQ" 
/
drop trigger bi_addrbook;

CREATE trigger "BI_ADDRBOOK"  
  before insert on "ADDRBOOK"              
  for each row 
begin  
  if :NEW."AB_ID" is null then
    select "ADDRBOOK_SEQ".nextval into :NEW."AB_ID" from dual;
  end if;
end;
/   

