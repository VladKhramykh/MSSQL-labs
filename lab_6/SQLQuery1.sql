use KVO_UNIVER;


	/*task 1*/
select AUDITORIUM.AUDITORIUM, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
from AUDITORIUM inner join AUDITORIUM_TYPE 
on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE; 


	/*task 2*/
select AUDITORIUM.AUDITORIUM, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
from AUDITORIUM inner join AUDITORIUM_TYPE
on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
and AUDITORIUM_TYPE.AUDITORIUM_TYPENAME like '%���������%';


	/*task 3*/
select AUDITORIUM.AUDITORIUM, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
from AUDITORIUM, AUDITORIUM_TYPE
where AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE;

select AUDITORIUM.AUDITORIUM, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
from AUDITORIUM, AUDITORIUM_TYPE
where AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
and AUDITORIUM_TYPE.AUDITORIUM_TYPENAME like '%���������%';


	/*task 4*/
select FACULTY.FACULTY_NAME, PULPIT.PULPIT,PROFESSION.PROFESSION_NAME, PROGRESS.SUBJECT,STUDENT.NAME,PROGRESS.NOTE,
Case
when (PROGRESS.NOTE  = 6) then '�����'
when (PROGRESS.NOTE  = 7) then '����'
when (PROGRESS.NOTE  = 8) then '������' 
else '---'
end as resultText
from STUDENT 	
	inner join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT 
	inner join SUBJECT on SUBJECT.SUBJECT = PROGRESS.SUBJECT
	inner join PULPIT on PULPIT.PULPIT = SUBJECT.PULPIT
	inner join FACULTY on FACULTY.FACULTY = PULPIT.FACULTY
	inner join PROFESSION on PROFESSION.FACULTY = FACULTY.FACULTY
where PROGRESS.NOTE between 6 and 8;


	/*task 5*/
select FACULTY.FACULTY_NAME, PULPIT.PULPIT,PROFESSION.PROFESSION_NAME, PROGRESS.SUBJECT,STUDENT.NAME,PROGRESS.NOTE,
Case
when (PROGRESS.NOTE  = 6) then '�����'
when (PROGRESS.NOTE  = 7) then '����'
when (PROGRESS.NOTE  = 8) then '������' 
else '---'
end as resultText
from STUDENT 	
	inner join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT 
	inner join SUBJECT on SUBJECT.SUBJECT = PROGRESS.SUBJECT
	inner join PULPIT on PULPIT.PULPIT = SUBJECT.PULPIT
	inner join FACULTY on FACULTY.FACULTY = PULPIT.FACULTY
	inner join PROFESSION on PROFESSION.FACULTY = FACULTY.FACULTY
where PROGRESS.NOTE between 6 and 8
order by
(case
	when PROGRESS.NOTE = 6 then 3
	when PROGRESS.NOTE = 7 then 1
	else 2
end)


	/*task 6*/
select PULPIT.PULPIT_NAME, ISNULL(TEACHER.TEACHER_NAME,'***')
from PULPIT left outer join TEACHER
on TEACHER.PULPIT = PULPIT.PULPIT;


	/*task 7*/
select PULPIT.PULPIT_NAME, ISNULL(TEACHER.TEACHER_NAME,'***')
from TEACHER right outer join PULPIT
on TEACHER.PULPIT = PULPIT.PULPIT;


	/*task 8*/
select PULPIT.PULPIT_NAME, ISNULL(TEACHER.TEACHER_NAME,'***')
from PULPIT full outer join TEACHER
on TEACHER.PULPIT = PULPIT.PULPIT;

	/*task 8.1*/
select PULPIT.PULPIT_NAME, ISNULL(TEACHER.TEACHER_NAME,'***')
from PULPIT full outer join TEACHER
on TEACHER.PULPIT = PULPIT.PULPIT
where TEACHER.TEACHER_NAME is null;
	
	/*task 8.2*/
select PULPIT.PULPIT_NAME, ISNULL(TEACHER.TEACHER_NAME,'***')
from PULPIT full outer join TEACHER
on TEACHER.PULPIT = PULPIT.PULPIT
where TEACHER.TEACHER_NAME is not null;
	
	/*task 8.3*/
select PULPIT.PULPIT_NAME, ISNULL(TEACHER.TEACHER_NAME,'***')
from PULPIT full outer join TEACHER
on TEACHER.PULPIT = PULPIT.PULPIT;


	/*task 9*/
select AUDITORIUM.AUDITORIUM, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
from AUDITORIUM cross join AUDITORIUM_TYPE
where AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE;


	/*right outer join �� cross*/
select PULPIT.PULPIT_NAME, ISNULL(TEACHER.TEACHER_NAME,'***')
from PULPIT cross join TEACHER
where TEACHER.PULPIT = PULPIT.PULPIT;

