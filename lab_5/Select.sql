use KVO_UNIVER;

select * from FACULTY;

select TEACHER, PULPIT from TEACHER;

select TEACHER_NAME from TEACHER where PULPIT = 'ИСиТ';

select TEACHER_NAME from TEACHER where PULPIT = 'ИСиТ' or PULPIT = 'ПОиСОИ';

select TEACHER_NAME from TEACHER where GENDER = 'ж' and PULPIT = 'ИСиТ';

select TEACHER_NAME[Имя преподавателя] from TEACHER where GENDER <> 'ж' and PULPIT <> 'ИСиТ';

select distinct PULPIT from TEACHER;

select AUDITORIUM_NAME,AUDITORIUM_CAPACITY from AUDITORIUM order by AUDITORIUM_CAPACITY;

select distinct top(5) AUDITORIUM_TYPE, AUDITORIUM_CAPACITY from AUDITORIUM order by AUDITORIUM_CAPACITY desc;

select distinct SUBJECT from PROGRESS where NOTE  between 8 and 10;

select distinct SUBJECT from SUBJECT where PULPIT in ('ЛЗиДВ', 'ПОиСОИ', 'ОВ');

select PROFESSION_NAME,QUALIFICATION from PROFESSION where QUALIFICATION like '%химик%';

create table #tmpSTUDENTS
(
	ФИО nvarchar(150),
	Дата_рождения date
)
insert into #tmpSTUDENTS (ФИО, Дата_рождения) select NAME, BDAY from STUDENT;
select * from #tmpSTUDENTS;	
drop table #tmpSTUDENTS;

select AVG(NOTE) from PROGRESS where NOTE >= 4;
