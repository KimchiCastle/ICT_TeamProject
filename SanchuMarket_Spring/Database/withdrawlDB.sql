create table withdrawl
(
  u_idx int,
  w_date date
)

select * from withdrawl

alter table withdrawl 
   add constraint fk_withdrawl_u_idx foreign key(u_idx)
      references user_market(u_idx)
      
      	select to_char(w_date,'mm') as u_month, count(*) as u_tot
	from withdrawl
	where to_char(w_date,'yy')=to_char(sysdate,'yy') 
	group by to_char(w_date,'mm') order by to_char(w_date,'mm') asc
	
	
