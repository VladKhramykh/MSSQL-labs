use KVO_UNIVER;

drop view [�������������];
drop view [���-�� ������];
drop view [���������];
drop view [����������_���������];

create view [�������������]
as select TEACHER[���],TEACHER_NAME[��� �������],GENDER[���],PULPIT[��� �������]
from TEACHER;

select * from [�������������];

create view [���-��_������]
as select FACULTY_NAME[���������], count(*)[���-��]
from FACULTY join PULPIT
on FACULTY.FACULTY = PULPIT.FACULTY
group by FACULTY.FACULTY_NAME;

select * from [���-��_������];


create view ���������(���, ��������)
as select AUDITORIUM, AUDITORIUM_NAME
from AUDITORIUM
where AUDITORIUM_TYPE like('��%');
go
select * from ���������;

insert ��������� values('222','222');


create view [����������_���������]
as select AUDITORIUM, AUDITORIUM_NAME
from AUDITORIUM
where AUDITORIUM_TYPE like('��%') with check option;
go
select * from ����������_���������;

insert ����������_��������� values('222-1','222-1');


create view ����������(���, ������������_����������, ���_�������)
as select top 150 SUBJECT,	SUBJECT_NAME, PULPIT
from SUBJECT order by SUBJECT_NAME;

select * from ����������;


alter view [���-��_������] with schemabinding
as select FACULTY_NAME[���������], count(*)[���-��]
from dbo.FACULTY join dbo.PULPIT
on dbo.FACULTY.FACULTY = dbo.PULPIT.FACULTY
group by dbo.FACULTY.FACULTY_NAME;

select * from [���-��_������];