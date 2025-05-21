create or replace function calc_pi(p_precision number) return number
is
  i number;
  pi_value number;
  rec pi_iteration%rowtype;
begin
  if p_precision < 0 then 
    raise_application_error( -20001, 'Precision must be positive');
  end if;
  if p_precision > 37 then 
    raise_application_error( -20002, 'Maximum supported precision is 37');
  end if;

  lock table pi_iteration in exclusive mode nowait;
  delete from pi_iteration;
  insert into pi_iteration values (0, 1, 0, 0);

  pi_value := 0;

  for i in 0..p_precision + 1 loop
    select 
      iteration + 1,
      sixteen_degree * 16,
      eight_mult + 8,
      1 / sixteen_degree * (4 / (eight_mult + 1) - 2 / (eight_mult + 4) - 1 / (eight_mult + 5) - 1 / (eight_mult + 6))
    into rec
    from
      pi_iteration
    where iteration = i;

    insert into pi_iteration values rec;

    pi_value := pi_value + rec.addend;
  end loop;
  
  commit;
  return trunc(pi_value, p_precision);
end;
/