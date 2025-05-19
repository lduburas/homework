drop table if exists pi_iteration cascade;

create table pi_iteration (
  iteration numeric,
  sixteen_degree numeric,
  eight_mult numeric,
  addend numeric
);

insert into pi_iteration values (0, 1, 0, 0);
