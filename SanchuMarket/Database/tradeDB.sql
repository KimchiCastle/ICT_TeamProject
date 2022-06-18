create table trade
(
  p_idx int,
  seller_idx int,
  buyer_idx int
)

alter table trade
   add constraint pk_trade_p_idx primary key(p_idx);
   
alter table trade
   add constraint fk_trade_seller_idx foreign key(seller_idx)
   references user_market(u_idx);
   
alter table trade
   add constraint fk_trade_buyer_idx foreign key(buyer_idx)
   references user_market(u_idx);

   
   

