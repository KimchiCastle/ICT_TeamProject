/*
--�Ǽ� ������ ���̺� �����
drop table category


create table category
(
	c_idx	int,		  --ī�װ���ȣ
	c_name	varchar2(100) --ī�װ���
)
---------------------- �������� ---------------------

--------�⺻Ű(pk) ����
alter table category
	add constraint pk_category_c_idx primary key(c_idx);



---------------------- ���õ����� ----------------------

insert into category values(
	(select nvl(max(c_idx)+1,1) from category) ,
	'�����Ƿ�'
);

insert into category values(
	(select nvl(max(c_idx)+1,1) from category) ,
	'�����Ƿ�'
);

insert into category values(
	(select nvl(max(c_idx)+1,1) from category) ,
	'����/����'
);

insert into category values(
	(select nvl(max(c_idx)+1,1) from category) ,
	'����/�Ǳ�'
);

insert into category values(
	(select nvl(max(c_idx)+1,1) from category) ,
	'����'
);

insert into category values(
	(select COALESCE(max(c_idx)+1,1) from category) ,
	'��Ƽ/�̿�'
);



------ ��ȸ��
select * from category


*/