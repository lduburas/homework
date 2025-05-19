drop table if exists pi_iteration cascade constraints;

create table pi_iteration (
  iteration number,
  sixteen_degree number,
  eight_mult number,
  addend number
);

insert into pi_iteration values (0, 1, 0, 0);
