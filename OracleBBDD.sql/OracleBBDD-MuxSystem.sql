--------------------------------------------------------
-- Archivo creado  - miércoles-diciembre-11-2019   
--------------------------------------------------------
DROP SEQUENCE "HARRY"."ROLES_SEQ";
DROP SEQUENCE "HARRY"."TAREA_SEQ";
DROP SEQUENCE "HARRY"."TARTICULOS_SEQ";
DROP SEQUENCE "HARRY"."TBITACORA_SEQ";
DROP SEQUENCE "HARRY"."TCOLECCION_SEQ";
DROP SEQUENCE "HARRY"."TCOLECCION_SEQ1";
DROP SEQUENCE "HARRY"."TROL_SEQ";
DROP SEQUENCE "HARRY"."TUSERLOGIN_SEQ";
DROP SEQUENCE "HARRY"."TUSUARIO_SEQ";
DROP SEQUENCE "HARRY"."TUSUARIO_SEQ1";
DROP SEQUENCE "HARRY"."TUSUARIO_SEQ2";
DROP SEQUENCE "HARRY"."USUARIOS_SEQ";
DROP TABLE "HARRY"."ROLES" cascade constraints;
DROP TABLE "HARRY"."TAREA" cascade constraints;
DROP TABLE "HARRY"."TARTICULOS" cascade constraints;
DROP TABLE "HARRY"."TBITACORA" cascade constraints;
DROP TABLE "HARRY"."TCOLECCION" cascade constraints;
DROP TABLE "HARRY"."TROL" cascade constraints;
DROP TABLE "HARRY"."TUSERLOGIN" cascade constraints;
DROP TABLE "HARRY"."TUSUARIO" cascade constraints;
DROP TABLE "HARRY"."USUARIOS" cascade constraints;
DROP VIEW "HARRY"."VAREA";
DROP VIEW "HARRY"."VCOLECCION";
DROP VIEW "HARRY"."VROL";
DROP VIEW "HARRY"."VUSUARIO";
DROP PACKAGE "HARRY"."PKG_AREA";
DROP PACKAGE "HARRY"."PKG_COLECCION";
DROP PACKAGE "HARRY"."PKG_ROL";
DROP PACKAGE "HARRY"."PKG_USUARIO";
DROP PACKAGE BODY "HARRY"."PKG_AREA";
DROP PACKAGE BODY "HARRY"."PKG_COLECCION";
DROP PACKAGE BODY "HARRY"."PKG_ROL";
DROP PACKAGE BODY "HARRY"."PKG_USUARIO";
DROP SYNONYM "PUBLIC"."DBMS_OUTPUT";
--------------------------------------------------------
--  DDL for Sequence ROLES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HARRY"."ROLES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 24 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TAREA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HARRY"."TAREA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 4 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TARTICULOS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HARRY"."TARTICULOS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TBITACORA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HARRY"."TBITACORA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 43 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TCOLECCION_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HARRY"."TCOLECCION_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TCOLECCION_SEQ1
--------------------------------------------------------

   CREATE SEQUENCE  "HARRY"."TCOLECCION_SEQ1"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 8 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TROL_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HARRY"."TROL_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 17 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TUSERLOGIN_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HARRY"."TUSERLOGIN_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 8 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TUSUARIO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HARRY"."TUSUARIO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TUSUARIO_SEQ1
--------------------------------------------------------

   CREATE SEQUENCE  "HARRY"."TUSUARIO_SEQ1"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TUSUARIO_SEQ2
--------------------------------------------------------

   CREATE SEQUENCE  "HARRY"."TUSUARIO_SEQ2"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 9 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence USUARIOS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HARRY"."USUARIOS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table ROLES
--------------------------------------------------------

  CREATE TABLE "HARRY"."ROLES" 
   (	"ID" NUMBER, 
	"NOMBRE" VARCHAR2(20 BYTE), 
	"DESCRIPCION" VARCHAR2(200 BYTE) DEFAULT NULL, 
	"ACTIVO" VARCHAR2(5 BYTE) DEFAULT 0, 
	"FECHA_INSERTADA" DATE, 
	"ID_USUARIO_INSERCION" NUMBER, 
	"FECHA_ULT_MOD" DATE, 
	"ID_USUARIO_ULT_MOD" NUMBER DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TSMUXDB" ;

   COMMENT ON COLUMN "HARRY"."ROLES"."FECHA_ULT_MOD" IS 'FECHA DE LA ULTIMA MODIFICACIÓN DEL REGISTRO';
--------------------------------------------------------
--  DDL for Table TAREA
--------------------------------------------------------

  CREATE TABLE "HARRY"."TAREA" 
   (	"ID" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(70 BYTE), 
	"DESCRIPCION" VARCHAR2(300 BYTE), 
	"ID_TBITACORA" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TSMUXDB" ;
--------------------------------------------------------
--  DDL for Table TARTICULOS
--------------------------------------------------------

  CREATE TABLE "HARRY"."TARTICULOS" 
   (	"ID" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(70 BYTE), 
	"DESCRIPCION" VARCHAR2(300 BYTE), 
	"URL_IMG" VARCHAR2(300 BYTE), 
	"ID_TBITACORA" NUMBER(*,0), 
	"ID_TAREA" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TSMUXDB" ;
--------------------------------------------------------
--  DDL for Table TBITACORA
--------------------------------------------------------

  CREATE TABLE "HARRY"."TBITACORA" 
   (	"ID" NUMBER(*,0), 
	"FECHA_INSERCION" DATE, 
	"ID_USUARIO_INSERCION" NUMBER(*,0) DEFAULT 0, 
	"FECHA_ULT_MOD" DATE, 
	"ID_USUARIO_ULT_MOD" NUMBER(*,0) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TSMUXDB" ;
--------------------------------------------------------
--  DDL for Table TCOLECCION
--------------------------------------------------------

  CREATE TABLE "HARRY"."TCOLECCION" 
   (	"ID" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(70 BYTE), 
	"DESCRIPCION" VARCHAR2(300 BYTE), 
	"URL_IMG" VARCHAR2(300 BYTE), 
	"ID_TBITACORA" NUMBER(*,0), 
	"ID_TAREA" NUMBER(*,0), 
	"DESCRIPCION_L" VARCHAR2(600 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TSMUXDB" ;
--------------------------------------------------------
--  DDL for Table TROL
--------------------------------------------------------

  CREATE TABLE "HARRY"."TROL" 
   (	"ID" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(20 BYTE), 
	"DESCRIPCION" VARCHAR2(300 BYTE), 
	"ACTIVO" VARCHAR2(10 BYTE), 
	"ID_TBITACORA" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TSMUXDB" ;
--------------------------------------------------------
--  DDL for Table TUSERLOGIN
--------------------------------------------------------

  CREATE TABLE "HARRY"."TUSERLOGIN" 
   (	"ID" NUMBER(*,0), 
	"USERNAME" VARCHAR2(50 BYTE), 
	"PASSWORD" VARCHAR2(250 BYTE), 
	"ACTIVO" VARCHAR2(10 BYTE), 
	"ID_TUSUARIO" NUMBER(*,0), 
	"ID_TBITACORA" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TSMUXDB" ;

   COMMENT ON COLUMN "HARRY"."TUSERLOGIN"."ID_TUSUARIO" IS 'HACE REFERENCIA A LA TABLA DE USUARIOS';
   COMMENT ON COLUMN "HARRY"."TUSERLOGIN"."ID_TBITACORA" IS 'HACE REFERENCIA A LA TABLA DE BITACORA';
--------------------------------------------------------
--  DDL for Table TUSUARIO
--------------------------------------------------------

  CREATE TABLE "HARRY"."TUSUARIO" 
   (	"ID" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(70 BYTE), 
	"APELLIDO" VARCHAR2(70 BYTE), 
	"FECHA_NACIMIENTO" DATE, 
	"GENERO" VARCHAR2(10 BYTE), 
	"ID_TROL" NUMBER(*,0), 
	"ID_TBITACORA" NUMBER(*,0), 
	"TELEFONO" VARCHAR2(25 BYTE), 
	"EMAIL" VARCHAR2(70 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TSMUXDB" ;
--------------------------------------------------------
--  DDL for Table USUARIOS
--------------------------------------------------------

  CREATE TABLE "HARRY"."USUARIOS" 
   (	"ID" NUMBER(4,0), 
	"NOMBRE" VARCHAR2(50 BYTE), 
	"FECHA_INSERTADA" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TSMUXDB" ;
--------------------------------------------------------
--  DDL for View VAREA
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "HARRY"."VAREA" ("ID", "NOMBRE", "DESCRIPCION", "ID_BITACORA", "FECHA_INSERCION", "ID_USUARIO_INSERCION", "FECHA_ULT_MOD", "ID_USUARIO_ULT_MOD") AS 
  SELECT
        ta.id,
        ta.nombre,
        ta.descripcion,
        tb.id id_bitacora,
        tb.fecha_insercion,
        tb.id_usuario_insercion,
        tb.fecha_ult_mod,
        tb.id_usuario_ult_mod
    FROM
        tarea       ta,
        tbitacora   tb
    WHERE
        ta.id_tbitacora = tb.id
;
--------------------------------------------------------
--  DDL for View VCOLECCION
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "HARRY"."VCOLECCION" ("ID", "NOMBRE", "DESCRIPCION", "DESCRIPCION_L", "URL_IMG", "ID_AREA", "NOMBRE_AREA", "ID_BITACORA", "FECHA_INSERCION", "ID_USUARIO_INSERCION", "FECHA_ULT_MOD", "ID_USUARIO_ULT_MOD") AS 
  SELECT
        tc.id,
        tc.nombre,
        tc.descripcion,
        tc.descripcion_l,
        tc.url_img,
        tc.id_tarea       id_area,
        ta.nombre         nombre_area,
        tc.id_tbitacora   id_bitacora,
        tb.fecha_insercion,
        tb.id_usuario_insercion,
        tb.fecha_ult_mod,
        tb.id_usuario_ult_mod
    FROM
        tcoleccion   tc,
        tarea        ta,
        tbitacora    tb
    WHERE
        tc.id_tbitacora = tb.id
        AND tc.id_tarea = ta.id
;
--------------------------------------------------------
--  DDL for View VROL
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "HARRY"."VROL" ("ID", "NOMBRE", "DESCRIPCION", "ACTIVO", "ID_BITACORA", "FECHA_INSERCION", "ID_USUARIO_INSERCION", "FECHA_ULT_MOD", "ID_USUARIO_ULT_MOD") AS 
  select 
tr.id,
tr.nombre,
tr.descripcion,
tr.activo,
tb.id id_bitacora,
tb.fecha_insercion,
tb.id_usuario_insercion,
tb.fecha_ult_mod,
tb.id_usuario_ult_mod
from trol tr, tbitacora tb where tr.id_tbitacora = tb.id
;
--------------------------------------------------------
--  DDL for View VUSUARIO
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "HARRY"."VUSUARIO" ("ID", "NOMBRE", "APELLIDO", "FECHA_NACIMIENTO", "GENERO", "TELEFONO", "EMAIL", "ID_ROL", "ROL_NOMBRE", "ID_BITACORA", "FECHA_INSERCION", "ID_USUARIO_INSERCION", "FECHA_ULT_MOD", "ID_USUARIO_ULT_MOD") AS 
  select 
TU.ID,
tu.nombre,
tu.apellido,
tu.fecha_nacimiento,
tu.genero,
tu.telefono,
tu.email,
tr.id id_rol,
tr.nombre rol_nombre,
tb.id id_bitacora,
tb.fecha_insercion,
tb.id_usuario_insercion,
tb.fecha_ult_mod,
tb.id_usuario_ult_mod
FROM TUSUARIO TU, TROL TR, tbitacora tb  WHERE tu.id_trol = TR.ID and tu.id_tbitacora = tb.id
;
REM INSERTING into HARRY.ROLES
SET DEFINE OFF;
Insert into HARRY.ROLES (ID,NOMBRE,DESCRIPCION,ACTIVO,FECHA_INSERTADA,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (1,'TE-01','Dato de Pruebas','No',to_date('01/12/19','DD/MM/RR'),28,null,0);
Insert into HARRY.ROLES (ID,NOMBRE,DESCRIPCION,ACTIVO,FECHA_INSERTADA,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (2,'TE-02','Dato de Pruebas nº2','No',to_date('01/12/19','DD/MM/RR'),28,null,0);
Insert into HARRY.ROLES (ID,NOMBRE,DESCRIPCION,ACTIVO,FECHA_INSERTADA,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (3,'TE-03','LOL-Dato de Pruebas nº3','No',to_date('01/12/19','DD/MM/RR'),28,null,0);
Insert into HARRY.ROLES (ID,NOMBRE,DESCRIPCION,ACTIVO,FECHA_INSERTADA,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (4,'TE-04','Más data de Pruebas nº4','No',to_date('02/12/19','DD/MM/RR'),28,null,0);
Insert into HARRY.ROLES (ID,NOMBRE,DESCRIPCION,ACTIVO,FECHA_INSERTADA,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (8,'SRV-01','Supervisor general de recepción','No',to_date('04/12/19','DD/MM/RR'),29,null,0);
Insert into HARRY.ROLES (ID,NOMBRE,DESCRIPCION,ACTIVO,FECHA_INSERTADA,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (9,'PUT-01','Pruebas de update desde postman','No',to_date('04/12/19','DD/MM/RR'),29,null,0);
Insert into HARRY.ROLES (ID,NOMBRE,DESCRIPCION,ACTIVO,FECHA_INSERTADA,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (10,'PUT-02','Pruebas n 2 de update desde postman 5','No',to_date('04/12/19','DD/MM/RR'),29,null,0);
Insert into HARRY.ROLES (ID,NOMBRE,DESCRIPCION,ACTIVO,FECHA_INSERTADA,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (21,'TE-04.1','Más data de Pruebas nº4, mad de lo nuevo','No',to_date('05/12/19','DD/MM/RR'),29,null,0);
Insert into HARRY.ROLES (ID,NOMBRE,DESCRIPCION,ACTIVO,FECHA_INSERTADA,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (22,'PUT-03','Pruebas 03 de update desde postman 01','No',to_date('05/12/19','DD/MM/RR'),29,null,0);
Insert into HARRY.ROLES (ID,NOMBRE,DESCRIPCION,ACTIVO,FECHA_INSERTADA,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (23,'Otro','erwqe','No',to_date('05/12/19','DD/MM/RR'),29,null,0);
REM INSERTING into HARRY.TAREA
SET DEFINE OFF;
Insert into HARRY.TAREA (ID,NOMBRE,DESCRIPCION,ID_TBITACORA) values (1,'Universo','Aqui se presenta la coleccion de todo lo relacionado con el universo, estrellas, planetas y galaxia.',22);
Insert into HARRY.TAREA (ID,NOMBRE,DESCRIPCION,ID_TBITACORA) values (2,'Pinturas','Aqui se coleccionara todo lo relacionado con las pintura más reconocidas de la historia.',23);
Insert into HARRY.TAREA (ID,NOMBRE,DESCRIPCION,ID_TBITACORA) values (3,'Biologia','Todo el contenido referente a la vida. La gran maravilla de la vida.',24);
REM INSERTING into HARRY.TARTICULOS
SET DEFINE OFF;
REM INSERTING into HARRY.TBITACORA
SET DEFINE OFF;
Insert into HARRY.TBITACORA (ID,FECHA_INSERCION,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (7,to_date('08/12/19','DD/MM/RR'),0,to_date('08/12/19','DD/MM/RR'),6);
Insert into HARRY.TBITACORA (ID,FECHA_INSERCION,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (8,to_date('08/12/19','DD/MM/RR'),6,to_date('11/12/19','DD/MM/RR'),7);
Insert into HARRY.TBITACORA (ID,FECHA_INSERCION,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (9,to_date('09/12/19','DD/MM/RR'),6,to_date('11/12/19','DD/MM/RR'),3);
Insert into HARRY.TBITACORA (ID,FECHA_INSERCION,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (10,to_date('09/12/19','DD/MM/RR'),6,to_date('11/12/19','DD/MM/RR'),3);
Insert into HARRY.TBITACORA (ID,FECHA_INSERCION,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (12,to_date('09/12/19','DD/MM/RR'),6,to_date('11/12/19','DD/MM/RR'),7);
Insert into HARRY.TBITACORA (ID,FECHA_INSERCION,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (13,to_date('09/12/19','DD/MM/RR'),6,to_date('12/12/19','DD/MM/RR'),3);
Insert into HARRY.TBITACORA (ID,FECHA_INSERCION,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (14,to_date('09/12/19','DD/MM/RR'),6,to_date('11/12/19','DD/MM/RR'),3);
Insert into HARRY.TBITACORA (ID,FECHA_INSERCION,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (15,to_date('10/12/19','DD/MM/RR'),1,to_date('11/12/19','DD/MM/RR'),3);
Insert into HARRY.TBITACORA (ID,FECHA_INSERCION,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (16,to_date('10/12/19','DD/MM/RR'),1,to_date('12/12/19','DD/MM/RR'),3);
Insert into HARRY.TBITACORA (ID,FECHA_INSERCION,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (19,to_date('10/12/19','DD/MM/RR'),1,to_date('11/12/19','DD/MM/RR'),3);
Insert into HARRY.TBITACORA (ID,FECHA_INSERCION,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (20,to_date('11/12/19','DD/MM/RR'),29,null,0);
Insert into HARRY.TBITACORA (ID,FECHA_INSERCION,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (21,to_date('11/12/19','DD/MM/RR'),7,to_date('11/12/19','DD/MM/RR'),7);
Insert into HARRY.TBITACORA (ID,FECHA_INSERCION,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (22,to_date('11/12/19','DD/MM/RR'),6,to_date('11/12/19','DD/MM/RR'),6);
Insert into HARRY.TBITACORA (ID,FECHA_INSERCION,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (23,to_date('11/12/19','DD/MM/RR'),6,null,0);
Insert into HARRY.TBITACORA (ID,FECHA_INSERCION,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (24,to_date('11/12/19','DD/MM/RR'),3,to_date('11/12/19','DD/MM/RR'),3);
Insert into HARRY.TBITACORA (ID,FECHA_INSERCION,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (26,to_date('11/12/19','DD/MM/RR'),6,to_date('12/12/19','DD/MM/RR'),6);
Insert into HARRY.TBITACORA (ID,FECHA_INSERCION,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (27,to_date('11/12/19','DD/MM/RR'),6,to_date('11/12/19','DD/MM/RR'),6);
Insert into HARRY.TBITACORA (ID,FECHA_INSERCION,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (28,to_date('11/12/19','DD/MM/RR'),3,null,0);
Insert into HARRY.TBITACORA (ID,FECHA_INSERCION,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (29,to_date('11/12/19','DD/MM/RR'),4,null,0);
Insert into HARRY.TBITACORA (ID,FECHA_INSERCION,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (30,to_date('11/12/19','DD/MM/RR'),4,null,0);
Insert into HARRY.TBITACORA (ID,FECHA_INSERCION,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (39,to_date('12/12/19','DD/MM/RR'),4,to_date('12/12/19','DD/MM/RR'),4);
Insert into HARRY.TBITACORA (ID,FECHA_INSERCION,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (40,to_date('12/12/19','DD/MM/RR'),3,null,0);
Insert into HARRY.TBITACORA (ID,FECHA_INSERCION,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (41,to_date('12/12/19','DD/MM/RR'),3,null,0);
Insert into HARRY.TBITACORA (ID,FECHA_INSERCION,ID_USUARIO_INSERCION,FECHA_ULT_MOD,ID_USUARIO_ULT_MOD) values (42,to_date('12/12/19','DD/MM/RR'),4,null,0);
REM INSERTING into HARRY.TCOLECCION
SET DEFINE OFF;
Insert into HARRY.TCOLECCION (ID,NOMBRE,DESCRIPCION,URL_IMG,ID_TBITACORA,ID_TAREA,DESCRIPCION_L) values (1,'La Última Cena','Esta pintura de da Vinci es la representación de la última cena, narrada en el Evangelio de San Juan. Es una obra clave del Renacimiento y todo un tratado de perspectiva.','https://i0.wp.com/hotbook.com.mx/wp-content/uploads/2014/10/hotbook-27.jpg?w=715&ssl=1',26,2,'Esta pintura de da Vinci es la representación de la última cena, narrada en el Evangelio de San Juan. Es una obra clave del Renacimiento y todo un tratado de perspectiva. La Última Cena está pintada al óleo sobre yeso, una técnica no utilizada antes en la pintura mural, por lo que su restauración ha sido un proceso complicado. Hoy en día se encuentra en La Iglesia de Santa Maria delle Grazie.');
Insert into HARRY.TCOLECCION (ID,NOMBRE,DESCRIPCION,URL_IMG,ID_TBITACORA,ID_TAREA,DESCRIPCION_L) values (2,'Las Meninas, Diego Velázquez','Las Meninas es considerada la obra maestra de Diego Velázquez, el artista español del Siglo de Oro.','https://i2.wp.com/hotbook.com.mx/wp-content/uploads/2014/10/hotbook-49.jpg?w=620&ssl=1',27,2,'Las Meninas es considerada la obra maestra de Diego Velázquez, el artista español del Siglo de Oro. Este óleo sobre tela de 1656 es la de mayor formato realizado por Velázquez. Con una composición en planos, que el artista logra representar por medio de las distintas entradas de iluminación, muestra una escena cotidiana de la corte de Felipe IV. En ella los límites entre pintura y realidad se desdibujan y sin precedentes se suspende el tiempo y el propio artista aparece dentro de la obra. Actualmente se exhibe en el Museo del Prado.');
Insert into HARRY.TCOLECCION (ID,NOMBRE,DESCRIPCION,URL_IMG,ID_TBITACORA,ID_TAREA,DESCRIPCION_L) values (3,'La Noche Estrellada, Vincent Van Gogh','Esta obra, por el famoso pintor postimpresionista, es una vista nocturna desde el sanatorio de Saint Rémy, lugar donde Van Gogh residió pocos meses antes de su muerte.','https://i1.wp.com/hotbook.com.mx/wp-content/uploads/2014/10/hotbook-59.jpg?resize=1024%2C829&ssl=1',28,2,'Esta obra, por el famoso pintor postimpresionista, es una vista nocturna desde el sanatorio de Saint Rémy, lugar donde Van Gogh residió pocos meses antes de su muerte. La técnica del impasto es utilizada por el artista para mostrar una noche inquieta y vibrante, por medio del contraste entre el amarillo intenso sobre empastes azules. Se exhibe en el Museo de Arte Moderno de Nueva York.');
Insert into HARRY.TCOLECCION (ID,NOMBRE,DESCRIPCION,URL_IMG,ID_TBITACORA,ID_TAREA,DESCRIPCION_L) values (4,'Anatomía','La anatomía es una ciencia que estudia la estructura de los seres vivos,1​ es decir, la forma, topografía, la ubicación, la disposición y la relación entre sí de los órganos que las componen.','https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Da_Vinci_Vitruve_Luc_Viatour.jpg/250px-Da_Vinci_Vitruve_Luc_Viatour.jpg',29,3,'Si bien la anatomía se basa ante todo en el examen descriptivo de los organismos vivos, la comprensión de esta arquitectura implica en la actualidad un maridaje con la función, por lo que se confunde en ocasiones con la fisiología (en lo que se denomina anatomía funcional) y forma parte de un grupo de ciencias básicas llamadas "ciencias morfológicas" (biología del desarrollo, histología y antropología), que completan su área de conocimiento con una visión dinámica y pragmática.');
Insert into HARRY.TCOLECCION (ID,NOMBRE,DESCRIPCION,URL_IMG,ID_TBITACORA,ID_TAREA,DESCRIPCION_L) values (5,'Biofísica','La biofísica es la ciencia que estudia la biología con los principios y métodos de la física. Al aplicar el carácter probabilístico de la mecánica cuántica a sistemas biológicos, se obtienen métodos puramente físicos para la explicación de propiedades biológicas.','https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Fmrtuebersicht.jpg/220px-Fmrtuebersicht.jpg',30,3,'Si bien la anatomía se basa ante todo en el examen descriptivo de los organismos vivos, la comprensión de esta arquitectura implica en la actualidad un maridaje con la función, por lo que se confunde en ocasiones con la fisiología (en lo que se denomina anatomía funcional) y forma parte de un grupo de ciencias básicas llamadas "ciencias morfológicas" (biología del desarrollo, histología y antropología), que completan su área de conocimiento con una visión dinámica y pragmática.');
Insert into HARRY.TCOLECCION (ID,NOMBRE,DESCRIPCION,URL_IMG,ID_TBITACORA,ID_TAREA,DESCRIPCION_L) values (6,'Agujero negro','Un agujero negro​ es una región finita del espacio en cuyo interior existe una concentración de masa lo suficientemente elevada y densa como para generar un campo gravitatorio tal que ninguna partícula material, ni siquiera la luz, puede escapar de ella.','https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Apjlab0ec7f3_EHT-image-of-M87-black-hole.jpg/270px-Apjlab0ec7f3_EHT-image-of-M87-black-hole.jpg',39,1,'La gravedad de un agujero negro, o «curvatura del espacio-tiempo», provoca una singularidad envuelta por una superficie cerrada, llamada horizonte de sucesos. Esto es previsto por las ecuaciones del campo de Einstein. El horizonte de sucesos separa la región del agujero negro del resto del universo, y a partir de él ninguna partícula puede salir, incluyendo los fotones. Dicha curvatura es estudiada por la relatividad general, la que predijo la existencia de los agujeros negros y fue su primer indicio.');
Insert into HARRY.TCOLECCION (ID,NOMBRE,DESCRIPCION,URL_IMG,ID_TBITACORA,ID_TAREA,DESCRIPCION_L) values (7,'Planeta','Un planeta es un objeto astronómico que orbita una estrella que es lo suficientemente masivo como para ser redondeado por su propia gravedad, no es lo suficientemente masivo como para causar fusión termonuclear, y ha despejado su región vecina de planetesimales.','https://upload.wikimedia.org/wikipedia/commons/3/3c/Solar_planets.jpg',42,1,'Más de planetas');
REM INSERTING into HARRY.TROL
SET DEFINE OFF;
Insert into HARRY.TROL (ID,NOMBRE,DESCRIPCION,ACTIVO,ID_TBITACORA) values (9,'PrimerROL','ROLes de Pruebas, 1º Primer ROL creado para aser asignado a los usuarios','Yes',null);
Insert into HARRY.TROL (ID,NOMBRE,DESCRIPCION,ACTIVO,ID_TBITACORA) values (10,'RolGenesis','Este ROL es utilizado para el Administrador','Yes',8);
Insert into HARRY.TROL (ID,NOMBRE,DESCRIPCION,ACTIVO,ID_TBITACORA) values (11,'Supervisor','Rol de Supervisor se encuentra acardo de las áreas y colecciones.','Yes',9);
Insert into HARRY.TROL (ID,NOMBRE,DESCRIPCION,ACTIVO,ID_TBITACORA) values (12,'Rol-noValido','PRUEBAS de PUT desde POSTMAN, AppMuxSystem','Yes',10);
Insert into HARRY.TROL (ID,NOMBRE,DESCRIPCION,ACTIVO,ID_TBITACORA) values (13,'Asistente','Encargado de agregar colecciones a las áreas','Yes',14);
Insert into HARRY.TROL (ID,NOMBRE,DESCRIPCION,ACTIVO,ID_TBITACORA) values (14,'Supervisor-02','Supervisor nivel nº2, para el ejemplo.','No',20);
Insert into HARRY.TROL (ID,NOMBRE,DESCRIPCION,ACTIVO,ID_TBITACORA) values (15,'Asistente','Encargados de coleccionar las colecciones','No',40);
Insert into HARRY.TROL (ID,NOMBRE,DESCRIPCION,ACTIVO,ID_TBITACORA) values (16,'Asistente','Asistente-02','No',41);
REM INSERTING into HARRY.TUSERLOGIN
SET DEFINE OFF;
Insert into HARRY.TUSERLOGIN (ID,USERNAME,PASSWORD,ACTIVO,ID_TUSUARIO,ID_TBITACORA) values (1,'UserGenesis','123','Yes',6,7);
Insert into HARRY.TUSERLOGIN (ID,USERNAME,PASSWORD,ACTIVO,ID_TUSUARIO,ID_TBITACORA) values (2,'userone','muyfacil','No',1,12);
Insert into HARRY.TUSERLOGIN (ID,USERNAME,PASSWORD,ACTIVO,ID_TUSUARIO,ID_TBITACORA) values (3,'user2','12341234','Yes',2,13);
Insert into HARRY.TUSERLOGIN (ID,USERNAME,PASSWORD,ACTIVO,ID_TUSUARIO,ID_TBITACORA) values (4,'jcesar','12341234','Yes',3,15);
Insert into HARRY.TUSERLOGIN (ID,USERNAME,PASSWORD,ACTIVO,ID_TUSUARIO,ID_TBITACORA) values (5,'paula','12341234','Yes',4,16);
Insert into HARRY.TUSERLOGIN (ID,USERNAME,PASSWORD,ACTIVO,ID_TUSUARIO,ID_TBITACORA) values (6,'jcastillo','muydificil','Yes',7,19);
Insert into HARRY.TUSERLOGIN (ID,USERNAME,PASSWORD,ACTIVO,ID_TUSUARIO,ID_TBITACORA) values (7,'luis','1234','Yes',8,21);
REM INSERTING into HARRY.TUSUARIO
SET DEFINE OFF;
Insert into HARRY.TUSUARIO (ID,NOMBRE,APELLIDO,FECHA_NACIMIENTO,GENERO,ID_TROL,ID_TBITACORA,TELEFONO,EMAIL) values (6,'User','Genesis',to_date('08/12/19','DD/MM/RR'),'M',9,7,'123',null);
Insert into HARRY.TUSUARIO (ID,NOMBRE,APELLIDO,FECHA_NACIMIENTO,GENERO,ID_TROL,ID_TBITACORA,TELEFONO,EMAIL) values (1,'Uno','Prueba',to_date('29/11/19','DD/MM/RR'),'F',12,12,'No','loquesea@gmail.com');
Insert into HARRY.TUSUARIO (ID,NOMBRE,APELLIDO,FECHA_NACIMIENTO,GENERO,ID_TROL,ID_TBITACORA,TELEFONO,EMAIL) values (2,'Dos','Prueba',null,'M',13,13,'Yes','lol@test.com');
Insert into HARRY.TUSUARIO (ID,NOMBRE,APELLIDO,FECHA_NACIMIENTO,GENERO,ID_TROL,ID_TBITACORA,TELEFONO,EMAIL) values (3,'Julio','Cesar',null,'M',10,15,'Yes','juliocesar@mail.com');
Insert into HARRY.TUSUARIO (ID,NOMBRE,APELLIDO,FECHA_NACIMIENTO,GENERO,ID_TROL,ID_TBITACORA,TELEFONO,EMAIL) values (4,'Paula','Perez',null,'F',11,16,'Yes','paula@mail.com');
Insert into HARRY.TUSUARIO (ID,NOMBRE,APELLIDO,FECHA_NACIMIENTO,GENERO,ID_TROL,ID_TBITACORA,TELEFONO,EMAIL) values (7,'Jennifer','Castillo',null,'F',10,19,'Yes','jennifer@test.com');
Insert into HARRY.TUSUARIO (ID,NOMBRE,APELLIDO,FECHA_NACIMIENTO,GENERO,ID_TROL,ID_TBITACORA,TELEFONO,EMAIL) values (8,'Luis','Quintero',null,'M',12,21,'Yes','luis@gmail.com');
REM INSERTING into HARRY.USUARIOS
SET DEFINE OFF;
Insert into HARRY.USUARIOS (ID,NOMBRE,FECHA_INSERTADA) values (1,'sdslkndfsasd',to_date('02/12/19','DD/MM/RR'));
Insert into HARRY.USUARIOS (ID,NOMBRE,FECHA_INSERTADA) values (2,'sdslkndfsasd',to_date('01/12/19','DD/MM/RR'));
Insert into HARRY.USUARIOS (ID,NOMBRE,FECHA_INSERTADA) values (3,'Lol',to_date('01/12/19','DD/MM/RR'));
Insert into HARRY.USUARIOS (ID,NOMBRE,FECHA_INSERTADA) values (4,'Superman',to_date('01/12/19','DD/MM/RR'));
Insert into HARRY.USUARIOS (ID,NOMBRE,FECHA_INSERTADA) values (5,'Harry Alvarado',null);
Insert into HARRY.USUARIOS (ID,NOMBRE,FECHA_INSERTADA) values (6,'Harry Alvarado',to_date('01/12/19','DD/MM/RR'));
Insert into HARRY.USUARIOS (ID,NOMBRE,FECHA_INSERTADA) values (7,'Harry Alvarado',to_date('01/12/19','DD/MM/RR'));
Insert into HARRY.USUARIOS (ID,NOMBRE,FECHA_INSERTADA) values (8,'Harry Alvarado',to_date('01/12/19','DD/MM/RR'));
Insert into HARRY.USUARIOS (ID,NOMBRE,FECHA_INSERTADA) values (9,'Harry Alvarado',to_date('01/12/19','DD/MM/RR'));
--------------------------------------------------------
--  DDL for Index ROLES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HARRY"."ROLES_PK" ON "HARRY"."ROLES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TSMUXDB" ;
--------------------------------------------------------
--  DDL for Index TAREA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HARRY"."TAREA_PK" ON "HARRY"."TAREA" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TSMUXDB" ;
--------------------------------------------------------
--  DDL for Index TARTICULOS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HARRY"."TARTICULOS_PK" ON "HARRY"."TARTICULOS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TSMUXDB" ;
--------------------------------------------------------
--  DDL for Index TBITACORA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HARRY"."TBITACORA_PK" ON "HARRY"."TBITACORA" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TSMUXDB" ;
--------------------------------------------------------
--  DDL for Index TCOLECCION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HARRY"."TCOLECCION_PK" ON "HARRY"."TCOLECCION" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TSMUXDB" ;
--------------------------------------------------------
--  DDL for Index TROL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HARRY"."TROL_PK" ON "HARRY"."TROL" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TSMUXDB" ;
--------------------------------------------------------
--  DDL for Index TUSERLOGIN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HARRY"."TUSERLOGIN_PK" ON "HARRY"."TUSERLOGIN" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TSMUXDB" ;
--------------------------------------------------------
--  DDL for Index TUSUARIO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HARRY"."TUSUARIO_PK" ON "HARRY"."TUSUARIO" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TSMUXDB" ;
--------------------------------------------------------
--  DDL for Index USUARIOS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HARRY"."USUARIOS_PK" ON "HARRY"."USUARIOS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TSMUXDB" ;
--------------------------------------------------------
--  DDL for Trigger ROLES_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HARRY"."ROLES_TRG" 
BEFORE INSERT ON ROLES 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT ROLES_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "HARRY"."ROLES_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TAREA_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HARRY"."TAREA_TRG" 
BEFORE INSERT ON TAREA 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT TAREA_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "HARRY"."TAREA_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TARTICULOS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HARRY"."TARTICULOS_TRG" 
BEFORE INSERT ON TARTICULOS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT TARTICULOS_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "HARRY"."TARTICULOS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TBITACORA_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HARRY"."TBITACORA_TRG" 
BEFORE INSERT ON TBITACORA 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT TBITACORA_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "HARRY"."TBITACORA_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TCOLECCION_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HARRY"."TCOLECCION_TRG" 
BEFORE INSERT ON TCOLECCION 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "HARRY"."TCOLECCION_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TCOLECCION_TRG1
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HARRY"."TCOLECCION_TRG1" 
BEFORE INSERT ON TCOLECCION 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT TCOLECCION_SEQ1.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "HARRY"."TCOLECCION_TRG1" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TROL_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HARRY"."TROL_TRG" 
BEFORE INSERT ON TROL 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT TROL_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "HARRY"."TROL_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TUSERLOGIN_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HARRY"."TUSERLOGIN_TRG" 
BEFORE INSERT ON TUSERLOGIN 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "HARRY"."TUSERLOGIN_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TUSERLOGIN_TRG1
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HARRY"."TUSERLOGIN_TRG1" 
BEFORE INSERT ON TUSERLOGIN 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT TUSERLOGIN_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "HARRY"."TUSERLOGIN_TRG1" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TUSUARIO_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HARRY"."TUSUARIO_TRG" 
BEFORE INSERT ON TUSUARIO 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "HARRY"."TUSUARIO_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TUSUARIO_TRG1
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HARRY"."TUSUARIO_TRG1" 
BEFORE INSERT ON TUSUARIO 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "HARRY"."TUSUARIO_TRG1" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TUSUARIO_TRG2
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HARRY"."TUSUARIO_TRG2" 
BEFORE INSERT ON TUSUARIO 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT TUSUARIO_SEQ2.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "HARRY"."TUSUARIO_TRG2" ENABLE;
--------------------------------------------------------
--  DDL for Trigger USUARIOS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HARRY"."USUARIOS_TRG" 
BEFORE INSERT ON USUARIOS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT USUARIOS_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "HARRY"."USUARIOS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Package PKG_AREA
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "HARRY"."PKG_AREA" AS
    PROCEDURE crear (
        vi_nombre                 VARCHAR2,
        vi_descripcion            VARCHAR2,
        vi_id_usuario_insercion   INTEGER,
        vo_id_ta                  OUT   INTEGER,
        vo_id_tb                  OUT   INTEGER
    );

    PROCEDURE actualizar (
        vi_id                     INTEGER,
        vi_nombre                 VARCHAR2,
        vi_descripcion            VARCHAR2,
        vi_id_usuario_insercion   INTEGER,
        vo_id_ta                  OUT   INTEGER,
        vo_id_tb                  OUT   INTEGER
    );

END pkg_area;

/
--------------------------------------------------------
--  DDL for Package PKG_COLECCION
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "HARRY"."PKG_COLECCION" AS
    PROCEDURE crear (
        vi_nombre                 VARCHAR2,
        vi_descripcion            VARCHAR2,
        vi_descripcion_l          VARCHAR2,
        vi_url_img                VARCHAR2,
        vi_id_usuario_insercion   INTEGER,
        vi_id_ta                  INTEGER,
        vo_id_tc                  OUT   INTEGER,
        vo_id_tb                  OUT   INTEGER
    );

    PROCEDURE actualizar (
        vi_id                     INTEGER,
        vi_nombre                 VARCHAR2,
        vi_descripcion            VARCHAR2,
        vi_descripcion_l          VARCHAR2,
        vi_url_img                VARCHAR2,
        vi_id_usuario_insercion   INTEGER,
        vi_id_ta                  INTEGER,
        vo_id_tb                  OUT INTEGER
    );

END pkg_coleccion;

/
--------------------------------------------------------
--  DDL for Package PKG_ROL
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "HARRY"."PKG_ROL" AS
    PROCEDURE crear (
        vi_nombre        VARCHAR2,
        vi_descripcion   VARCHAR2,
        vi_activo        VARCHAR2,
        vi_id_usuario    INTEGER,
        id_tb            OUT   INTEGER,
        id_tr            OUT   INTEGER
    );

    PROCEDURE actualizar (
        vi_id             INTEGER,
        vi_nombre         VARCHAR2,
        vi_descripcion    VARCHAR2,
        vi_activo         VARCHAR2,
        vi_id_usuario     INTEGER,
        vi_id_tbitacora   INTEGER
    );

END pkg_rol;

/
--------------------------------------------------------
--  DDL for Package PKG_USUARIO
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "HARRY"."PKG_USUARIO" AS
    PROCEDURE crear (
        vi_nombre                 VARCHAR2,
        vi_apellido               VARCHAR2,
        vi_fecha_nacimiento       DATE,
        vi_genero                 VARCHAR2,
        vi_telefono               VARCHAR2,
        vi_email                  VARCHAR2,
        vi_id_trol                INTEGER,
        vi_username               VARCHAR2,
        vi_password               VARCHAR2,
        vi_activo                 VARCHAR2,
        vi_id_usuario_insercion   INTEGER,
        id_tu                     OUT   INTEGER,
        id_tb                     OUT   INTEGER
    );

    PROCEDURE actualizar (
        vi_id                 INTEGER,
        vi_nombre             VARCHAR2,
        vi_apellido           VARCHAR2,
        vi_fecha_nacimiento   DATE,
        vi_genero             VARCHAR2,
        vi_telefono           VARCHAR2,
        vi_email              VARCHAR2,
        vi_id_trol            INTEGER,
        vi_username           VARCHAR2,
        vi_password           VARCHAR2,
        vi_activo             VARCHAR2,
        vi_id_usuario         INTEGER
    );

END pkg_usuario;

/
--------------------------------------------------------
--  DDL for Package Body PKG_AREA
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "HARRY"."PKG_AREA" AS

    PROCEDURE crear (
        vi_nombre                 VARCHAR2,
        vi_descripcion            VARCHAR2,
        vi_id_usuario_insercion   INTEGER,
        vo_id_ta                  OUT   INTEGER,
        vo_id_tb                  OUT   INTEGER
    ) AS
    BEGIN
        INSERT INTO tbitacora (
            fecha_insercion,
            id_usuario_insercion
        ) VALUES (
            sysdate,
            vi_id_usuario_insercion
        ) RETURNING id INTO vo_id_tb;

        INSERT INTO tarea (
            nombre,
            descripcion,
            id_tbitacora
        ) VALUES (
            vi_nombre,
            vi_descripcion,
            vo_id_tb
        ) RETURNING id INTO vo_id_ta;

    END crear;

    PROCEDURE actualizar (
        vi_id                     INTEGER,
        vi_nombre                 VARCHAR2,
        vi_descripcion            VARCHAR2,
        vi_id_usuario_insercion   INTEGER,
        vo_id_ta                  OUT   INTEGER,
        vo_id_tb                  OUT   INTEGER
    ) AS
    BEGIN
        SELECT
            id_tbitacora
        INTO vo_id_tb
        FROM
            tarea
        WHERE
            id = vi_id;

        UPDATE tbitacora
        SET
            fecha_ult_mod = sysdate,
            id_usuario_ult_mod = id_usuario_insercion
        WHERE
            id = vo_id_tb;

        UPDATE tarea
        SET
            nombre = vi_nombre,
            descripcion = vi_descripcion
        WHERE
            id = vi_id;

    END actualizar;

END pkg_area;

/
--------------------------------------------------------
--  DDL for Package Body PKG_COLECCION
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "HARRY"."PKG_COLECCION" AS

    PROCEDURE crear (
        vi_nombre                 VARCHAR2,
        vi_descripcion            VARCHAR2,
        vi_descripcion_l          VARCHAR2,
        vi_url_img                VARCHAR2,
        vi_id_usuario_insercion   INTEGER,
        vi_id_ta                  INTEGER,
        vo_id_tc                  OUT   INTEGER,
        vo_id_tb                  OUT   INTEGER
    ) AS
    BEGIN
        INSERT INTO tbitacora (
            fecha_insercion,
            id_usuario_insercion
        ) VALUES (
            sysdate,
            vi_id_usuario_insercion
        ) RETURNING id INTO vo_id_tb;

        INSERT INTO tcoleccion (
            nombre,
            descripcion,
            descripcion_l,
            url_img,
            id_tbitacora,
            id_tarea
        ) VALUES (
            vi_nombre,
            vi_descripcion,
            vi_descripcion_l,
            vi_url_img,
            vo_id_tb,
            vi_id_ta
        ) RETURNING id INTO vo_id_tc;

    END crear;

    PROCEDURE actualizar (
        vi_id                     INTEGER,
        vi_nombre                 VARCHAR2,
        vi_descripcion            VARCHAR2,
        vi_descripcion_l          VARCHAR2,
        vi_url_img                VARCHAR2,
        vi_id_usuario_insercion   INTEGER,
        vi_id_ta                  INTEGER,
        vo_id_tb                  OUT INTEGER
    ) AS
    BEGIN
        SELECT
            id_tbitacora
        INTO vo_id_tb
        FROM
            tcoleccion
        WHERE
            id = vi_id;

        UPDATE tbitacora
        SET
            fecha_ult_mod = sysdate,
            id_usuario_ult_mod = id_usuario_insercion
        WHERE
            id = vo_id_tb;

        UPDATE tcoleccion
        SET
            nombre = vi_nombre,
            descripcion = vi_descripcion,
            descripcion_l = vi_descripcion_l,
            url_img = vi_url_img,
            id_tarea = vi_id_ta
        WHERE
            id = vi_id;

    END actualizar;

END pkg_coleccion;

/
--------------------------------------------------------
--  DDL for Package Body PKG_ROL
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "HARRY"."PKG_ROL" AS

    PROCEDURE crear (
        vi_nombre        VARCHAR2,
        vi_descripcion   VARCHAR2,
        vi_activo        VARCHAR2,
        vi_id_usuario    INTEGER,
        id_tb            OUT   INTEGER,
        id_tr            OUT   INTEGER
    ) AS
    BEGIN
        INSERT INTO tbitacora (
            fecha_insercion,
            id_usuario_insercion
        ) VALUES (
            sysdate,
            vi_id_usuario
        ) RETURNING id INTO id_tb;

        INSERT INTO trol (
            nombre,
            descripcion,
            activo,
            id_tbitacora
        ) VALUES (
            vi_nombre,
            vi_descripcion,
            vi_activo,
            id_tb
        ) RETURNING id INTO id_tr;

        dbms_output.put_line('Ejecuccion del procedimeinto id_tb: '
                             || id_tb
                             || ' TR: '
                             || id_tr);
    END crear;

    PROCEDURE actualizar (
        vi_id             INTEGER,
        vi_nombre         VARCHAR2,
        vi_descripcion    VARCHAR2,
        vi_activo         VARCHAR2,
        vi_id_usuario     INTEGER,
        vi_id_tbitacora   INTEGER
    ) AS
    BEGIN
        UPDATE tbitacora
        SET
            fecha_ult_mod = sysdate,
            id_usuario_ult_mod = vi_id_usuario
        WHERE
            id = vi_id_tbitacora;

        UPDATE trol
        SET
            nombre = vi_nombre,
            descripcion = vi_descripcion,
            activo = vi_activo
        WHERE
            id = vi_id;

    END actualizar;

END pkg_rol;

/
--------------------------------------------------------
--  DDL for Package Body PKG_USUARIO
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "HARRY"."PKG_USUARIO" AS

    PROCEDURE crear (
        vi_nombre                 VARCHAR2,
        vi_apellido               VARCHAR2,
        vi_fecha_nacimiento       DATE,
        vi_genero                 VARCHAR2,
        vi_telefono               VARCHAR2,
        vi_email                  VARCHAR2,
        vi_id_trol                INTEGER,
        vi_username               VARCHAR2,
        vi_password               VARCHAR2,
        vi_activo                 VARCHAR2,
        vi_id_usuario_insercion   INTEGER,
        id_tu                     OUT   INTEGER,
        id_tb                     OUT   INTEGER
    ) AS
    BEGIN
        INSERT INTO tbitacora (
            fecha_insercion,
            id_usuario_insercion
        ) VALUES (
            sysdate,
            vi_id_usuario_insercion
        ) RETURNING id INTO id_tb;

        INSERT INTO tusuario (
            nombre,
            apellido,
            fecha_nacimiento,
            genero,
            telefono,
            email,
            id_trol,
            id_tbitacora
        ) VALUES (
            vi_nombre,
            vi_apellido,
            vi_fecha_nacimiento,
            vi_genero,
            vi_telefono,
            vi_email,
            vi_id_trol,
            id_tb
        ) RETURNING id INTO id_tu;

        INSERT INTO tuserlogin (
            username,
            password,
            activo,
            id_tusuario,
            id_tbitacora
        ) VALUES (
            vi_username,
            vi_password,
            vi_activo,
            id_tu,
            id_tb
        );

        dbms_output.put_line('Ejecuccion del procedimeinto id_tu: '
                             || id_tu
                             || ' TB: '
                             || id_tb);
    END crear;

    PROCEDURE actualizar (
        vi_id                 INTEGER,
        vi_nombre             VARCHAR2,
        vi_apellido           VARCHAR2,
        vi_fecha_nacimiento   DATE,
        vi_genero             VARCHAR2,
        vi_telefono           VARCHAR2,
        vi_email              VARCHAR2,
        vi_id_trol            INTEGER,
        vi_username           VARCHAR2,
        vi_password           VARCHAR2,
        vi_activo             VARCHAR2,
        vi_id_usuario         INTEGER
    ) AS
        vid_tbitacora INTEGER;
    BEGIN
        SELECT
            id_bitacora
        INTO vid_tbitacora
        FROM
            vusuario
        WHERE
            id = vi_id;

        UPDATE tbitacora
        SET
            fecha_ult_mod = sysdate,
            id_usuario_ult_mod = vi_id_usuario
        WHERE
            id = vid_tbitacora;

        UPDATE tusuario
        SET
            nombre = vi_nombre,
            apellido = vi_apellido,
            genero = vi_genero,
            fecha_nacimiento = vi_fecha_nacimiento,
            telefono = vi_telefono,
            email = vi_email,
            id_trol = vi_id_trol
        WHERE
            id = vi_id;

        UPDATE tuserlogin
        SET
            username = vi_username,
            password = vi_password,
            activo = vi_activo
        WHERE
            id_tusuario = vi_id;

    END actualizar;

END pkg_usuario;

/
--------------------------------------------------------
--  DDL for Synonymn DBMS_OUTPUT
--------------------------------------------------------

  CREATE OR REPLACE PUBLIC SYNONYM "DBMS_OUTPUT" FOR "SYS"."DBMS_OUTPUT";
--------------------------------------------------------
--  Constraints for Table ROLES
--------------------------------------------------------

  ALTER TABLE "HARRY"."ROLES" ADD CONSTRAINT "ROLES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TSMUXDB"  ENABLE;
  ALTER TABLE "HARRY"."ROLES" MODIFY ("ID_USUARIO_INSERCION" NOT NULL ENABLE);
  ALTER TABLE "HARRY"."ROLES" MODIFY ("FECHA_INSERTADA" NOT NULL ENABLE);
  ALTER TABLE "HARRY"."ROLES" MODIFY ("ACTIVO" NOT NULL ENABLE);
  ALTER TABLE "HARRY"."ROLES" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "HARRY"."ROLES" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TAREA
--------------------------------------------------------

  ALTER TABLE "HARRY"."TAREA" ADD CONSTRAINT "TAREA_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TSMUXDB"  ENABLE;
  ALTER TABLE "HARRY"."TAREA" MODIFY ("ID_TBITACORA" NOT NULL ENABLE);
  ALTER TABLE "HARRY"."TAREA" MODIFY ("DESCRIPCION" NOT NULL ENABLE);
  ALTER TABLE "HARRY"."TAREA" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "HARRY"."TAREA" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TARTICULOS
--------------------------------------------------------

  ALTER TABLE "HARRY"."TARTICULOS" ADD CONSTRAINT "TARTICULOS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TSMUXDB"  ENABLE;
  ALTER TABLE "HARRY"."TARTICULOS" MODIFY ("ID_TAREA" NOT NULL ENABLE);
  ALTER TABLE "HARRY"."TARTICULOS" MODIFY ("ID_TBITACORA" NOT NULL ENABLE);
  ALTER TABLE "HARRY"."TARTICULOS" MODIFY ("DESCRIPCION" NOT NULL ENABLE);
  ALTER TABLE "HARRY"."TARTICULOS" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "HARRY"."TARTICULOS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBITACORA
--------------------------------------------------------

  ALTER TABLE "HARRY"."TBITACORA" ADD CONSTRAINT "TBITACORA_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TSMUXDB"  ENABLE;
  ALTER TABLE "HARRY"."TBITACORA" MODIFY ("FECHA_INSERCION" NOT NULL ENABLE);
  ALTER TABLE "HARRY"."TBITACORA" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TCOLECCION
--------------------------------------------------------

  ALTER TABLE "HARRY"."TCOLECCION" ADD CONSTRAINT "TCOLECCION_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TSMUXDB"  ENABLE;
  ALTER TABLE "HARRY"."TCOLECCION" MODIFY ("ID_TAREA" NOT NULL ENABLE);
  ALTER TABLE "HARRY"."TCOLECCION" MODIFY ("ID_TBITACORA" NOT NULL ENABLE);
  ALTER TABLE "HARRY"."TCOLECCION" MODIFY ("DESCRIPCION" NOT NULL ENABLE);
  ALTER TABLE "HARRY"."TCOLECCION" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "HARRY"."TCOLECCION" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TROL
--------------------------------------------------------

  ALTER TABLE "HARRY"."TROL" ADD CONSTRAINT "TROL_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TSMUXDB"  ENABLE;
  ALTER TABLE "HARRY"."TROL" MODIFY ("ACTIVO" NOT NULL ENABLE);
  ALTER TABLE "HARRY"."TROL" MODIFY ("DESCRIPCION" NOT NULL ENABLE);
  ALTER TABLE "HARRY"."TROL" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "HARRY"."TROL" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TUSERLOGIN
--------------------------------------------------------

  ALTER TABLE "HARRY"."TUSERLOGIN" ADD CONSTRAINT "TUSERLOGIN_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TSMUXDB"  ENABLE;
  ALTER TABLE "HARRY"."TUSERLOGIN" MODIFY ("ID_TBITACORA" NOT NULL ENABLE);
  ALTER TABLE "HARRY"."TUSERLOGIN" MODIFY ("ID_TUSUARIO" NOT NULL ENABLE);
  ALTER TABLE "HARRY"."TUSERLOGIN" MODIFY ("ACTIVO" NOT NULL ENABLE);
  ALTER TABLE "HARRY"."TUSERLOGIN" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "HARRY"."TUSERLOGIN" MODIFY ("USERNAME" NOT NULL ENABLE);
  ALTER TABLE "HARRY"."TUSERLOGIN" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TUSUARIO
--------------------------------------------------------

  ALTER TABLE "HARRY"."TUSUARIO" MODIFY ("TELEFONO" NOT NULL ENABLE);
  ALTER TABLE "HARRY"."TUSUARIO" ADD CONSTRAINT "TUSUARIO_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TSMUXDB"  ENABLE;
  ALTER TABLE "HARRY"."TUSUARIO" MODIFY ("ID_TBITACORA" NOT NULL ENABLE);
  ALTER TABLE "HARRY"."TUSUARIO" MODIFY ("ID_TROL" NOT NULL ENABLE);
  ALTER TABLE "HARRY"."TUSUARIO" MODIFY ("APELLIDO" NOT NULL ENABLE);
  ALTER TABLE "HARRY"."TUSUARIO" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "HARRY"."TUSUARIO" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table USUARIOS
--------------------------------------------------------

  ALTER TABLE "HARRY"."USUARIOS" ADD CONSTRAINT "USUARIOS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TSMUXDB"  ENABLE;
  ALTER TABLE "HARRY"."USUARIOS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table TAREA
--------------------------------------------------------

  ALTER TABLE "HARRY"."TAREA" ADD CONSTRAINT "FK01" FOREIGN KEY ("ID_TBITACORA")
	  REFERENCES "HARRY"."TBITACORA" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TARTICULOS
--------------------------------------------------------

  ALTER TABLE "HARRY"."TARTICULOS" ADD CONSTRAINT "FK02" FOREIGN KEY ("ID_TBITACORA")
	  REFERENCES "HARRY"."TBITACORA" ("ID") ENABLE;
  ALTER TABLE "HARRY"."TARTICULOS" ADD CONSTRAINT "FK03" FOREIGN KEY ("ID_TAREA")
	  REFERENCES "HARRY"."TAREA" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TBITACORA
--------------------------------------------------------

  ALTER TABLE "HARRY"."TBITACORA" ADD CONSTRAINT "FK04" FOREIGN KEY ("ID_USUARIO_INSERCION")
	  REFERENCES "HARRY"."TUSUARIO" ("ID") DISABLE;
  ALTER TABLE "HARRY"."TBITACORA" ADD CONSTRAINT "FK05" FOREIGN KEY ("ID_USUARIO_ULT_MOD")
	  REFERENCES "HARRY"."TUSUARIO" ("ID") DISABLE;
--------------------------------------------------------
--  Ref Constraints for Table TCOLECCION
--------------------------------------------------------

  ALTER TABLE "HARRY"."TCOLECCION" ADD CONSTRAINT "FK06" FOREIGN KEY ("ID_TBITACORA")
	  REFERENCES "HARRY"."TBITACORA" ("ID") ENABLE;
  ALTER TABLE "HARRY"."TCOLECCION" ADD CONSTRAINT "FK08" FOREIGN KEY ("ID_TAREA")
	  REFERENCES "HARRY"."TAREA" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TROL
--------------------------------------------------------

  ALTER TABLE "HARRY"."TROL" ADD CONSTRAINT "FK09" FOREIGN KEY ("ID_TBITACORA")
	  REFERENCES "HARRY"."TBITACORA" ("ID") DISABLE;
--------------------------------------------------------
--  Ref Constraints for Table TUSERLOGIN
--------------------------------------------------------

  ALTER TABLE "HARRY"."TUSERLOGIN" ADD CONSTRAINT "FK10" FOREIGN KEY ("ID_TUSUARIO")
	  REFERENCES "HARRY"."TUSUARIO" ("ID") ENABLE;
  ALTER TABLE "HARRY"."TUSERLOGIN" ADD CONSTRAINT "FK11" FOREIGN KEY ("ID_TBITACORA")
	  REFERENCES "HARRY"."TBITACORA" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TUSUARIO
--------------------------------------------------------

  ALTER TABLE "HARRY"."TUSUARIO" ADD CONSTRAINT "FK12" FOREIGN KEY ("ID_TROL")
	  REFERENCES "HARRY"."TROL" ("ID") ENABLE;
  ALTER TABLE "HARRY"."TUSUARIO" ADD CONSTRAINT "FK13" FOREIGN KEY ("ID_TBITACORA")
	  REFERENCES "HARRY"."TBITACORA" ("ID") ENABLE;
