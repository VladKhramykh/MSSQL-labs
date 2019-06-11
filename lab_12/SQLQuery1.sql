use KVO_UNIVER;

--Если убрать локал, то он по дефолту станет глобальным и будет работать во всех пакетах. чтобы его освободить нужно использовать deallocate(выше)
--deallocate curDiscipline;
declare @dis nvarchar(10), @t nvarchar(300)='';
declare curDiscipline cursor local for select SUBJECT from SUBJECT where PULPIT = 'ИСиТ';
open curDiscipline;
fetch curDiscipline into @dis;
while (@@FETCH_STATUS = 0)
begin
	set @t = RTRIM(@dis) + ',' + @t;
	fetch curDiscipline into @dis;
end
print @t;
close curDiscipline;



--если здесь поменять static на dynamic, то результирующий набор будет будет динамически изменяться вмессте с изменениями в таблице
--если static курсор, то результирующий набор будт неизменным (какая табл была при создании курсора, такой и останется рез набор)   
declare @a nvarchar(10), @at nvarchar(10), @c int, @count int = 0;
delete AUDITORIUM where AUDITORIUM = '777-2'; 
declare aud cursor local static for select AUDITORIUM.AUDITORIUM, AUDITORIUM.AUDITORIUM_TYPE, AUDITORIUM.AUDITORIUM_CAPACITY from AUDITORIUM;
open aud;
print 'count of lines(cursor): '+	cast(@@cursor_rows as nvarchar(5));
insert into AUDITORIUM(AUDITORIUM,AUDITORIUM_TYPE,AUDITORIUM_CAPACITY,AUDITORIUM_NAME)
	values ('777-2','ЛК',120,'777-2');
fetch aud into @a,@at,@c;
while (@@FETCH_STATUS = 0)
begin
	set @count += 1;
	fetch aud into @a,@at,@c;
end
print 'count of lines after insert: ' + cast (@count as nvarchar(5));
close aud;




declare @aud nvarchar(10), @audt nvarchar(10), @cap int, @counter int = 0;
declare audcursor cursor local scroll for select AUDITORIUM.AUDITORIUM, AUDITORIUM.AUDITORIUM_TYPE, AUDITORIUM.AUDITORIUM_CAPACITY from AUDITORIUM;
open audcursor;
fetch first from  audcursor into @aud,@audt,@cap; 
print 'first: ' + @aud + ' - ' + @audt + ' - ' + cast(@cap as nvarchar);
fetch next from audcursor into @aud,@audt,@cap;
print 'next: ' + @aud + ' - ' + @audt + ' - ' + cast(@cap as nvarchar);
fetch last from  audcursor into @aud,@audt,@cap; 
print 'last: ' + @aud + ' - ' + @audt + ' - ' + cast(@cap as nvarchar);
fetch prior from  audcursor into @aud,@audt,@cap; 
print 'prior: ' + @aud + ' - ' + @audt + ' - ' + cast(@cap as nvarchar);
fetch absolute 3 from  audcursor into @aud,@audt,@cap; 
print 'absolute 3: ' + @aud + ' - ' + @audt + ' - ' + cast(@cap as nvarchar);
fetch absolute -1 from  audcursor into @aud,@audt,@cap; 
print 'absolute -2: ' + @aud + ' - ' + @audt + ' - ' + cast(@cap as nvarchar);
fetch relative 5 from  audcursor into @aud,@audt,@cap; 
print 'relative 5: ' + @aud + ' - ' + @audt + ' - ' + cast(@cap as nvarchar);
fetch relative -2 from  audcursor into @aud,@audt,@cap; 
print 'relative -2: ' + @aud + ' - ' + @audt + ' - ' + cast(@cap as nvarchar);
close audcursor;



declare @aud2 nvarchar(20), @audt2 nvarchar(10), @cap2 int, @counter2 int = 0;
declare audcursor2 cursor local scroll for select AUDITORIUM.AUDITORIUM, AUDITORIUM.AUDITORIUM_TYPE, AUDITORIUM.AUDITORIUM_CAPACITY from AUDITORIUM for update;
open audcursor2;
fetch audcursor2 into @aud2, @audt2, @cap2;
while (@@FETCH_STATUS = 0)
begin
	if @aud2 = '777-2'
		update AUDITORIUM set AUDITORIUM = 'Конференц-зал' where current of audcursor2;
	fetch audcursor2 into @aud2, @audt2, @cap2;
end;
close audcursor2;




declare audcursor3 cursor local for select * from AUDITORIUM for update;
declare @aud3 nvarchar(20), @audt3 nvarchar(10), @cap3 int=0, @audname nvarchar(10);
open audcursor3;
fetch audcursor3 into @aud3, @audt3, @cap3,@audname;
while (@@FETCH_STATUS = 0)
begin
	if @aud3 = 'Конференц-зал'
		delete AUDITORIUM where current of audcursor3;
	fetch audcursor3 into @aud3, @audt3, @cap3,@audname;
end;
close audcursor3;
select * from AUDITORIUM;





declare progressCursor cursor local for select * from PROGRESS
inner join STUDENT on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
inner join GROUPS on STUDENT.IDGROUP = GROUPS.IDGROUP for update;
declare @sub char(10), @idstudent int = 0, @pdate date, @note int = 0;
open progressCursor;
fetch progressCursor into @sub, @idstudent, @pdate, @note;
while (@@FETCH_STATUS = 0)
begin
	if(@note < 4)
		delete PROGRESS where current of progressCursor;
	fetch progressCursor into @sub, @idstudent, @pdate, @note;
end;
select * from PROGRESS;

declare progressCursor2 cursor local for select * from PROGRESS for update;
declare @sub2 char(10), @idstudent2 int = 0, @pdate2 date, @note2 int = 0;
declare @id int = 1005; 
open progressCursor2;
fetch progressCursor2 into @sub2, @idstudent2, @pdate2, @note2;
while (@@FETCH_STATUS = 0)
begin
	if(@idstudent2 = @id)
		update PROGRESS set NOTE +=1 where current of progressCursor2;
	fetch progressCursor2 into @sub2, @idstudent2, @pdate2, @note2;
end;
select * from PROGRESS;