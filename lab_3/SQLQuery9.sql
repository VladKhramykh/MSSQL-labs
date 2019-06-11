USE Khramykh_univer;

CREATE Table Results
(
	ID int primary key identity(1,1),
	STUDENT_NAME nvarchar(50),
	Physic int,	
	Philosophy int,
	Math int,
	DB int,
	AVER_VALUE  as ((Physic + Philosophy + Math + DB)/4)
)