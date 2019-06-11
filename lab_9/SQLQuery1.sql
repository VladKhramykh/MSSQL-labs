use KVO_UNIVER;

drop view [Преподаватель];
drop view [Кол-во кафедр];
drop view [Аудитории];
drop view [Лекционные_аудитории];

create view [Преподаватель]
as select TEACHER[код],TEACHER_NAME[имя препода],GENDER[пол],PULPIT[код кафедры]
from TEACHER;

select * from [Преподаватель];

create view [Кол-во_кафедр]
as select FACULTY_NAME[факультет], count(*)[Кол-во]
from FACULTY join PULPIT
on FACULTY.FACULTY = PULPIT.FACULTY
group by FACULTY.FACULTY_NAME;

select * from [Кол-во_кафедр];


create view Аудитории(КОД, НАЗВАНИЕ)
as select AUDITORIUM, AUDITORIUM_NAME
from AUDITORIUM
where AUDITORIUM_TYPE like('лк%');
go
select * from Аудитории;

insert Аудитории values('222','222');


create view [Лекционные_аудитории]
as select AUDITORIUM, AUDITORIUM_NAME
from AUDITORIUM
where AUDITORIUM_TYPE like('лк%') with check option;
go
select * from Лекционные_аудитории;

insert Лекционные_аудитории values('222-1','222-1');


create view Дисциплины(Код, Наименование_дисциплины, Код_кафедры)
as select top 150 SUBJECT,	SUBJECT_NAME, PULPIT
from SUBJECT order by SUBJECT_NAME;

select * from Дисциплины;


alter view [Кол-во_кафедр] with schemabinding
as select FACULTY_NAME[факультет], count(*)[Кол-во]
from dbo.FACULTY join dbo.PULPIT
on dbo.FACULTY.FACULTY = dbo.PULPIT.FACULTY
group by dbo.FACULTY.FACULTY_NAME;

select * from [Кол-во_кафедр];