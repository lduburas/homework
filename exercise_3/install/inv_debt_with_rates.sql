create or replace view inv_debt_rate
as
select
  i.INVOICE_ID,
  i.INVOICE_AMOUNT,
  pa.AMOUNT_PAYED,
  i.INVOICE_AMOUNT - pa.AMOUNT_PAYED as debt,
  i.CURRENCY
from INVOICE i,
(
  select
    p.INVOICE_ID,
    sum(p.PAYMENT_AMOUNT *
    (case
      when i.CURRENCY = p.CURRENCY then 1 
      else r.EX_RATE
    end)) AMOUNT_PAYED
  from
    PAYMENT p,
    INVOICE i,
    EX_RATES r
  where
    p.INVOICE_ID = i.INVOICE_ID and
    trunc(p.PAYMENT_DATE) = r.EX_DATE (+) and 
    p.CURRENCY = r.EX_FROM (+) and i.CURRENCY = r.EX_TO (+)
  group by p.INVOICE_ID
) pa 
where
  i.INVOICE_ID = pa.INVOICE_ID and
  (i.INVOICE_AMOUNT > pa.AMOUNT_PAYED);