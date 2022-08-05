
--잘못했을경우 테이블 드랍용
drop table report cascade constraints


--1. 신고 사유 기록용 테이블(건수마다 insert)
create table report
(
	r_idx			int,	-- 일련번호
	u_idx_reported	int,	-- 신고 당한 회원
	u_idx_reporting int,    -- 신고한 회원
	r_reason varchar2(100),	-- 신고 사유
	r_date			date   -- 신고 날짜   
)

--신고 사유 체크 제약
alter table report
add constraint ch_report_r_reason 
check( r_reason in ('re_add_cnt','re_fake_cnt','re_inhibit_cnt','re_scam_cnt'))

/*re_add_cnt		int,	-- 광고
	re_fake_cnt 	int,	-- 상품 부적절(가품/잘못된 상품)
	re_inhibit_cnt	int,	-- 거래금지상품(담배/주류/음란물/마약등..)
	re_scam_cnt		int,	-- 사기(또는 사기치려는 의도)*/

select count(*) from report where u_idx_reported = 2 and  u_idx_reporting = 9

select 
 		to_char(r_date,'yyyy-mm-dd hh24:mi:ss')r_date,
 		u_idx_reported, u_idx_reporting,
 		(select s)
from 
		(
			select * from report order by r_date
		)
where  rownum <= 8 
		
    select 
        r_idx,
 		to_char(r_date,'yyyy-mm-dd hh24:mi:ss')r_date,
 		u_idx_reported, u_idx_reporting
		from (select * from report order by r_date)
		where rownum <= 8 

  select *, count(u_idx_reported)
	  from report 
	  group by u_idx_reported 
	  where u_i
	  dx_reported = 2
	  
	  select 
	    r_idx,
 		to_char(r_date,'yyyy-mm-dd hh24:mi:ss') r_date,
 		u_idx_reported, 
 		u_idx_reporting
		from (select * from report order by r_date)
		where r_idx=1
		
	 select 
	    r_idx,
 		to_char(r_date,'yyyy-mm-dd hh24:mi:ss') r_date,
 		u_idx_reported, 
 		u_idx_reporting,
 		r_reason
		from (select * from report order by r_date)
		where r_idx = 3
 
select * from report
