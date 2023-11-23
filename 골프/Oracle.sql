create table tbl_teacher_202201 (
			teacher_code char(3) primary key,
			teacher_name varchar2(15),
			class_name varchar2(20),
			tuition number(8),
			teach_resist_date varchar2(8)
);
drop table tbl_teacher_202201

insert into TBL_TEACHER_202201 values('100', '이초급', '초급반', 100000, '20220101');
insert into TBL_TEACHER_202201 values('200', '김중급', '중급반', 200000, '20220102');
insert into TBL_TEACHER_202201 values('300', '박고급', '고급반', 300000, '20220103');
insert into TBL_TEACHER_202201 values('400', '정심화', '심화반', 400000, '20220104');

create table tbl_member_202201 (
			c_no char(5) primary key,
			c_name varchar2(15),
			phone varchar2(11),
			address varchar2(50),
			grade varchar2(6)
);

insert into tbl_member_202201 values ('10001', '홍길동', '01011112222', '서울시 강남구', '일반');
insert into tbl_member_202201 values ('10002', '장발장', '01022223333', '성남시 분당구', '일반');
insert into tbl_member_202201 values ('10003', '임꺽정', '01033334444', '대전시 유성구', '일반');
insert into tbl_member_202201 values ('20001', '성춘향', '01044445555', '부산시 서구', 'VIP');
insert into tbl_member_202201 values ('20002', '이몽룡', '01055556666', '대구시 북구', 'VIP');
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
insert into TBL_CLASS_202201 values('202203', '10001', '서울본원', 100000, '100');
insert into TBL_CLASS_202201 values('202203', '10002', '성남본원', 100000, '100');
insert into TBL_CLASS_202201 values('202203', '10003', '대전본원', 200000, '200');
insert into TBL_CLASS_202201 values('202203', '20001', '부산본원', 150000, '300');
insert into TBL_CLASS_202201 values('202203', '20002', '대구본원', 200000, '400');

select * from TBL_CLASS_202201;

select teacher_code, teacher_name, class_name, '\ '||  TO_CHAR(tuition, 'fm999,999,999,999') as class_price, 
substr(teach_resist_date, 1, 4) || '년 ' || 
substr(teach_resist_date, 5, 2) || '월 ' || 
substr(teach_resist_date, 7, 2) || '일' as teach_resist_date
from tbl_teacher_202201

select substr(tc.resist_month,1, 4) || '년' || substr(tc.resist_month, 5, 2) || '월 ' as resist_month, 
tm.c_no, tm.c_name, tt.class_name, tc.class_area, TO_CHAR(tc.tuition, 'fm999,999,999,999'), tm.grade
from tbl_member_202201 tm, tbl_class_202201 tc, tbl_teacher_202201 tt
where tm.c_no = tc.c_no and tt.teacher_code = tc.teacher_code

select tt.teacher_code, tt.class_name, tt.teacher_name, TO_CHAR(sum(tc.tuition), 'fm999,999,999,999')
from tbl_teacher_202201 tt, tbl_class_202201 tc
where tt.teacher_code = tc.teacher_code
group by tt.teacher_code, tt.class_name, tt.teacher_name
order by teacher_code