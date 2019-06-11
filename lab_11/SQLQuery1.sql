use KVO_UNIVER;

exec sp_helpindex 'AUDITORIUM';
exec sp_helpindex 'AUDITORIUM_TYPE';
exec sp_helpindex 'FACULTY';
exec sp_helpindex 'GROUPS';
exec sp_helpindex 'PROFESSION';
exec sp_helpindex 'PROGRESS';
exec sp_helpindex 'PULPIT';
exec sp_helpindex 'STUDENT';
exec sp_helpindex 'SUBJECT';
exec sp_helpindex 'TEACHER';

checkpoint;  --фиксация БД
DBCC DROPCLEANBUFFERS;  --очистить буферный кэш

drop table #tmpTable;
drop table #tmpTable2;


create table #tmpTable
(
	uniqueKey int,
	message nvarchar(50),
);

declare @i int = 0;
set nocount on;
while (@i < 1500)
begin
	insert #tmpTable(uniqueKey, message) values((@i*100/13*5),(convert(nvarchar,@i)+'message'));
	set @i += 1;
end;

select count(*) from #tmpTable where uniqueKey between 300 and 30000;
create clustered index #tmpTable_cl on #tmpTable(uniqueKey);

create table #tmpTable2
(
	id int identity(1,1),
	tkey int,
	info nvarchar(50)
);
declare @j int = 0;
while(@j < 20000)
begin
	insert #tmpTable2 (tkey,info) values (3000*RAND(),convert(nvarchar, @j) + ' message');
	set @j += 1;
end;

select * from #tmpTable2 where info like('%25%');
create index #tmpTable2_ncl on #tmpTable2(id,info);
select * from #tmpTable2 where id = 777; 

create index #tmpTable2_ncl_x on #tmpTable2(tkey) include (id);
select id from #tmpTable2 where tkey > 1500;

create index #tmpTable2_where on #tmpTable2(tkey) where (tkey > 1500 and tkey < 2500);
--используются разные индексы
select tkey from #tmpTable2 where tkey between 1501 and 2499;
select tkey from #tmpTable2 where (tkey > 1500 and tkey < 2500);

INSERT top(100)percent INTO #tmpTable2(tkey, info) SELECT tkey, info  FROM #tmpTable2;
SELECT name [Индекс], avg_fragmentation_in_percent [Фрагментация (%)]
        FROM sys.dm_db_index_physical_stats(DB_ID(N'tempdb'), 
        OBJECT_ID(N'#tmpTable2'), NULL, NULL, NULL) ss
        JOIN sys.indexes ii on ss.object_id = ii.object_id and ss.index_id = ii.index_id WHERE name is not null;

alter index #tmpTable2_where on #tmpTable2 reorganize;
alter index #tmpTable2_where on #tmpTable2 rebuild with (ONLINE = off); 

drop index #tmpTable2_where on #tmpTable2;
create index #tmpTable2_where on #tmpTable2(tkey) where (tkey > 1500 and tkey < 2500) with (fillfactor = 65);
INSERT top(50)percent INTO #tmpTable2(tkey, info) SELECT tkey, info  FROM #tmpTable2;
SELECT name [Индекс], avg_fragmentation_in_percent [Фрагментация (%)]
       FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'),    
       OBJECT_ID(N'#tmpTable2'), NULL, NULL, NULL) ss  JOIN sys.indexes ii 
                                     ON ss.object_id = ii.object_id and ss.index_id = ii.index_id  
                                                                                          WHERE name is not null;

--exec sp_helpindex '#tmpTable';
--exec sp_helpindex '#tmpTable2';




