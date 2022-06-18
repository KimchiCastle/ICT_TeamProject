create table room
(
  r_idx int,
  r_name varchar2(100)
)

--primary key 
alter table room
	add constraint pk_room_r_idx primary key(r_idx)
	
select * from room

	
	
	