use KVO_UNIVER;

select * from FACULTY;

select TEACHER, PULPIT from TEACHER;

select TEACHER_NAME from TEACHER where PULPIT = '����';

select TEACHER_NAME from TEACHER where PULPIT = '����' or PULPIT = '������';

select TEACHER_NAME from TEACHER where GENDER = '�' and PULPIT = '����';

select TEACHER_NAME[��� �������������] from TEACHER where GENDER <> '�' and PULPIT <> '����';

select distinct PULPIT from TEACHER;

select AUDITORIUM_NAME,AUDITORIUM_CAPACITY from AUDITORIUM order by AUDITORIUM_CAPACITY;

select distinct top(5) AUDITORIUM_TYPE, AUDITORIUM_CAPACITY from AUDITORIUM order by AUDITORIUM_CAPACITY desc;

select distinct SUBJECT from PROGRESS where NOTE  between 8 and 10;

select distinct SUBJECT from SUBJECT where PULPIT in ('�����', '������', '��');

select PROFESSION_NAME,QUALIFICATION from PROFESSION where QUALIFICATION like '%�����%';

create table #tmpSTUDENTS
(
	��� nvarchar(150),
	����_�������� date
)
insert into #tmpSTUDENTS (���, ����_��������) select NAME, BDAY from STUDENT;
select * from #tmpSTUDENTS;	
drop table #tmpSTUDENTS;

select AVG(NOTE) from PROGRESS where NOTE >= 4;
