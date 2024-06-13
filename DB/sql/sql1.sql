dateadd(month , chhal baghi tzid  , la dateli baghi tl3eb 3liha )
datediff((day,hour,month) , day1 , date2)    day, hour , month = chhal mn youm bin date1 ou date2
getdate()
select day(getdate())
datename(getdate())



select dateadd(day , -day (getdate() , dateadd(month)))
select datepart(day,getdate())
go


--afficher le premiere jour de l'anne en cour 

select dateadd(day , -day(getdate) +1 , getdate())-- makamlach

--le derniere jour de l'anne en cours 
select dateadd(day , -1 , dateadd(year ,datediff(year , 0 , getdate)))--makamlc
g

select formaat(getdate() , 'dd /MMMM / yyyy')

