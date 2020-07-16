
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

--insert into [DepartmentMaster](Name,DisplayName,DepartmentTypeId,CreatedBy)
--select 'Food & Beverages','Food & Beverages',2,1

--insert into DepartmentRelationMapping(DepartmentId,ParentId,CreatedBy)
--select 21,5,1