create table withdrawl
(
  u_idx int,
  w_date date
)

alter table withdrawl 
   add constraint fk_withdrawl_u_idx foreign key(u_idx)
      references user_market(u_idx)