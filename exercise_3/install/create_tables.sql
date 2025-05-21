drop table if exists PAYMENT cascade constraints;
drop table if exists INVOICE cascade constraints;

create table PAYMENT (
  PAYMENT_ID NUMBER,
  PAYMENT_DATE DATE,
  PAYMENT_AMOUNT NUMBER,
  CURRENCY VARCHAR2(3),
  INVOICE_ID NUMBER
);

create table INVOICE (
INVOICE_ID NUMBER,
INVOICE_DATE DATE,
INVOICE_AMOUNTS NUMBER,
CURRENCY VARCHAR2(3)
);

alter table PAYMENT add constraint PAYMENT_PK primary key (PAYMENT_ID);
alter table INVOICE add constraint INVOICE_PK primary key (INVOICE_ID);


alter table PAYMENT add constraint PAYMENT_FK foreign key (INVOICE_ID) references INVOICE(INVOICE_ID);


drop sequence if exists PAYMENT_SEQ;
create sequence PAYMENT_SEQ start with 1;

drop sequence if exists INVOICE_SEQ;
create sequence INVOICE_SEQ start with 1;