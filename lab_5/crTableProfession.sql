use KVO_UNIVER;

create table PROFESSION
  (   PROFESSION   char(20) constraint PROFESSION_PK  primary key,
       FACULTY    char(10) constraint PROFESSION_FACULTY_FK foreign key 
                            references FACULTY(FACULTY),
       PROFESSION_NAME varchar(100),    QUALIFICATION   varchar(50)  
  );  

 insert into PROFESSION(FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)    values    ('ИДиП',  '1-40 01 02',   'Информационные системы и техноло-гии', 'инженер-программист-системотехник' );
 insert into PROFESSION(FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)    values    ('ИДиП',  '1-47 01 01', 'Издательское дело', 'редактор-технолог' );
 insert into PROFESSION(FACULTY, PROFESSION,  PROFESSION_NAME, QUALIFICATION)    values    ('ИДиП',  '1-36 06 01',  'Полиграфическое оборудование и си-стемы обработки информации', 'инженер-электромеханик' );
 insert into PROFESSION(FACULTY, PROFESSION,  PROFESSION_NAME, QUALIFICATION)  values    ('ХТиТ',  '1-36 01 08',    'Конструирование и производство из-делий из композиционных материалов', 'инженер-механик' );
 insert into PROFESSION(FACULTY, PROFESSION,  PROFESSION_NAME, QUALIFICATION)      values    ('ХТиТ',  '1-36 07 01',  'Машины и аппараты химических производств и предприятий строительных материалов', 'инженер-механик' );
 insert into PROFESSION(FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)  values    ('ЛХФ',  '1-75 01 01',      'Лесное хозяйство', 'инженер лесного хозяйства' );
 insert into PROFESSION(FACULTY, PROFESSION,  PROFESSION_NAME, QUALIFICATION)   values    ('ЛХФ',  '1-75 02 01',   'Садово-парковое строительство', 'инже-нер садово-паркового строительства' );
 insert into PROFESSION(FACULTY, PROFESSION,     PROFESSION_NAME, QUALIFICATION)   values    ('ЛХФ',  '1-89 02 02',     'Туризм и природопользование', 'специ-алист в сфере туризма' );
 insert into PROFESSION(FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)  values    ('ИЭФ',  '1-25 01 07',  'Экономика и управление на предприятии', 'экономист-менеджер' );
 insert into PROFESSION(FACULTY, PROFESSION,  PROFESSION_NAME, QUALIFICATION)      values    ('ИЭФ',  '1-25 01 08',    'Бухгалтерский учет, анализ и аудит', 'экономист' );                      
 insert into PROFESSION(FACULTY, PROFESSION,     PROFESSION_NAME, QUALIFICATION)  values    ('ТТЛП',  '1-36 05 01',   'Машины и оборудование лесного ком-плекса', 'инженер-механик' );
 insert into PROFESSION(FACULTY, PROFESSION,   PROFESSION_NAME, QUALIFICATION)   values    ('ТТЛП',  '1-46 01 01',      'Лесоинженерное дело', 'инженер-технолог' );
 insert into PROFESSION(FACULTY, PROFESSION,     PROFESSION_NAME, QUALIFICATION)      values    ('ТОВ',  '1-48 01 02',  'Химическая технология органических веществ, материалов и изделий', 'инженер-химик-технолог' );                
 insert into PROFESSION(FACULTY, PROFESSION,   PROFESSION_NAME, QUALIFICATION)    values    ('ТОВ',  '1-48 01 05',    'Химическая технология переработки древесины', 'инженер-химик-технолог' ); 
 insert into PROFESSION(FACULTY, PROFESSION,    PROFESSION_NAME, QUALIFICATION)  values    ('ТОВ',  '1-54 01 03',   'Физико-химические методы и приборы контроля качества продукции', 'инженер по сертификации' ); 
