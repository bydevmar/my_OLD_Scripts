create database GestionDesAchats
use GestionDesAchats
create table Fournisseurs
(	NumFournisseur nvarchar(30) not null  primary key, 
	NomFournisseur nvarchar(50) not null,
	Statu int, 
	Ville nvarchar(40)
)
create table Produits
(	
	NumProduit Nvarchar(30)	not null primary key ,
	NomProduit Nvarchar(20) not null,
	Couleur Nvarchar(20), 
	Poids decimal,
	Ville Nvarchar(30)
)
create table Fournitures
(
	NumFournisseur# NVARCHAR(30) not null references Fournisseurs(NumFournisseur),
	NumProduit# NVARCHAR(30) not null references Produits(NumProduit),
	Quantite decimal
)
insert into Fournisseurs values('A123A','Fornisseur_1', 10 , 'Casablanca' ) ,
								 ('A123B','Fornisseur_2', 9 , 'Rabat' ),
								 ('A123C','Fornisseur_3', 10 , 'Tinghir' ),
								 ('A123D','Fornisseur_4', 20 , 'Fes' ),
								 ('A123E','Fornisseur_5', 11 , 'Ouarzazate'),
								 ('A123F','Fornisseur_6', 2 , 'El Jadida' ),
								 ('A123G','Fornisseur_7', 6 , 'Kenitra' ),
								 ('A123H','Fornisseur_8', 19 , 'Tanger' )

insert into Produits values ('P123A' , 'P1' , 'Blanche' , 3 , 'Tinghir'),
							('P123B' , 'P2' , 'Noire' , 2.6 , 'Casablanca'),
							('P123C' , 'P3' , 'Rouge' , 20 , 'Kenitra'),
							('P123D' , 'P4' , 'Vert' , 5 , 'EL Jadida'),
							('P123E' , 'P5' , 'Gris' , 8 , 'Rabat'),
							('P123F' , 'P6' , 'Blanche' , 30 , 'Temara'),
							('P123G' , 'P7' , 'Blue' , 7.2 , 'Tanger'),
							('P123H' , 'P8' , 'Rouge' , 45 , 'Ouarzazate'),
							('P123I' , 'P9' , 'Vert' , 7.2 , 'Casablanca'),
							('P123J' , 'P10' , 'Gris' , 45 , 'Ouarzazate')
							
insert into Fournitures values ('A123A' , 'P123A' , 12 ),
								('A123G' , 'P123E' , 2 ),
								('A123B' , 'P123C' , 10 ),
								('A123A' , 'P123A' , 20 ),
								('A123C' , 'P123B' , 45 ),
								('A123E' , 'P123F' , 3 ),
								('A123B' , 'P123B' , 22 ),
								('A123G' , 'P123C' , 10 ),
								('A123H' , 'P123G' , 11 ),
								('A123F' , 'P123A' , 3 ),
								('A123D' , 'P123J' , 1 )

--1-- 
select *
from Fournisseurs
--2--Le nom et le status des fournisseurs de 'Paris' == Casablanca
select Fournisseurs.NomFournisseur , Fournisseurs.Statu
from	Fournisseurs
where UPPER(Fournisseurs.Ville) like UPPER('%Casablanca%')
--3--Idem par ordre décroissant de status
select *
from	Fournisseurs
order by Statu desc
--4-- les paires numéro de fournisseur et de produit situés dans la même ville
select fr.NumFournisseur , pr.NumProduit
from Fournisseurs as fr
	inner join Produits as pr on fr.Ville = pr.Ville
--5-- le numéro des fournisseurs et le nom des produits qu'ils fournissent
select fr.NumFournisseur , pr.NomProduit
from	Fournisseurs as fr 
		inner join Fournitures as frn on frn.NumFournisseur# = fr.NumFournisseur
		inner join Produits as pr on pr.NumProduit = frn.NumProduit#
--6--les numéros de fournisseurs et numéros de produits fournis et situé dans la même ville.
select fr.NumFournisseur , pr.NumProduit 
from	Fournisseurs as fr 
		inner join Fournitures as frn on frn.NumFournisseur# = fr.NumFournisseur
		inner join Produits as pr on pr.NumProduit = frn.NumProduit#
		where fr.Ville = pr.Ville
--7--les paires numéros de fournisseurs ayant même status ////////////////////////////Problem
select distinct fr.NumFournisseur , fr1.NumFournisseur
from Fournisseurs as fr
	 inner join Fournisseurs as fr1 on fr.Statu = fr1.Statu 
	 where fr.NumFournisseur != fr1.NumFournisseur
	 --distinct fr.NumFournisseur

--8--Il y a combien d'expéditions du produit de numéro 'P2'?
select COUNT(pr.NomProduit) as Nombre_de_P2 
from Produits as pr 
where pr.NomProduit like 'P2'
--10--Nom des fournisseurs qui fournissent au moins un produit de couleur rouge 

select * from Fournisseurs
select * from Fournitures
select * from Produits

