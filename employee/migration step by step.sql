

select * from employeedata where EmployeeUniqueId='CL402'





select * from employeedata where DesignationName like '%human%' or DesignationName like '%APM%'


select * from [DepartmentMaster]

update employeedata set DepartmentId=null,DesignationId=null 

select DM.Id,DM.Name,ed.* 
--Update ed set ed.DepartmentId=dm.Id
from Employeefinaldata ed
inner join [DepartmentMaster] DM on DM.Name=ed.Vertical
where ed.DepartmentName='Operations & Service'


select d.Id,DM.Name,DP.Name[Parent],DRP.Id[ParentId] 
into #DepartmentRelation
from DepartmentRelationMapping d 
inner join DepartmentRelationMapping DRP on DRP.Id=d.ParentId
inner join [DepartmentMaster] DM on DM.Id=d.DepartmentId
inner join [DepartmentMaster] DP on DP.Id=DRP.Id
where DP.Name='Operations & Service'

select * from #DepartmentRelation

select DEM.Id,DEM.Name,Parent,ParentId,ed.* 
--Update ed set ed.DesignationId=DM.Id
from Employeefinaldata ed	
inner join [DepartmentMaster] DEM on DEM.Id=ed.DepartmentId
inner join #DepartmentRelation DR on DR.Id= DEM.Id
inner join [DesignationMaster] DM on DM.DepartmentId=DR.ParentId and DM.Name=ed.DesignationName
where ed.DepartmentName='Operations & Service'

--Update Employeefinaldata set DepartmentName='Operations & Service' where DepartmentName='Operations'

select ed.* 
--Update ed set ed.ReportingToId=e.EmployeeId
from Employeefinaldata ed	
left outer join Employee e on e.EmployeeCode=ed.ReportingTo
where DepartmentName='Operations & Service'


--truncate table [Employee]

--truncate table [DesignationMaster]

insert into [DesignationMaster](Name,DisplayName,DepartmentId,CreatedBy)
select distinct DesignationName,DesignationName,ed.DepartmentId,1 from Employeefinaldata ed
inner join Am_user u on u.EmployeeID=ed.EmployeeUniqueId
where departmentname='Operations & Service'
and DesignationName not in(select Name from [DesignationMaster])
and ed.DepartmentId not in(select DepartmentId from [DesignationMaster])

insert into [Employee](UserId,FirstName,LastName,DateOfBirth,EmailId,Gender,MaritalStatus,DateOfJoining,ResignationDate,RelievingDate,EmployeeCode)
select u.UserID,ed.FirstName,ed.LastName,ed.DateOfBirth,ed.EmailId
,case when ed.MaritalStatus='Single' then 1 when ed.MaritalStatus='Married' then 2 end MaritalStatus 
,case when ed.Gender='Female' then 1 when ed.Gender='Male' then 2 end[Gender]
,ed.DateOfJoining
,null,null,EmployeeUniqueId
from employeedata ed
left outer join Am_user u on u.EmployeeID=ed.EmployeeUniqueId and u.IsActive=1 
left outer join [Employee] E on E.UserId=u.UserID
where departmentname='Sales'
and E.EmployeeId is null
order by ed.DateOfJoining asc

select * 
from [Employee] 


select * from cm_customerdetails

select * from employeedata where FirstName like '%oper%'

select * 
--Update ed set  DepartmentName='Tech'
--Update ed set  MaritalStatus='Single'
from employeedata ed where departmentname='Operations' and MaritalStatus is null


Update employeedata set departmentname='Operations & Service'where departmentname='Operations &Service'

select *
--Update ed set MaritalStatus='Single' 
from employeedata ed
where DateOfBirth>='1990-01-01'and departmentname='Operations & Service' 
and MaritalStatus is null

select distinct DepartmentName from employeedata

select distinct DesignationName from employeedata

select * from [DesignationMaster]

select distinct Gender from employeedata

select EmployeeUniqueId
,FirstName
,LastName
,DateOfBirth
,EmailId
,Gender
,DepartmentName
,DesignationName
,DepartmentId
,DesignationId
--Update ed set departmentname='Transformation'
from employeedata ed where departmentname='sales'

select * from employeedata where departmentname like'%Operations%'


select * from sys.tables where name like '%depar%'
select * from HR_DepartmentMAster

select * from am_user_department

--insert into [MaritalStatusMaster](Name,CreatedBy)
--select 'Single',1


--select * 
----Update ed set ed.LocationName=emd.Property
--from employeemissingdata emd
--inner join employeedata ed on ed.EmployeeUniqueId=emd.[Employee Unique Id]

select * from dmo.TableDictionary

select EmployeeCode,count(1) from [Employee]
group by EmployeeCode
having count(1) >1

select * from [Employee] where EmployeeCode='CL123'
select * from employeeold where ECode='DBS'

select * from am_user where EmployeeID='CL248'


select EmployeeID,count(1) from am_user
where isactive=1 
group by EmployeeID
having count(1) >1

Update am_user set IsActive=0,ModifiedDate=getdate(),ModifiedBy=1729 where UserID=41182

--truncate table [DepartmentDesignationOffice]

INSERT INTO [DepartmentDesignationOffice](EmployeeId,DepartmentId,DesignationId
,LocationId,LocationType,FromDate,ToDate,CreatedBy)
select e.EmployeeId,ed.DepartmentId,ed.DesignationId,1,1,e.DateOfJoining,[To Date],1
from Employeefinaldata ed
inner join [Employee] e on e.EmployeeCode=ed.EmployeeUniqueId
where departmentname='Operations & Service'
--and LocationName='Hyderabad'

insert into [EmployeeReportingTo](EmployeeId,ReportingTo,FromDate,ToDate,IsActive,CreatedBy)
select e.EmployeeId,ert.EmployeeId,ert.DateOfJoining,null,1,1
from Employeefinaldata ed
inner join [Employee] e on e.EmployeeCode=ed.EmployeeUniqueId
inner join [Employee] ert on ert.EmployeeId=ed.ReportingToId
where departmentname='BD'

select * from Employeefinaldata where departmentname='BD' 





select E.EmployeeCode
,E.FirstName
,E.LastName,DEM.Name,DM.Name from Employeefinaldata E
inner join [DepartmentDesignationOffice] DDO ON DDO.EmployeeId=E.EmployeeId
inner join [DepartmentMaster] DEM on DEM.Id=DDO.DepartmentId
inner join [DesignationMaster] DM on DM.Id=DDO.DesignationId
where DEM.Name='Sales'




select * from sys.tables where name like '%locationtype%'


select distinct StatusId from CM_CustomerBookingRequest


select * from v_Dim_booking