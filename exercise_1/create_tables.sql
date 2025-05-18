drop table if exists age_class cascade;

create table age_class (
  age numeric(3),
  description varchar(200)
);

insert into age_class values (7, 'You are infant');
insert into age_class values (18, 'You are schoolchild');
insert into age_class values (40, 'You are adult');
insert into age_class values (55, 'You are in middle-age');
insert into age_class values (NULL, 'You are aged');

