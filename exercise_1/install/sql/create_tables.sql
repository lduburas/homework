drop table if exists sw_age_class cascade constraints;

create table sw_age_class (
  age number(3),
  description varchar2(200)
);

insert into sw_age_class values (7, 'infant');
insert into sw_age_class values (18, 'schoolchild');
insert into sw_age_class values (40, 'adult');
insert into sw_age_class values (55, 'in middle-age');
insert into sw_age_class values (NULL, 'aged');

