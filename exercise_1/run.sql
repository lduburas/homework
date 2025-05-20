declare 
  age number;
begin 
  age := 40;
  DBMS_OUTPUT.PUT_LINE('For ' || age || ' diagnosis is ' || sw_age.get_age_description(age));
end;