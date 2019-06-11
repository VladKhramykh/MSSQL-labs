create database KR;

drop database KR;

go

use KR;
create table Table1 
(
	t1 int,
	t2 int
);

create table Table2
(
	t21 int identity(1,1),
	t22 int,
	t23 date
);

insert into Table2(t22, t23) values ((select count(*) from Table1), GETDATE());
select * from Table2;

create table STUDENT
(
	ID int primary key,
	name nvarchar(50),
	Faculty nvarchar(10),
	noteDB int,
	noteJava int,
	noteCS int	 
);

insert into STUDENT (ID,name,Faculty,noteDB,noteJava,noteCS)
		 values (1,'Valera','ิศา',7,8,9),
				(2,'Valera1','หีิ', 6,5,10),
				(3,'Valera2','ิศา', 5,9,9),
				(4,'Valera3','ศÝิ', 9,8,5),
				(5,'Valera4','ิศา', 7,4,10);

select AVG(noteDB) DB, AVG(noteJava) Java, AVG(noteCS) C# from STUDENT where Faculty like ('ิศา');

select *
from STUDENT
where not exists (select t1 from Table1 where Table1.t1 = STUDENT.ID);

select *
from STUDENT
where exists(select t1 from Table1 where Table1.t1 = STUDENT.ID);

create view FIT_view
as select count(*) countO from STUDENT where Faculty like ('ิศา');

select distinct patindex('%aler%',name) from STUDENT;
