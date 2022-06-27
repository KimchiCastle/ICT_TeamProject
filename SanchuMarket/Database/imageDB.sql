
/*
--실수 했을때 테이블 드랍용
drop table image cascade constraints


create table image
(
	
	p_idx		int, 			--상품번호
	sumimage	varchar2(4000),	--썸네일 사진
	imageFile1	varchar2(4000), --사진1
	imageFile2	varchar2(4000), --사진2
	imageFile3	varchar2(4000), --사진3
	imageFile4	varchar2(4000), --사진4
	imageFile5	varchar2(4000)  --사진5
);

---------------------- 제약조건 ---------------------

--------기본키(pk) 제약
alter table image
	add constraint pk_image_p_idx primary key(p_idx);


select * from image


insert into product 
values(
select max(p_idx) from product,
cat123.gif,
wow123.jpg

)





*/

