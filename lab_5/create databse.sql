create database KVO_UNIVER_LAB4;
on primary
(name = N'UNIVER_mdf',filename=N'G:\MSSQL_DATA\UNIVER_mdf.mdf',size = 5120Kb, maxsize=10240,filegrowth = 10%)
log on 
(name = N'UNIVER_log',filename=N'G:\MSSQL_DATA\UNIVER_log.ldf',size = 5120Kb, maxsize=10240,filegrowth = 10%)