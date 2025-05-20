drop table if exists sw_age_class cascade constraints;

create table sw_age_class (
  age number(3),
  description varchar2(200)
);

insert into sw_age_class values (7, 'You are infant');
insert into sw_age_class values (18, 'You are schoolchild');
insert into sw_age_class values (40, 'You are adult');
insert into sw_age_class values (55, 'You are in middle-age');
insert into sw_age_class values (NULL, 'You are aged');

