/*
--실수 했을때 테이블 드랍용
drop table user_market cascade constraints

--회원 테이블 생성, user는 예약어라 사용불가. user_market으로 대체

create table user_market
(
	u_idx		int,					 -- 회원번호(pk)
	u_id		varchar2(100)  not null, -- 아이디
	u_pwd		varchar2(100)  not null, -- 비밀번호
	u_name		varchar2(100)  not null, -- 이름
	u_nickname	varchar2(100)  not null, -- 닉네임
	u_birth		varchar2(100)  not null, -- 생년월일
	u_addr		varchar2(2000) not null, -- 회원주소
	u_regdate	date		   not null, -- 가입일자
	u_like		int,					 -- 평점
	u_profile	varchar2(2000),			 -- 자기소개
	u_photo		varchar2(2000),			 -- 회원사진
	u_tel		varchar2(100)  not null, -- 전화번호
	u_mail		varchar2(100)  not null, -- 이메일
	u_grade		varchar2(100)  default '일반회원', -- 회원등급
	u_ip		varchar2(100),			 -- ip
	postcode 	varchar2(50),			 -- 우편번호
	u_status 	varchar2(100),			 -- 회원상태
	u_likecount int					     -- 회원추천카운트
)	

---------------------- 제약조건 ---------------------

--------기본키(pk) 제약
alter table user_market
	add constraint pk_user_maket_u_idx primary key(u_idx);

--------유니크 제약--------
--아이디
alter table user_market
	add constraint uq_user_market_u_id unique(u_id);

--닉네임
alter table user_market
	add constraint uq_user_market_u_nickname unique(u_nickname);
	
--이메일
alter table user_market
	add constraint uq_user_market_u_mail unique(u_mail);	


--------check 제약--------
alter table user_market
	add constraint ck_user_market_u_grade 
	check( u_grade in( '일반회원','사업자','관리자' ) )
	
--------check 제약2 (7/6 수정)-------
alter table user_market
    add constraint ck_user_market_u_status
    check( u_status in('활동', '탈퇴'))	
    
---check제약 조건명 수정---	
ALTER TABLE user_market 
   RENAME CONSTRAINT ck_user_market_u_garde TO
                     ck_user_market_u_grade;
	
	
-----------반드시 할것우편번호 column추가-------------

alter table user_market add postcode varchar2(50); 
alter table user_market add	u_ip varchar2(100)

-----------7/4 찜 수 + 활동상태 column추가----------
alter table user_market add u_status varchar2(100); 
alter table user_market add	u_listcount int;

------------7/6 column명 수정----------------------
alter table user_market rename column u_listcount to u_likecount

---------------------- 샘플데이터 ----------------------

  /* 시퀀스 쓰지않고, 1씩증가 하는 쿼리문 사용 */
insert into user_market 
values( (select nvl(max(u_idx)+1,1) from user_market),		  
		'hong123',    	 	  --아이디
		'1234',	    		  --비번
		'홍길동',	    	  --이름
		'동에번쩍',   		  --닉네임
		'1994-06-17', 		  --생년월일
		'서울시 관악구 신림동', --주소
		sysdate,			  --가입일자
		5,					  --평점
		'방가방가~',		  --자기소개
		null,				  --사진
		'010-1234-5678',	  --전화번호
		'hongkill@gmail.com', --메일
		'일반회원',		  --회원등급
		'111-111-111',   --ip
		'25231'           --postcode
		);


insert into user_market 
values( (select nvl(max(u_idx)+1,1) from user_market),		  
		'admin',    	 	  --아이디
		'1234',	    		  --비번
		'김관리자',	    	  --이름
		'관리자',   		  --닉네임
		'1994-06-17', 		  --생년월일
		'서울시 관악구 신림동', --주소
		sysdate,			  --가입일자
		5,					  --평점
		'관리자 아이디',	  --자기소개
		null,				  --사진
		'010-1234-5678',	  --전화번호
		'admin123@gmail.com', --메일
		'일반회원',			  --회원등급
		'111-111-111',   --ip
		'23231'           --postcode
		);

insert into user_market 
values( (select nvl(max(u_idx)+1,1) from user_market),		  
		'haha',   	 	 	  --아이디
		'1234',	    		  --비번
		'김하하',	    	  --이름
		'하하',		   		  --닉네임
		'1993-06-18', 		  --생년월일
		'서울시 마포구',	  --주소
		sysdate,			  --가입일자
		0,					  --평점
		'안녕난하하야',		  --자기소개
		null,				  --사진
		'010-4567-8901',	  --전화번호
		'haha12@naver.com',   --메일
		'일반회원'	,		  --회원등급
		'111-111-111' ,  --ip
		'25251'           --postcode
		
		);

---조회용
select * from user_market;

select count(*) from user_market where u_id='hong123' and u_mail='hongkill@gmail.com'


*/

