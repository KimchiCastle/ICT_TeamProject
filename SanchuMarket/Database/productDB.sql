/*
--실수 했을때 테이블 드랍용
drop table product

---상품테이블

create table product
(
	p_idx		int,				    --상품번호(pk)
	u_idx		int,				    --회원번호(fk)
	c_idx		int,				    --카테고리번호(fk)
	p_name		varchar2(500) not null, --상품명
	p_date		date		  not null, --등록일
	p_price		int			  not null,	--상품가격
	p_condition varchar2(100), 			--상품상태
	p_exp		varchar2(4000),			--상품설명
	p_location	varchar2(2000),			--거래지역
	p_click		int,		   			--조회수
	p_status	varchar2(100)  			--거래상태
)

---------------------- 제약조건 ---------------------

--------기본키(pk) 제약
alter table product
	add constraint pk_product_p_idx primary key(p_idx);

--------외래키(fk) 제약	
--회원테이블
alter table product
	add constraint fk_product_u_idx foreign key(u_idx)
	references user_market(u_idx);

--카테고리 테이블
alter table product
	add constraint fk_product_c_idx foreign key(c_idx)
	references category(c_idx);


---------------------- 샘플데이터 ----------------------
insert into product 
values( (select nvl(max(p_idx)+1,1) from product),
		1,				--회원번호
		1,				--카테고리번호
		'한복팝니다.',  --제목
		sysdate,		--등록일자
		130000,			--가격
		'거의신품',		--상품상태
		'직거래만 합니다.',	--상품설명
		'서울시 마포구',	--거래지역
		10,				--조회수
		'거래가능'		--거래상태
		);

------ 조회용
select * from product

delete from product where p_idx = 1


*/