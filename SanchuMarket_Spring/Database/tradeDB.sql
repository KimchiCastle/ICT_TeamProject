
/*
--실수 했을때 테이블 드랍용
drop table trade cascade constraints

/* 
거래현황 테이블인데 본래 계획했던건 int였으나, 
가시성이 떨어져서 회원아이디로 변경
*/  

create table trade
(
	p_idx		int,	--상품정보
	seller		varchar2(100),	--판매자
	buyer		varchar2(100),	--구매자
	t_status	varchar2(100),	--거래상태
	t_date  date
)

---------------------- 제약조건 ---------------------

--------기본키(pk) 제약
alter table trade
	add constraint pk_trade_p_idx primary key(p_idx);
	
	



---최근 6개 거래량
select * from (select * from product order by p_idx desc) where ROWNUM  <= 6

select * from trade

select * from ( select * from trade where t_status = '판매완료' order by t_date )	where ROWNUM <= 6



*/

