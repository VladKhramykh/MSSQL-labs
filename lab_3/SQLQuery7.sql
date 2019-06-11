USE Khramykh_univer;

CREATE Table STUDENT
(
	NZach int primary key,
	NAME nvarchar(20) unique not null
);

INSERT into STUDENT (NZach, NAME)
	Values(154,'hi!')

