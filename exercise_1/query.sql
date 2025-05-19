select 
  age, description
from
  age_class ac
where
  age > 40 or age is NULL
order by age asc
fetch first 1 rows only;
