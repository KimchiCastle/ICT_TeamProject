create table chat
(
  ch_idx int,
  u_idx int,
  r_idx int,
  ch_date date
)
--column¼öÁ¤
alter table chat add ch_message varchar2(1000);

--pk
alter table chat
   add constraint pk_chat_ch_idx primary key(ch_idx);
   
--fk   
alter table chat
   add constraint fk_chat_u_idx foreign key(u_idx)
   references user_market(u_idx);
   
--fk   
alter table chat
   add constraint fk_chat_r_idx foreign key(r_idx)
   references room(r_idx);
   
select * from chat   
   

