

drop table #DepartmentRelation
select d.Id,DM.Name,DP.Name[Parent],DRP.Id[ParentId] 
into #DepartmentRelation
from DepartmentRelationMapping d 
inner join DepartmentRelationMapping DRP on DRP.Id=d.ParentId
inner join [DepartmentMaster] DM on DM.Id=d.DepartmentId
inner join [DepartmentMaster] DP on DP.Id=DRP.Id
where DP.Name='Operations & Service'

select distinct E.EmployeeId
,E.UserId
,E.EmployeeCode
,E.FirstName
,E.LastName
,E.EmailId 
,DR.Name
,DR.[Parent]
,DM.Name[Designation]
,RE.FirstName+' '+RE.LastName[ReportingTo]
from Employee E
inner join [DepartmentDesignationOffice] DDO on DDO.EmployeeId=E.EmployeeId
inner join #DepartmentRelation DR on DR.Id=DDO.DepartmentId
inner join [DesignationMaster] DM on DM.Id=DDO.DesignationId
inner join [EmployeeReportingTo] ERT on ERT.EmployeeId=E.EmployeeId
left outer join Employee RE on RE.EmployeeId=ERT.ReportingTo