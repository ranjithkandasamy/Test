
select distinct DepartmentName,Vertical
from Employeefinaldata ed	
where DepartmentName='Operations & Service'

select *
from Employeefinaldata ed	
where DepartmentName='Operations & Service'


select d.Id,DM.Name,DP.Name[Parent],DRP.Id from DepartmentRelationMapping d 
inner join DepartmentRelationMapping DRP on DRP.Id=d.ParentId
inner join [DepartmentMaster] DM on DM.Id=d.DepartmentId
inner join [DepartmentMaster] DP on DP.Id=DRP.Id
where DP.Name='Operations & Service'


Update Employeefinaldata set Vertical='Repairs and Maintenance' where Vertical='Repair & Maintenance'
and DepartmentName='Operations & Service'


select distinct DepartmentName,Vertical
from Employeefinaldata ed	
where DepartmentName='Operations & Service'


select EmployeeUniqueId
,FirstName+' '+LastName
,EmailId
,DepartmentName
,Vertical
,DesignationName
,ed.LocationName LocationType
,LocationType LocationName,L.LocationId
from Employeefinaldata ed	
left outer join PM_Location L on L.LocationName=ed.LocationName
where DepartmentName='Operations & Service' and ed.LocationType ='Cluster'
and LocationId is null


INSERT INTO [DepartmentDesignationOffice](EmployeeId,DepartmentId,DesignationId
,LocationId,LocationType,FromDate,ToDate,CreatedBy)
select e.EmployeeId,ed.DepartmentId,ed.DesignationId,1,1,e.DateOfJoining,[To Date],1
from Employeefinaldata ed
inner join [Employee] e on e.EmployeeCode=ed.EmployeeUniqueId
where departmentname='Operations & Service' and ed.LocationType ='Cluster'

INSERT INTO [DepartmentDesignationOffice](EmployeeId,DepartmentId,DesignationId
,LocationId,LocationType,FromDate,ToDate,CreatedBy)
select e.EmployeeId,ed.DepartmentId,ed.DesignationId,CityID,2,e.DateOfJoining,[To Date],1
from Employeefinaldata ed
left outer join (
SELECT EmployeeUniqueId,SpId.Names FROM Employeefinaldata efd
Cross apply dbo.[FUNC_SplitNames](efd.LocationName) as SpId
) as re on re.EmployeeUniqueId=ed.EmployeeUniqueId
inner join AM_City L on L.City=re.Names
inner join [Employee] e on e.EmployeeCode=ed.EmployeeUniqueId
where departmentname='Operations & Service' and ed.LocationType ='City'

INSERT INTO [DepartmentDesignationOffice](EmployeeId,DepartmentId,DesignationId
,LocationId,LocationType,FromDate,ToDate,CreatedBy)
select e.EmployeeId,ed.DepartmentId,ed.DesignationId,CityID,2,e.DateOfJoining,[To Date],1
from Employeefinaldata ed
left outer join (
SELECT EmployeeUniqueId,SpId.Names FROM Employeefinaldata efd
Cross apply dbo.[FUNC_SplitNames](efd.LocationName) as SpId
) as re on re.EmployeeUniqueId=ed.EmployeeUniqueId
inner join AM_City L on L.City=re.Names
inner join [Employee] e on e.EmployeeCode=ed.EmployeeUniqueId
where departmentname='Operations & Service' and ed.LocationType ='City'


insert into [EmployeeReportingTo](EmployeeId,ReportingTo,FromDate,ToDate,IsActive,CreatedBy)
select e.EmployeeId,ert.EmployeeId,ert.DateOfJoining,null,1,1
from Employeefinaldata ed
inner join [Employee] e on e.EmployeeCode=ed.EmployeeUniqueId
inner join [Employee] ert on ert.EmployeeId=ed.ReportingToId
where departmentname='Operations & Service' and ed.LocationType ='City'


drop table #Result
select ed.*
--Update ed set LocationName=null
into #Result
from
Employeefinaldata ed	
left outer join PM_Location L on L.LocationName=ed.LocationType
where DepartmentName='Operations & Service' and ed.LocationName='Property'
and LocationId is null

select * 
--Update e set e.LocationName=r.LocationType,e.LocationType=r.LocationName
from #Result r
inner join Employeefinaldata e on e.EmployeeUniqueId=R.EmployeeUniqueId
where r.LocationType not in ('Corporate Office')


select * from pm_Location where locationName like '%Paradise%'
select * 
--Update e set e.LocationName='Colive 167 Santa Clara,Colive 168 Cupertino,Colive 180 Mountain View,Colive 181 Sunny Vale,Colive 193 San Jose,Colive 196 Campbell'
from Employeefinaldata e where EmployeeUniqueId='CL660'

select * from Employeefinaldata ed
left outer join (
SELECT EmployeeUniqueId,SpId.Names FROM Employeefinaldata efd
Cross apply dbo.[FUNC_SplitNames](efd.LocationName) as SpId
) as re on re.EmployeeUniqueId=ed.EmployeeUniqueId
left outer join PM_Location L on L.LocationName=re.Names
where DepartmentName='Operations & Service' and ed.LocationType ='Property'
and LocationId is  null


select distinct LocationName from v_propertyroom

select distinct LocationName
from Employeefinaldata ed	
where DepartmentName='Operations & Service'

select distinct LocationType
from Employeefinaldata ed	
where DepartmentName='Operations & Service'



select *
from Employeefinaldata ed	
where DepartmentName='Operations & Service' and Vertical='CRM'

select *  
from Employeefinaldata ed	
where EmployeeUniqueId in('CL408','CL421')

select * from Employeemigrationdata_ByOPS where EmployeeUniqueId='CL377'



select distinct CityID from pm_location 


select o.EmployeeUniqueId, ed.*
--update ed set ed.LocationType=o.LocationType
from Employeefinaldata ed
left outer join Employeemigrationdata_ByOPS o on o.EmployeeUniqueId=ed.EmployeeUniqueId
and o.LocationName=ed.LocationType
where ed.DepartmentName='Operations & Service'


select * from PM_SubLocationMaster where SubLocation like '%dodd%'

select * from PM_AreaMaster am where am.SubLocationId=41

select * from am_City where cityid=2847

select * from am_user where EmployeeID='CL377'