/*
--실수 했을때 테이블 드랍용
drop table product cascade constraints

--테이블 데이터 전체삭제
delete from product


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
	p_location	varchar2(500),			--거래지역
	p_click		int,		   			--조회수
	p_status	varchar2(100)  			--거래상태 (거래가능,판매완료)
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

--외래키 삭제	
ALTER TABLE product DROP CONSTRAINT fk_product_u_idx;

--카테고리 테이블
alter table product
	add constraint fk_product_c_idx foreign key(c_idx)
	references category(c_idx);


---------------------- 샘플데이터 ----------------------
insert into product 
values( (select nvl(max(p_idx)+1,1) from product),
		1,				--회원번호
		1,				--카테고리번호
		'한복팝니다.',  --제
		sysdate,		--등록일자
		130000,			--가격
		'거의신품',		--상품상태
		'직거래만 합니다.',	--상품설명
		'서울시 마포구',	--거래지역
		10,				--조회수
		'거래가능'		--거래상태
		);
		
		
insert into product 
values( (select nvl(max(p_idx)+1,1) from product),
		1,				--회원번호
		2,				--카테고리번호
		'여성옷팝니다.',  --제목
		to_date('1970-12-31 12:00:00','yyyy-mm-dd hh24:mi:ss'),		--등록일자
		30000,			--가격
		'중고',		--상품상태
		'직거래만 합니다.',	--상품설명
		'서울시 분당구',	--거래지역
		2,				--조회수
		'거래가능'		--거래상태
		);
insert into product 
values( (select nvl(max(p_idx)+1,1) from product),
		1,				--회원번호
		2,				--카테고리번호
		'여성옷팝니다.',  --제목
		sysdate,		--등록일자
		30000,			--가격
		'중고',		--상품상태
		'직거래만 합니다.',	--상품설명
		'서울시 분당구',	--거래지역
		0,				--조회수
		'거래가능'		--거래상태
		);

------ 조회용
select * from product

update product set p_click=0 where p_idx=5

select p_idx from product when

select 
    p.*,
    floor((sysdate-p_date)*24) as hour,floor(((sysdate-p_date)*24-floor((sysdate-p_date)*24))*60) as minute 
from (select * from product) p

select
	p.* ,
	to_number(floor((sysdate-p_date)*24*60*60)) as p_time
from (select * from product) p order by p_idx desc

select
	p.* ,
	to_number(floor((sysdate-p_date)*24*60*60)) as p_time
from (select * from product) p where u_idx=3 order by p_idx desc

select
	p.* ,
	to_number(floor((sysdate-p_date)*24*60*60)) as p_time
from (select * from product) p where c_idx=3 order by p_idx desc

------------7/6 view생성-----------
create or replace view product_user 
as
select u_name, p_name, p_date, p.p_idx 
from user_market, product p

select * from product_user
drop view product_user

select * from (select * from product_user order by p_idx asc) where ROWNUM  <= 6
-----------------------------------

select * from product 

select count(*) from product where to_char(p_date,'dd') = to_char(sysdate, 'dd')

insert into product values(
(select nvl(max(p_idx),0)+1 from product),
1,
1,
'상품1',
sysdate,
1111,
'중고',
'쌉니다 싸용',
'서울시 중구',
0,
'거래가능'
)

	select p.*,
  	to_number(floor((sysdate-p_date)*24*60*60)) as p_time
  			
  	from(select * from product)	p where
  		
  		p_name like '%합%'
  	
  	order by p_idx desc



	select
		p.* ,
		to_number(floor((sysdate-p_date)*24*60*60)) as p_time
	from (select * from product) p  order by p_idx desc
	
	

	
	
	



--전체상품 페이징 처리용 sql
select * from
	(
		select
			p.* ,
			rank() over(order by p_idx desc) no,
			to_number(floor((sysdate-p_date)*24*60*60)) as p_time
		from (select * from product) p 
	)
where no between 1 and 4

--상품검색 페이징 처리용 sql
select * from
	(
		select 
			p.*,
			rank() over(order by p_name like '%합%' desc) no,
		  	to_number(floor((sysdate-p_date)*24*60*60)) as p_time	
	  	from(select * from product)	p 
	) 
 where p_name like '%합%' and no between 1 and 4
  	
select p_idx, p_name from product where p_name like '%' || '합' || '%' 


select 
	select * from 
	(
		select p.*,
		rank() over( order by p_idx  )
		from(select * from product) p
	)
where p_name like '%' || '합' || '%' 

select * from 
	(
		select p.*,
		rank() over( order by p_idx  ) no
		from(select * from product
		where p_name like '%합%'
		) p
	)
where no between 1 and 10




select * from 
	(
		select p.*,
		to_number(floor((sysdate-p_date)*24*60*60)) as p_time,
		rank() over( order by p_idx  ) no
		from(select * from product
		where p_name like '%합%'
		) p
	)
where no between 1 and 10










   select rank() over
   (
     select * from product where p_name like '%' || '합' || '%' 
   ) as c from product 
   where c between 1 and 5 
   
   원영아 쿼리 수행 순서에서 c먹게끔 짜도 수행이 안되네...
   select * 
   from
   (
	   select rank() over
	   (
	     select * from product where p_name like '%' || '합' || '%'
	     
	   )c from product 
  
   )
   where c between 1 and 5  


	--카테고리 
	select
		p.* ,
		to_number(floor((sysdate-p_date)*24*60*60)) as p_time
	from (select * from product) p where c_idx=1 order by p_idx desc
   
   
   
   --가격 검색
	select * from
	(
		select p.*,
	  	to_number(floor((sysdate-p_date)*24*60*60)) as p_time,
	  	rank() over( order by p_idx  ) no
	  	from(select * from product
	  	where p_price between 1000 and 10000
	  	
	  	)p
	)
	where no between 1 and 10
	 
	 
	 
	 
  

	select * from 
		(
			select p.*,
			to_number(floor((sysdate-p_date)*24*60*60)) as p_time,
			rank() over( order by p_idx  ) no
			from(select * from product
			where p_name like '%합%'
			) p
		)
	where no between 1 and 10
	
	
select * from
(	
	select
		p.* ,
		to_number(floor((sysdate-p_date)*24*60*60)) as p_time,
		rank() over( order by p_idx  ) no
		from (select * from product
		where c_idx=1
		) p 
)	
where no between 1 and 4
	
	
	

select * from
(
	select p.*,
  	to_number(floor((sysdate-p_date)*24*60*60)) as p_time
  			
  	from(select * from product)	p 
  	
  	where p_price between 10000 and 50000
  	
  	and p_name like '%여성%' 
  	
  	
  	
  	order by p_idx desc
)

select nvl(count(*),0) from product where p_price between 10000 and 50000 and p_name like '%%' 



select * from
	(
		select
			p.* ,
			rank() over(order by p_idx desc) no,
			to_number(floor((sysdate-p_date)*24*60*60)) as p_time
		from (select * from product) p 
	)
where no between 1 and 5




select * from
select nvl(count(*),0) from product



		
		
		
		
		

select nvl(count(*),0) from product where c_idx=1

	select nvl(count(*),0) as no from product where p_price between 100 and 10000000 and  p_name like '%합%'



--@@@@@@@@@@@@@@@@@@@지우기@@@@@@@@@@@@@@@@@@@@@@@
delete from product where p_idx between 1 and 10




*/