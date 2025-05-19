insert into pi_iteration (
  iteration,
  sixteen_degree,
  eight_mult,
  addend
) 
select 
  iteration + 1,
  sixteen_degree * 16,
  eight_mult + 8,
  1 / sixteen_degree * (4 / (eight_mult + 1) - 2 / (eight_mult + 4) - 1 / (eight_mult + 5) - 1 / (eight_mult + 6))
from
  pi_iteration
where iteration = 0;