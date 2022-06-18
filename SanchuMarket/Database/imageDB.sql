<<<<<<< HEAD
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
  
--조회
select * from image
  

  
=======
/*
--실수 했을때 테이블 드랍용
drop table image cascade constraints


create table image
(
	p_idx		int, 			--상품번호
	img1		varchar2(4000), --사진1
	img2		varchar2(4000), --사진2
	img3		varchar2(4000), --사진3
	img4		varchar2(4000), --사진4
	img5		varchar2(4000)  --사진5
);

---------------------- 제약조건 ---------------------

--------기본키(pk) 제약
alter table image
	add constraint pk_image_p_idx primary key(p_idx);





*/
>>>>>>> 810e9086e2d00a49d9f25731658d776e2df5bb4f
