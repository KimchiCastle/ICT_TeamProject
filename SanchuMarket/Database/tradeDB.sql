
/*
--실수 했을때 테이블 드랍용
drop table trade cascade constraints

/* 
거래현황 테이블인데 본래 계획했던건 int였으나, 
가시성이 떨어져서 회원아이디로 변경
*/  

create table trade
(
	p_idx	int,	--상품정보
	seller	varchar2(100),	--판매자
	buyer	varchar2(100)	--구매자
)

---------------------- 제약조건 ---------------------

--------기본키(pk) 제약
alter table trade
	add constraint pk_trade_p_idx primary key(p_idx);



-----------------7/5 거래완료조회용 날짜column추가--------------------
alter table trade add t_date date;



insert into trade values(1,'hong123','haha');






*/

