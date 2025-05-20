create or replace package sw_age as 
  function get_age_description(p_age sw_age_class.age%type) return sw_age_class.description%type;
end sw_age;
/