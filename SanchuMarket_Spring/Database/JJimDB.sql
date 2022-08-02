/*
--실수 했을때 테이블 드랍용
drop table JJim cascade constraints

create table jjim
(
	j_idx	int, 	 --찜관리번호(pk)
	p_idx	int,	 --상품번호(fk)
	u_idx	int		 --회원아이디(fk)
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

--회원테이블
alter table jjim
	add constraint fk_jjim_u_idx foreign key(u_idx)
	references user_market(u_idx);

select * from jjim where u_idx=1
insert into jjim values( 1,1,1)

select count(*) count from jjim where p_idx = 1

select * from jjim where u_idx=3 and p_idx=4

delete from jjim where p_idx=2 and u_idx=3


*/



