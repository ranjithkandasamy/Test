USE [colive]
GO


/****** Object:  Table [dbo].[PM_RatingMaster]    Script Date: 06/04/2020 15:35:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[DepartmentTypeMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_DepartmentTypeMaster_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[DepartmentTypeMaster] ADD  CONSTRAINT [DF_DepartmentTypeMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[DepartmentTypeMaster] ADD  CONSTRAINT [DF_DepartmentTypeMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO





/****** Object:  Table [dbo].[PM_RatingMaster]    Script Date: 06/04/2020 15:35:36 ******/
SET ANSI_NULLS ON
GO



SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[DepartmentMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[DisplayName] [varchar](100) NULL,
	[DepartmentTypeId] [Int] NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_DepartmentMaster_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[DepartmentMaster] ADD  CONSTRAINT [DF_DepartmentMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[DepartmentMaster] ADD  CONSTRAINT [DF_DepartmentMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO


SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[DepartmentRelationMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[ParentId] [int] NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_DepartmentRelationMapping_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[DepartmentRelationMapping] ADD  CONSTRAINT [DF_DepartmentRelationMapping_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[DepartmentRelationMapping] ADD  CONSTRAINT [DF_DepartmentRelationMapping_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO


CREATE TABLE [dbo].[DesignationMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[DisplayName] [varchar](100) NULL,
	[DepartmentId] [Int] NULL,
	[HierarchicalOrder] [Int],
	[IsActive] [bit] NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_DesignationMaster_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[DesignationMaster] ADD  CONSTRAINT [DF_DesignationMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[DesignationMaster] ADD  CONSTRAINT [DF_DesignationMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO



/****** Object:  Table [dbo].[PM_RatingMaster]    Script Date: 06/04/2020 15:35:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO




CREATE TABLE [dbo].[Employee](
	[EmployeeId] [Bigint] IDENTITY(1,1) NOT NULL,
	[UserId] Bigint,
	[EmployeeCode] Varchar(20),
	[FirstName] [varchar](100) NULL,
	[LastName] [varchar](100) NULL,
	[DateOfBirth] date,
	[EmailId] Varchar(320),
	[Gender] TINYINT,
	[MaritalStatus] TINYINT,
	[DateOfJoining] DATETIME,
	[ResignationDate] DATETIME,
	[RelievingDate] DATETIME,
	[IsActive] [bit] NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL
 CONSTRAINT [PK_Employee_EmployeeId] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]

go
CREATE TABLE [dbo].[DepartmentDesignationOffice](
	[Id] [Bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [Bigint] NOT NULL,
	[DepartmentId] [Int] NOT NULL,
	[DesignationId] [Int] NOT NULL,
	[LocationId] [BigInt] NULL,
	[LocationType] [Int] NULL,
	[FromDate] [Date] NULL,
	[ToDate] [Date] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_DepartmentDesignationOffice_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[DepartmentDesignationOffice] ADD  CONSTRAINT [DF_DepartmentDesignationOffice_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[DepartmentDesignationOffice] ADD  CONSTRAINT [DF_DepartmentDesignationOffice_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO




CREATE TABLE [dbo].[GenderMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_GenderMaster_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[GenderMaster] ADD  CONSTRAINT [DF_GenderMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[GenderMaster] ADD  CONSTRAINT [DF_GenderMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO




CREATE TABLE [dbo].[MaritalStatusMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_MaritalStatusMaster_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[MaritalStatusMaster] ADD  CONSTRAINT [DF_MaritalStatusMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[MaritalStatusMaster] ADD  CONSTRAINT [DF_MaritalStatusMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO



CREATE TABLE [dbo].[CustomOfficeTypeMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_CustomOfficeTypeMaster_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


ALTER TABLE [dbo].[CustomOfficeTypeMaster] ADD  CONSTRAINT [DF_CustomOfficeTypeMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[CustomOfficeTypeMaster] ADD  CONSTRAINT [DF_CustomOfficeTypeMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO



--insert into [CustomOfficeTypeMaster](Name,[CreatedBy])
--select 'Head Office',1

--insert into [CustomOfficeTypeMaster](Name,[CreatedBy])
--select 'Regional Office',1

--insert into [CustomOfficeTypeMaster](Name,[CreatedBy])
--select 'Corporate Office',1

--insert into [CustomOfficeTypeMaster](Name,[CreatedBy])
--select 'City',1

--insert into [CustomOfficeTypeMaster](Name,[CreatedBy])
--select 'Cluster',1

--insert into [CustomOfficeTypeMaster](Name,[CreatedBy])
--select 'Property',1

