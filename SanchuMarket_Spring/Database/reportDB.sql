
create sequence seq_report_idx

create table report
(
	re_idx			int,	-- 일련번호
	u_idx 			int,	-- 회원번호
	re_add_cnt		int,	-- 광고
	re_fake_cnt,	int,	-- 상품 부적절(가품/잘못된 상품)
	re_inhibit_cnt	int,	-- 거래금지상품(담배/주류/음란물/마약등..)
	re_scam_cnt		int,	-- 사기(또는 사기치려는 의도)
	re_score		int
)

------ 제약조건
alter table report
	add constraint pk_report_idx primary key(re_idx);