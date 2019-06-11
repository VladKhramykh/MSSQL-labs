declare @a char = 'press f',
		@b varchar(6) = 'to pay respect',
		@c datetime = getdate(),
		@d time = sysdatetime(),
		@e int = 54,
		@f smallint = 228,
		@g tinyint = 255,
		@n numeric(12,5) =  14.9;
set @e = 1488;
select @f=322;

select @f f;

print 'f = ' + cast(@f as varchar);
print 'e = ' + cast(@e as char);


use KVO_UNIVER;
declare @count int =  (select SUM(AUDITORIUM.AUDITORIUM_CAPACITY) from AUDITORIUM),
		@auditoriumCount int = 0,
		@avgCapacity numeric(8,1) = 0,
		@audSmallerAVG numeric(8,1) = 0;		
if @count < 200
	begin
		select	@count 'Общая';
	end
else if @count >= 200
	begin
		select	@auditoriumCount = (select count(AUDITORIUM.AUDITORIUM) from AUDITORIUM),
				@avgCapacity = (select AVG(AUDITORIUM.AUDITORIUM_CAPACITY) from AUDITORIUM),
				@audSmallerAVG = (select count(*) from AUDITORIUM where AUDITORIUM_CAPACITY < (select AVG(AUDITORIUM_CAPACITY) from AUDITORIUM));
				
		select	@count 'Общая вместимость',
				@auditoriumCount 'Всего(шт)',
				@avgCapacity 'Средняя вместимость',
				@audSmallerAVG ' < avg',
				cast(@audSmallerAVG/@auditoriumCount*100 as numeric(8,1)) '%';			
	end

print @@RowCount;
print @@Version;
print @@Spid;
print @@Error;
print @@ServerName;
print @@TranCount;
print @@Fetch_Status;
print @@NestLevel;

declare @z numeric(8,2) = 13,
		@t int = 30,
		@x int = 54;
if (@t > @z)
	begin
		set @z = sin(@t)*sin(@t);
	end
else if (@t < @x)
	begin
		set @z = 4*(@t + @x);
	end
else 
	begin 
		set @z = 1 ;
	end; 
print @z;


declare @name varchar(20) = 'Старый Дед Калач',
		@firstName int = 0,
		@secondName int = 0,
		@thirdName int = 0,
		@resultName varchar(20);
set @firstName = PATINDEX('% %', @name);
set @secondName = len(@name) - PATINDEX('% %',REVERSE(@name));

set @resultName = SUBSTRING(@name,0,@firstName) + ' ' + SUBSTRING(@name,@firstName+1,1) + ' ' + SUBSTRING(@name,@secondName+2,1); 
print @resultName;
print @firstName;
print @secondName;

declare @currentMonth int = month(getdate());
select STUDENT.NAME, STUDENT.BDAY from STUDENT where month(STUDENT.BDAY) = @currentMonth;

declare @dayOfWeek int = 7;
select STUDENT.NAME, PROGRESS.PDATE from STUDENT join PROGRESS
on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
where datepart(DW,PROGRESS.PDATE) = @dayOfWeek and PROGRESS.SUBJECT = 'СУБД';


select STUDENT.NAME, PROGRESS.PDATE, datepart(DW,PROGRESS.PDATE) from STUDENT join PROGRESS
on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
where PROGRESS.SUBJECT = 'СУБД';


select case
	when PROGRESS.NOTE between 0 and 4 then 'суперплохо'
	when PROGRESS.NOTE between 4 and 6 then 'сдал и норм'
	when PROGRESS.NOTE between 6 and 8 then 'ну что-то знаешь'
	when PROGRESS.NOTE between 8 and 10 then 'батя'
	end 'что сказал препод',STUDENT.NAME,PROGRESS.NOTE
from STUDENT join PROGRESS
on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT;

create table #tmpTable
(
	id int primary key identity(1,1),
	name nvarchar(50),
	team nvarchar(50)
)
set nocount on;
declare @i int = 0;
while (@i < 10)
	begin
		insert #tmpTable (name,team) values ('s1mple','NaVi');
		if(@i = 4)
			return;
		set @i += 1;
	end

select * from #tmpTable;
drop table #tmpTable;

begin try
	declare @error int = 10/0; 	
end try
begin catch
	print ERROR_NUMBER()
	print ERROR_MESSAGE()
	print ERROR_LINE()
	print ERROR_PROCEDURE()
	print ERROR_SEVERITY()
	print ERROR_STATE()
end catch

