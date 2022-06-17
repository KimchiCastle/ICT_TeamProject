/*
--실수 했을때 테이블 드랍용
drop table JJim cascade constraints

create table jjim
(
	j_idx	int,		   --찜관리번호(pk)
	p_idx	int,		   --상품번호(fk)
	u_id	varchar2(100)  --회원아이디
)


---------------------- 제약조건 ---------------------

--------기본키(pk) 제약
alter table jjim
	add constraint pk_jjim_j_idx primary key(j_idx);

--------외래키(fk) 제약	
--상품테이블
alter table jjim
	add constraint fk_jjim_p_idx foreign key(p_idx)
	references product(p_idx);



*/