create database LesDates 
use  LesDates

create table Employes
(
	 EMPLOYEE_ID int not null primary key identity,
	 FIRST_NAME nvarchar(20) ,
	 LAST_NAME nvarchar(20),
	 EMAIL nvarchar(50),
	 PHONE_NUMBER nvarchar(50) ,
	 HIRE_DATE date,
	 JOB_ID  nvarchar(20) not null  ,
	  SALARY money default 0,
	  COMMISSION_PCT decimal ,
	  MANAGER_ID int not null,
	  DEPARTMENT_ID int not null
)
insert into Employes(
	 FIRST_NAME ,
	 LAST_NAME,
	 EMAIL ,
	 PHONE_NUMBER ,
	 HIRE_DATE ,
	 JOB_ID  ,
	  SALARY,
	  COMMISSION_PCT,
	  MANAGER_ID ,
	  DEPARTMENT_ID) values
('Steven'   ,   'King '      , 'SKING'  ,  '515.123.4567'     ,   '1987-06-17', 'AD_PRES '  ,  24000.00      ,      0.00     ,     0    	,	  90 ),
 ('Neena'   , 'Kochhar' ,   ' NKOCHHAR' , '515.123.4568'   ,    ' 1987-06-18' , 'AD_VP'    ,   17000.00   ,         0.00      ,   100      ,       90 ),
('Lex '  ,  'De Haan '  , ' LDEHAAN'  ,' 515.123.4569'    ,    '1987-06-19' , 'AD_VP   '  ,  17000.00     ,      0.00  ,    100      ,     90),
 ('Alexander', 'Hunold '  ,  ' AHUNOLD ' ,' 590.423.4567 '  ,    '1987-06-20' , 'IT_PROG '  ,   9000.00       ,    0.00     ,    102     ,       60 ),
( 'Bruce'   , ' Ernst  '   ,   'BERNST ',  ',590.423.4568'    ,    '1987-06-21' ,'IT_PROG '  ,   6000.00      ,     0.00    ,    103   ,        60 ),
 ('David '    ,' Austin '   ,   'DAUSTIN'  ,' 590.423.4569'   ,    ' 1987-06-22' ,' IT_PROG'   ,   4800.00    ,        0.00   ,      103   ,         60 ),
 ('Valli '   ,  ' Pataballa ' , ' VPATABAL' , '590.423.4560 '  ,   '  1987-06-23' , 'IT_PROG  ' ,   4800.00   ,         0.00  ,       103       ,      60 ),
(' Diana  '   , ' Lorentz'   , ' DLORENTZ' , '590.423.5567'    ,   ' 1987-06-24' ,' IT_PROG  ' ,  4200.00      ,     0.00     ,    103     ,      60 ),
 ('Nancy  '  ,  ' Greenberg ' ,' NGREENBE' , '515.124.4569'   ,    ' 1987-06-25' , 'FI_MGR  '  , 12000.00     ,       0.00    ,     101     ,      100 ),
('Daniel  '  , ' Faviet'    ,   'DFAVIET ', ' 515.124.4169 ' ,     ' 1987-06-26' , 'FI_ACCOUNT' ,  9000.00     ,       0.00     ,    108        ,    100 )

--Qst-3 -- convert(date , '31-07-2019'
select HIRE_DATE
from Employes
where UPPER(datename(dw,Employes.HIRE_DATE)) like 'MONDAY'
--10----		
SELECT	DATEADD(DAY,-1,DATEADD(year,-1,dateadd(day, 730677 , CAST('01-01-0001' AS datetime2))))
--11--
select Employes.FIRST_NAME , Employes.HIRE_DATE
from	Employes
where HIRE_DATE between '1905-06-01' and '1987-07-30'

select format(getdate(), 'dddd dd MMMM yyyy HH:mm:ss')
go									