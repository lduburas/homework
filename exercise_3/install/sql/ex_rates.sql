create or replace view ex_rates as
with
  days as (
    select 
      rownum r,  trunc(add_months(sysdate, -4) + rownum) as ex_date
    from dual
  connect by rownum <= (sysdate - add_months(sysdate, -4))),
  exchange as (
    select 1 as ex_id, 'EUR' as ex_from, 'USD' as ex_to from dual
    union all
    select 2 as ex_id, 'USD' as ex_from, 'EUR' as ex_to from dual
  )
select 
  d.ex_date,
  case
    when  e.ex_id = 1 then 1 + r / 100
    else trunc(1 / (1 + r / 100), 5)
  end as ex_rate,
  ex_from, ex_to
from days d, exchange e