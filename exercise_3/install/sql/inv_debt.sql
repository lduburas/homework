drop view if exists invoices_with_debt;
create view invoices_with_debt
as
select
  i.INVOICE_ID,
  i.INVOICE_AMOUNTS,
  pa.AMOUNT_PAYED,
  i.INVOICE_AMOUNTS - pa.AMOUNT_PAYED as debt,
  i.CURRENCY
from INVOICE i,
(
  select
    p.INVOICE_ID,
    p.CURRENCY,
    sum(p.PAYMENT_AMOUNT) AMOUNT_PAYED
  from PAYMENT p
  group by p.INVOICE_ID, p.CURRENCY
) pa 
where
  i.INVOICE_ID = pa.INVOICE_ID and i.CURRENCY = pa.CURRENCY and (i.INVOICE_AMOUNTS > pa.AMOUNT_PAYED);