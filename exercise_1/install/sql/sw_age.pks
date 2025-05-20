create or replace package sw_age as 
  function get_age_description(p_age age_class.age%type) return age_class.description%type;
end sw_age;
/