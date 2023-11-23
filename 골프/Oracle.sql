create table tbl_teacher_202201 (
			teacher_code char(3) primary key,
			teacher_name varchar2(15),
			class_name varchar2(20),
			tuition number(8),
			teach_resist_date varchar2(8)
);
drop table tbl_teacher_202201

insert into TBL_TEACHER_202201 values('100', '���ʱ�', '�ʱ޹�', 100000, '20220101');
insert into TBL_TEACHER_202201 values('200', '���߱�', '�߱޹�', 200000, '20220102');
insert into TBL_TEACHER_202201 values('300', '�ڰ��', '��޹�', 300000, '20220103');
insert into TBL_TEACHER_202201 values('400', '����ȭ', '��ȭ��', 400000, '20220104');

create table tbl_member_202201 (
			c_no char(5) primary key,
			c_name varchar2(15),
			phone varchar2(11),
			address varchar2(50),
			grade varchar2(6)
);

insert into tbl_member_202201 values ('10001', 'ȫ�浿', '01011112222', '����� ������', '�Ϲ�');
insert into tbl_member_202201 values ('10002', '�����', '01022223333', '������ �д籸', '�Ϲ�');
insert into tbl_member_202201 values ('10003', '�Ӳ���', '01033334444', '������ ������', '�Ϲ�');
insert into tbl_member_202201 values ('20001', '������', '01044445555', '�λ�� ����', 'VIP');
insert into tbl_member_202201 values ('20002', '�̸���', '01055556666', '�뱸�� �ϱ�', 'VIP');
select * from tbl_member_202201;

create table tbl_class_202201 (
			resist_month varchar2(20),
			c_no char(5),
			class_area varchar2(30),
			tuition number(8),
			teacher_code char(3),
			primary key(resist_month, c_no)
);
drop table tbl_class_202201;
insert into TBL_CLASS_202201 values('202203', '10001', '���ﺻ��', 100000, '100');
insert into TBL_CLASS_202201 values('202203', '10002', '��������', 100000, '100');
insert into TBL_CLASS_202201 values('202203', '10003', '��������', 200000, '200');
insert into TBL_CLASS_202201 values('202203', '20001', '�λ꺻��', 150000, '300');
insert into TBL_CLASS_202201 values('202203', '20002', '�뱸����', 200000, '400');

select * from TBL_CLASS_202201;

select teacher_code, teacher_name, class_name, '\ '||  TO_CHAR(tuition, 'fm999,999,999,999') as class_price, 
substr(teach_resist_date, 1, 4) || '�� ' || 
substr(teach_resist_date, 5, 2) || '�� ' || 
substr(teach_resist_date, 7, 2) || '��' as teach_resist_date
from tbl_teacher_202201

select substr(tc.resist_month,1, 4) || '��' || substr(tc.resist_month, 5, 2) || '�� ' as resist_month, 
tm.c_no, tm.c_name, tt.class_name, tc.class_area, TO_CHAR(tc.tuition, 'fm999,999,999,999'), tm.grade
from tbl_member_202201 tm, tbl_class_202201 tc, tbl_teacher_202201 tt
where tm.c_no = tc.c_no and tt.teacher_code = tc.teacher_code

select tt.teacher_code, tt.class_name, tt.teacher_name, TO_CHAR(sum(tc.tuition), 'fm999,999,999,999')
from tbl_teacher_202201 tt, tbl_class_202201 tc
where tt.teacher_code = tc.teacher_code
group by tt.teacher_code, tt.class_name, tt.teacher_name
order by teacher_code