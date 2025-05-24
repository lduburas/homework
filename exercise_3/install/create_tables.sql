drop table if exists PAYMENT cascade constraints;
drop table if exists INVOICE cascade constraints;

create table PAYMENT (
  PAYMENT_ID NUMBER NOT NULL,
  PAYMENT_DATE DATE NOT NULL,
  PAYMENT_AMOUNT NUMBER NOT NULL,
  CURRENCY VARCHAR2(3) NOT NULL,
  INVOICE_ID NUMBER NOT NULL
);

create table INVOICE (
  INVOICE_ID NUMBER NOT NULL,
  INVOICE_DATE DATE NOT NULL,
  INVOICE_AMOUNT NUMBER NOT NULL,
  CURRENCY VARCHAR2(3) NOT NULL
);

alter table PAYMENT add constraint PAYMENT_PK primary key (PAYMENT_ID);
alter table INVOICE add constraint INVOICE_PK primary key (INVOICE_ID);


alter table PAYMENT add constraint PAYMENT_FK foreign key (INVOICE_ID) references INVOICE(INVOICE_ID);


drop sequence if exists PAYMENT_SEQ;
create sequence PAYMENT_SEQ start with 100;

drop sequence if exists INVOICE_SEQ;
create sequence INVOICE_SEQ start with 100;