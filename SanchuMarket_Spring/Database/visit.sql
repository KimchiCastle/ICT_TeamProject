create table visit
(
  v_idx int,
  v_count int,
  v_date date
)

alter table visit 
  add constraint pk_v_idx_visit primary key(v_idx);

  select * from visit
insert into visit values(1,1,sysdate);
select * from visit where to_char(v_date,'dd') = to_char(sysdate, 'dd')

  update visit set v_count=3 where to_char(v_date,'dd') = to_char(sysdate, 'dd')
  
  select nvl(max(v_count),0)as v_count from visit where to_char(v_date,'dd') = to_char(sysdate, 'dd')