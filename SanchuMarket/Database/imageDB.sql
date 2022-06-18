create table image
(
 p_idx int,
 img1 varchar2(4000),
 img2 varchar2(4000),
 img3 varchar2(4000),
 img4 varchar2(4000),
 img5 varchar2(4000)
)

--fk
alter table image 
  add constraint fk_image_p_idx foreign key(p_idx)
  references product(p_idx);
  
--Á¶È¸
select * from image
  

  