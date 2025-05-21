create view invoices_with_debt
as
select
  i.INVOICE_ID,
  i.INVOICE_AMOUNTS,
  pa.amount_payed,
  i.INVOICE_AMOUNTS - pa.amount_payed as debt,
  i.CURRENCY
from INVOICE i,
(
  select
    p.INVOICE_ID,
    p.CURRENCY,
    sum(p.PAYMENT_AMOUNT) amount_payed
  from PAYMENT p
  group by p.INVOICE_ID, p.CURRENCY
) pa 
where
  i.INVOICE_ID = pa.INVOICE_ID and i.CURRENCY = pa.CURRENCY and (i.INVOICE_AMOUNTS > pa.amount_payed);