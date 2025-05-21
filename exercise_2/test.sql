declare 
  pi number;
begin
  pi := calc_pi(15);
  DBMS_OUTPUT.PUT_LINE('Pi value is ' || pi);
end;