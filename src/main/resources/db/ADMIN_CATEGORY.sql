--------------------------------------------------------
--  ������ ������ - �����-12��-16-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ADMIN_CATEGORY
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."ADMIN_CATEGORY" 
   (	"CATEGORY_NM" VARCHAR2(20 BYTE), 
	"CATEGORY_CNT" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into SYSTEM.ADMIN_CATEGORY
SET DEFINE OFF;
Insert into SYSTEM.ADMIN_CATEGORY (CATEGORY_NM,CATEGORY_CNT) values ('FOOD',12345);
Insert into SYSTEM.ADMIN_CATEGORY (CATEGORY_NM,CATEGORY_CNT) values ('CARE',8234);
Insert into SYSTEM.ADMIN_CATEGORY (CATEGORY_NM,CATEGORY_CNT) values ('LIVING&LIFE',3234);
Insert into SYSTEM.ADMIN_CATEGORY (CATEGORY_NM,CATEGORY_CNT) values ('ACCESSARY',4234);
--------------------------------------------------------
--  Constraints for Table ADMIN_CATEGORY
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."ADMIN_CATEGORY" MODIFY ("CATEGORY_NM" NOT NULL ENABLE);
 
  ALTER TABLE "SYSTEM"."ADMIN_CATEGORY" MODIFY ("CATEGORY_CNT" NOT NULL ENABLE);
