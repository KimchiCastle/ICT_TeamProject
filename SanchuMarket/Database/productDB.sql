/*
--�Ǽ� ������ ���̺� �����
drop table product

---��ǰ���̺�

create table product
(
	p_idx		int,				    --��ǰ��ȣ(pk)
	u_idx		int,				    --ȸ����ȣ(fk)
	c_idx		int,				    --ī�װ���ȣ(fk)
	p_name		varchar2(500) not null, --��ǰ��
	p_date		date		  not null, --�����
	p_price		int			  not null,	--��ǰ����
	p_condition varchar2(100), 			--��ǰ����
	p_exp		varchar2(4000),			--��ǰ����
	p_location	varchar2(2000),			--�ŷ�����
	p_click		int,		   			--��ȸ��
	p_status	varchar2(100)  			--�ŷ�����
)

---------------------- �������� ---------------------

--------�⺻Ű(pk) ����
alter table product
	add constraint pk_product_p_idx primary key(p_idx);

--------�ܷ�Ű(fk) ����	
--ȸ�����̺�
alter table product
	add constraint fk_product_u_idx foreign key(u_idx)
	references user_market(u_idx);

--ī�װ� ���̺�
alter table product
	add constraint fk_product_c_idx foreign key(c_idx)
	references category(c_idx);


---------------------- ���õ����� ----------------------
insert into product 
values( (select nvl(max(p_idx)+1,1) from product),
		1,				--ȸ����ȣ
		1,				--ī�װ���ȣ
		'�Ѻ��˴ϴ�.',  --����
		sysdate,		--�������
		130000,			--����
		'���ǽ�ǰ',		--��ǰ����
		'���ŷ��� �մϴ�.',	--��ǰ����
		'����� ������',	--�ŷ�����
		10,				--��ȸ��
		'�ŷ�����'		--�ŷ�����
		);

------ ��ȸ��
select * from product

delete from product where p_idx = 1


*/