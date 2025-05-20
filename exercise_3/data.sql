insert into 
  INVOICE(INVOICE_ID, INVOICE_DATE, INVOICE_AMOUNTS, CURRENCY)
values
 (1, SYSDATE, 150, 'EUR'),
 (2, add_months(SYSDATE, -1), 150, 'EUR'),
 (3, SYSDATE - 10, 500, 'USD'),
 (4, SYSDATE - 10, 503, 'EUR'),
 (5, SYSDATE - 7, 700, 'EUR');


insert into 
  PAYMENT(PAYMENT_ID, PAYMENT_DATE, PAYMENT_AMOUNT, CURRENCY, INVOICE_ID)
values
 ( 1, SYSDATE - 3,  50, 'EUR', 1),
 ( 2, SYSDATE - 3,  57, 'EUR', 1),
 ( 3, SYSDATE - 3,  32, 'EUR', 2),
 ( 4, SYSDATE - 2,   7, 'EUR', 3),
 ( 5, SYSDATE - 2, 493, 'USD', 3),
 ( 6, SYSDATE - 2, 400, 'EUR', 4),
 ( 7, SYSDATE - 1,  32, 'EUR', 4),
 ( 8, SYSDATE - 1,   1, 'EUR', 4),
 ( 9, SYSDATE - 1,  70, 'EUR', 4),
 (10, SYSDATE,     350, 'EUR', 5),
 (11, SYSDATE,     350, 'EUR', 5),
 (12, SYSDATE,      43, 'EUR', 1);