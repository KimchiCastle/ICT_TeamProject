
/*
--실수 했을때 테이블 드랍용
drop table image cascade constraints

--이미지 테이블 데이터 전체삭제 (실제 파일은 삭제 안됨!!)
delete from image

create sequence image_idx
--시퀀스 삭제
drop sequence image_idx


create table image
(
	i_idx		int,
	p_idx		int, 			--상품번호
	imagedata	varchar2(4000)	--사진
);

---------------------- 제약조건 ---------------------

--------기본키(pk) 제약
alter table image
	add constraint pk_image_i_idx primary key(i_idx);





select * from image order by i_idx
select p_idx, sumimage from image 
select * from product

select * from (select * from image where p_idx=3  order by i_idx) where ROWNUM  = 1


*/

