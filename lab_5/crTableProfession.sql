use KVO_UNIVER;

create table PROFESSION
  (   PROFESSION   char(20) constraint PROFESSION_PK  primary key,
       FACULTY    char(10) constraint PROFESSION_FACULTY_FK foreign key 
                            references FACULTY(FACULTY),
       PROFESSION_NAME varchar(100),    QUALIFICATION   varchar(50)  
  );  

 insert into PROFESSION(FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)    values    ('����',  '1-40 01 02',   '�������������� ������� � �������-���', '�������-�����������-�������������' );
 insert into PROFESSION(FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)    values    ('����',  '1-47 01 01', '������������ ����', '��������-��������' );
 insert into PROFESSION(FACULTY, PROFESSION,  PROFESSION_NAME, QUALIFICATION)    values    ('����',  '1-36 06 01',  '��������������� ������������ � ��-����� ��������� ����������', '�������-��������������' );
 insert into PROFESSION(FACULTY, PROFESSION,  PROFESSION_NAME, QUALIFICATION)  values    ('����',  '1-36 01 08',    '��������������� � ������������ ��-����� �� �������������� ����������', '�������-�������' );
 insert into PROFESSION(FACULTY, PROFESSION,  PROFESSION_NAME, QUALIFICATION)      values    ('����',  '1-36 07 01',  '������ � �������� ���������� ����������� � ����������� ������������ ����������', '�������-�������' );
 insert into PROFESSION(FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)  values    ('���',  '1-75 01 01',      '������ ���������', '������� ������� ���������' );
 insert into PROFESSION(FACULTY, PROFESSION,  PROFESSION_NAME, QUALIFICATION)   values    ('���',  '1-75 02 01',   '������-�������� �������������', '����-��� ������-��������� �������������' );
 insert into PROFESSION(FACULTY, PROFESSION,     PROFESSION_NAME, QUALIFICATION)   values    ('���',  '1-89 02 02',     '������ � ������������������', '�����-����� � ����� �������' );
 insert into PROFESSION(FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)  values    ('���',  '1-25 01 07',  '��������� � ���������� �� �����������', '���������-��������' );
 insert into PROFESSION(FACULTY, PROFESSION,  PROFESSION_NAME, QUALIFICATION)      values    ('���',  '1-25 01 08',    '������������� ����, ������ � �����', '���������' );                      
 insert into PROFESSION(FACULTY, PROFESSION,     PROFESSION_NAME, QUALIFICATION)  values    ('����',  '1-36 05 01',   '������ � ������������ ������� ���-������', '�������-�������' );
 insert into PROFESSION(FACULTY, PROFESSION,   PROFESSION_NAME, QUALIFICATION)   values    ('����',  '1-46 01 01',      '�������������� ����', '�������-��������' );
 insert into PROFESSION(FACULTY, PROFESSION,     PROFESSION_NAME, QUALIFICATION)      values    ('���',  '1-48 01 02',  '���������� ���������� ������������ �������, ���������� � �������', '�������-�����-��������' );                
 insert into PROFESSION(FACULTY, PROFESSION,   PROFESSION_NAME, QUALIFICATION)    values    ('���',  '1-48 01 05',    '���������� ���������� ����������� ���������', '�������-�����-��������' ); 
 insert into PROFESSION(FACULTY, PROFESSION,    PROFESSION_NAME, QUALIFICATION)  values    ('���',  '1-54 01 03',   '������-���������� ������ � ������� �������� �������� ���������', '������� �� ������������' ); 
