set language french
create database Exo1TP010
use Exo1TP010
--12.97

create table Membre (
	 Pseudo nvarchar(20)  primary key not null , 
	 E_mail nvarchar(40), 
	 Mot_de_passe nvarchar(30) not null,
	 Date_de_naissance date ,
	 Date_inscription date , 
	 Ville nvarchar(30) not null
)
drop table Membre
insert into Membre values ('karim' , 'kamal_9@gmail.com' , 'uk2019uk' ,'10/08/2002', '11/10/2017' , 'Tinghir'),
					('samira' , 'rachid_99@gmail.com' , '2008rahida' ,'08/04/1989', '05/09/2016' , 'Errachidia'),
					('rabi3a' , 'rabi3a_1993@gmail.com' , '1354323' ,'03/03/1997', '04/06/2015' , 'Rabat'),
					('ahmed' , 'ahmed_99@gmail.com' , '10432' ,'09/08/1997', '05/09/2016' , 'Rabat'),
					('ftah' , 'ftah_10@gmail.com' , '1234' ,'04/08/1999', '05/09/2014' , 'Rabat')


declare @ville nvarchar(40)
set @ville = 'Tinghir'
select *
from Membre
where Ville like @ville
Go

declare @nbMembre int 
set @nbMembre  =  (select count(*) from Membre)
print cast (@nbMembre as nvarchar)
/*
declare @total decimal 
select @total =  count(*) from Membre 
declare @chercher decimal 
select @chercher = count(*) from Membre where Membre.ville like 'Tinghir'
if (((@chercher / @total) * 100 )  >= 20)
	begin
		print 'Vrai'
	end */
/*
select ville , COUNT(ville....
from Membre
group by Ville 
having COUNT(ville) /   kber mn 20%


declare @DateDemmarage
select top 1 Membre.Date_inscription 
from Membre
order by Membre.Date_inscription 


--8-

declare  @DateDemmarage10j date
select @DateDemmarage10j = DATEADD(day , 10 , @DateDemmarage )

--9

select COUNT(*)
from Member 
where deteinscription between @DateDemmarage10j and DATEADD(day ,10 ,  datedemmarage10j ) 
*/


/*
declare @Quantite decimal(4,2)
set @Quantite = 26
declare @Consomation decimal
set @Consomation = case 
						when @Quantite < 9 then @Quantite * 1.29
						when @Quantite  >=  9 and  @Quantite< 20   then @Quantite * 4.29
						when @Quantite >= 20 and  @Quantite < 36  then @Quantite * 6.59
						else  @Quantite * 10.37
						end 
print @Consomation
GO*/
/*
declare @Consomation decimal 
set @Consomation = 26
//set @Consomation = 6
//set @Consomation = 15
//set @Consomation = 40
declare @Montant decimal
if( @Consomation < 9 ) set @Montant = @Consomation * 1.29
if (@Consomation  >=  9 and  @Consomation < 20 ) set @Montant =	@Consomation * 4.29
if (@Consomation >= 20 and  @Consomation < 36 ) set @Montant =	@Consomation * 6.59
else  set @Montant =@Consomation * 10.37
print @Montant


*/
--Exo4 : 
/*
create table Bonus 
(	
	PseudoMembre nvarchar(20) not null references Membre(Pseudo), 
	NbPoint int not null 
)*/

declare @pseudo nvarchar(90)
set @pseudo = 'Samir'
declare @point int 
set @point = 2 
IF NOT EXISTS (SELECT * FROM Bonus WHERE Bonus.PseudoMembre like @pseudo) insert into Bonus values (@pseudo , @point)
else
 UPDATE Bonus
SET Bonus.NbPoint = @point +Bonus.NbPoint
WHERE Bonus.PseudoMembre = @pseudo
select* from Bonus







