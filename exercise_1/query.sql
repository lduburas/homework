select 
  age, description
from
  age_class ac
where
  age > 55 or age is NULL
order by age asc
limit 1
