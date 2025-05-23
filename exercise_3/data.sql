insert into 
  INVOICE(INVOICE_ID, INVOICE_DATE, INVOICE_AMOUNT, CURRENCY)
values
 (1, TO_DATE('23/05/25'), 150, 'EUR'),
 (2, TO_DATE('23/04/25'), 150, 'EUR'),
 (3, TO_DATE('13/05/25'), 500, 'USD'),
 (4, TO_DATE('13/05/25'), 503, 'EUR'),
 (5, TO_DATE('16/05/25'), 700, 'EUR');


insert into 
  PAYMENT(PAYMENT_ID, PAYMENT_DATE, PAYMENT_AMOUNT, CURRENCY, INVOICE_ID)
values
 ( 1, TO_DATE('20/05/25'),  50, 'EUR', 1),
 ( 2, TO_DATE('20/05/25'),  57, 'EUR', 1),
 ( 3, TO_DATE('20/05/25'),  32, 'EUR', 2),
 ( 4, TO_DATE('21/05/25'),   7, 'EUR', 3),
 ( 5, TO_DATE('21/05/25'), 493, 'USD', 3),
 ( 6, TO_DATE('21/05/25'), 400, 'EUR', 4),
 ( 7, TO_DATE('22/05/25'),  32, 'EUR', 4),
 ( 8, TO_DATE('22/05/25'),   1, 'EUR', 4),
 ( 9, TO_DATE('22/05/25'),  70, 'EUR', 4),
 (10, TO_DATE('23/05/25'), 350, 'EUR', 5),
 (11, TO_DATE('23/05/25'), 350, 'EUR', 5),
 (12, TO_DATE('23/05/25'),  43, 'EUR', 1);