create or replace package body sw_age as
  function get_age_description(p_age sw_age_class.age%type) return sw_age_class.description%type
  is
    l_description sw_age_class.description%type;
  begin
    select 
      ac.description
    into l_description
    from
      sw_age_class ac
    where
      ac.age > p_age or ac.age is NULL
    order by ac.age asc
    fetch first 1 rows only;

    return 'You are ' || l_description;
  end get_age_description;
end sw_age;
/