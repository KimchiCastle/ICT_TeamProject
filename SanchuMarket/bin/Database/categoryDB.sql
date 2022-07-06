/*
--실수 했을때 테이블 드랍용
drop table category cascade constraints


create table category
(
	c_idx	int,		  --카테고리번호
	c_name	varchar2(100) --카테고리명
)
---------------------- 제약조건 ---------------------

--------기본키(pk) 제약
alter table category
	add constraint pk_category_c_idx primary key(c_idx);



---------------------- 샘플데이터 ----------------------

insert into category values(
	(select nvl(max(c_idx)+1,1) from category) ,
	'남성의류'
);

insert into category values(
	(select nvl(max(c_idx)+1,1) from category) ,
	'여성의류'
);

insert into category values(
	(select nvl(max(c_idx)+1,1) from category) ,
	'도서/문구'
);

insert into category values(
	(select nvl(max(c_idx)+1,1) from category) ,
	'음반/악기'
);

insert into category values(
	(select nvl(max(c_idx)+1,1) from category) ,
	'가전'
);

insert into category values(
	(select nvl(max(c_idx)+1,1) from category) ,
	'뷰티/미용'
);



------ 조회용
select * from category


*/