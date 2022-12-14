USE [DB_SKRIPSI]
GO
/****** Object:  Table [dbo].[tn_m_area]    Script Date: 9/24/2022 12:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tn_m_area](
	[m_area_id] [int] IDENTITY(1,1) NOT NULL,
	[m_area_code] [varchar](25) NULL,
	[m_area_name] [varchar](255) NULL,
	[status] [varchar](25) NULL,
	[created_by] [int] NULL,
	[created_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[m_area_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tn_m_dropdown]    Script Date: 9/24/2022 12:37:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tn_m_dropdown](
	[md_id] [int] IDENTITY(1,1) NOT NULL,
	[md_criteria] [varchar](255) NULL,
	[md_value] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[md_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tn_m_equipment]    Script Date: 9/24/2022 12:37:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tn_m_equipment](
	[m_equip_id] [int] IDENTITY(1,1) NOT NULL,
	[m_tag_no] [varchar](50) NULL,
	[m_area] [int] NULL,
	[m_manufacture] [int] NULL,
	[m_capacity] [int] NULL,
	[m_fla] [varchar](25) NULL,
	[m_rpm] [varchar](25) NULL,
	[m_volt] [varchar](25) NULL,
	[m_frame] [varchar](25) NULL,
	[m_bearing_de] [int] NULL,
	[m_bearing_nde] [int] NULL,
	[m_wiring_de] [int] NULL,
	[m_wiring_nde] [int] NULL,
	[status] [varchar](25) NULL,
	[created_by] [int] NULL,
	[created_date] [datetime] NULL,
 CONSTRAINT [PK__tn_m_equ__F2A03E42AE10CBF0] PRIMARY KEY CLUSTERED 
(
	[m_equip_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tn_m_manufacture]    Script Date: 9/24/2022 12:37:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tn_m_manufacture](
	[m_manu_id] [int] IDENTITY(1,1) NOT NULL,
	[m_manu_code] [varchar](25) NULL,
	[m_manu_name] [varchar](255) NULL,
	[status] [varchar](25) NULL,
	[created_by] [int] NULL,
	[created_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[m_manu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Equipment]    Script Date: 9/24/2022 12:37:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[V_Equipment] 
AS
SELECT 
	ME.*,
	MM.m_manu_name,
	MA.m_area_name,
	MDT.md_value AS tag_no,
	MDC.md_value AS capacity,
	MDF.md_value AS fla,
	MDR.md_value AS rpm,
	MDV.md_value AS volt,
	MDFR.md_value AS frame,
	MDD.md_value AS de,
	MDN.md_value AS nde,
	MDW.md_value AS wiring
FROM tn_m_equipment ME
LEFT JOIN tn_m_manufacture MM ON MM.m_manu_id = ME.m_manufacture
LEFT JOIN tn_m_area MA ON MA.m_area_id = ME.m_area
LEFT JOIN tn_m_dropdown MDT ON MDT.md_id = ME.m_tag_no
LEFT JOIN tn_m_dropdown MDC ON MDC.md_id = ME.m_capacity
LEFT JOIN tn_m_dropdown MDF ON MDF.md_id = ME.m_fla
LEFT JOIN tn_m_dropdown MDR ON MDR.md_id = ME.m_rpm
LEFT JOIN tn_m_dropdown MDV ON MDV.md_id = ME.m_volt
LEFT JOIN tn_m_dropdown MDFR ON MDFR.md_id = ME.m_frame
LEFT JOIN tn_m_dropdown MDD ON MDD.md_id = ME.m_bearing_de
LEFT JOIN tn_m_dropdown MDN ON MDN.md_id = ME.m_bearing_nde
LEFT JOIN tn_m_dropdown MDW ON MDW.md_id = ME.m_wiring_de
GO
/****** Object:  Table [dbo].[m_area]    Script Date: 9/24/2022 12:37:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_area](
	[area_id] [int] IDENTITY(1,1) NOT NULL,
	[area_name] [varchar](255) NULL,
	[status] [varchar](25) NULL,
	[created_by] [int] NULL,
	[created_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[area_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_manufacture]    Script Date: 9/24/2022 12:37:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_manufacture](
	[manufacture_id] [int] IDENTITY(1,1) NOT NULL,
	[manufacture_name] [varchar](255) NULL,
	[status] [varchar](25) NULL,
	[created_by] [int] NULL,
	[created_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[manufacture_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_material]    Script Date: 9/24/2022 12:37:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_material](
	[material_id] [int] IDENTITY(1,1) NOT NULL,
	[material_type] [varchar](255) NULL,
	[material_ing] [varchar](50) NULL,
	[material_value] [varchar](255) NULL,
	[status] [varchar](25) NULL,
	[created_by] [int] NULL,
	[created_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[material_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_equipment]    Script Date: 9/24/2022 12:37:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_equipment](
	[equipment_id] [int] IDENTITY(1,1) NOT NULL,
	[tag_no] [varchar](255) NULL,
	[area_id] [int] NULL,
	[manufacture_id] [int] NULL,
	[capacity] [varchar](255) NULL,
	[fla] [varchar](255) NULL,
	[rpm] [varchar](255) NULL,
	[volt] [varchar](255) NULL,
	[frame] [varchar](255) NULL,
	[bearing_de] [int] NULL,
	[bearing_nde] [int] NULL,
	[wiring_diameter] [varchar](255) NULL,
	[schedule_service] [datetime] NULL,
	[last_service] [varchar](50) NULL,
	[mttr] [varchar](50) NULL,
	[mttf] [varchar](50) NULL,
	[overdue_schedule] [varchar](50) NULL,
	[created_by] [int] NULL,
	[created_date] [datetime] NULL,
 CONSTRAINT [PK__m_equipm__197068AF08D5EDF2] PRIMARY KEY CLUSTERED 
(
	[equipment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Equipments]    Script Date: 9/24/2022 12:37:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[V_Equipments] 
AS
SELECT 
	ME.equipment_id,
	ME.tag_no,
    ME.area_id,
    ME.manufacture_id,
    ME.capacity,
    ME.fla,
    ME.rpm,
    ME.volt,
    ME.frame,
    ME.bearing_de,
    ME.bearing_nde,
    ME.wiring_diameter,
    CONVERT(VARCHAR(20), ME.schedule_service, 105) AS schedule_service,
	MA.area_name,
	MM.manufacture_name,
	MDE.material_value AS de,
	MNDE.material_value AS nde,
	MD.md_value AS val_tag_no,
	MW.material_value AS wiring_value,
	CONVERT(VARCHAR(20), ME.last_service, 105) AS last_service,
	ME.mttf,
	ME.mttr,
	(CASE
	 WHEN CONVERT(datetime, ME.schedule_service, 105) < GETDATE()
	 THEN 'OVERDUE'
	 ELSE ''
	 END) AS overdue
FROM m_equipment ME
LEFT JOIN m_manufacture MM ON MM.manufacture_id = ME.manufacture_id
LEFT JOIN m_area MA ON MA.area_id = ME.area_id
LEFT JOIN m_material MDE ON MDE.material_id = ME.bearing_de
LEFT JOIN m_material MNDE ON MNDE.material_id = ME.bearing_de
LEFT JOIN m_material MW ON MW.material_id = ME.wiring_diameter
LEFT JOIN tn_m_dropdown MD ON MD.md_id = ME.tag_no
GO
/****** Object:  Table [dbo].[equipment_repairment]    Script Date: 9/24/2022 12:37:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[equipment_repairment](
	[equip_history_id] [int] IDENTITY(1,1) NOT NULL,
	[equipment_id] [int] NULL,
	[start_date] [varchar](25) NULL,
	[end_date] [varchar](25) NULL,
	[operation_time] [int] NULL,
	[duration] [int] NULL,
	[status] [varchar](50) NULL,
	[created_by] [int] NULL,
	[created_date] [datetime] NULL,
	[updated_by] [int] NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK__equipmen__45BE04BE1950EF5A] PRIMARY KEY CLUSTERED 
(
	[equip_history_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_dropdown]    Script Date: 9/24/2022 12:37:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_dropdown](
	[dropdown_id] [int] IDENTITY(1,1) NOT NULL,
	[criteria] [varchar](25) NULL,
	[value] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[dropdown_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tn_m_material]    Script Date: 9/24/2022 12:37:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tn_m_material](
	[m_material_id] [int] IDENTITY(1,1) NOT NULL,
	[m_substance] [varchar](255) NULL,
	[m_material_type] [varchar](50) NULL,
	[m_material_code] [varchar](50) NULL,
	[m_material_name] [varchar](255) NULL,
	[status] [varchar](25) NULL,
	[created_by] [int] NULL,
	[created_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[m_material_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tn_u_login]    Script Date: 9/24/2022 12:37:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tn_u_login](
	[u_id] [int] IDENTITY(1,1) NOT NULL,
	[u_name] [varchar](255) NULL,
	[u_password] [varchar](255) NULL,
	[u_role] [varchar](25) NULL,
	[status] [varchar](25) NULL,
	[created_by] [int] NULL,
	[created_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[u_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tn_users]    Script Date: 9/24/2022 12:37:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tn_users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[role] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[equipment_repairment] ON 

INSERT [dbo].[equipment_repairment] ([equip_history_id], [equipment_id], [start_date], [end_date], [operation_time], [duration], [status], [created_by], [created_date], [updated_by], [updated_date]) VALUES (35, 9, N'30-09-2022', N'06-10-2022', 9, 6, N'FINISH', 1, CAST(N'2022-09-24T12:03:28.543' AS DateTime), 1, CAST(N'2022-09-24T12:03:35.680' AS DateTime))
INSERT [dbo].[equipment_repairment] ([equip_history_id], [equipment_id], [start_date], [end_date], [operation_time], [duration], [status], [created_by], [created_date], [updated_by], [updated_date]) VALUES (36, 9, N'13-10-2022', N'20-10-2022', 7, 7, N'FINISH', 1, CAST(N'2022-09-24T12:03:46.747' AS DateTime), 1, CAST(N'2022-09-24T12:03:57.787' AS DateTime))
INSERT [dbo].[equipment_repairment] ([equip_history_id], [equipment_id], [start_date], [end_date], [operation_time], [duration], [status], [created_by], [created_date], [updated_by], [updated_date]) VALUES (37, 9, N'27-10-2022', N'05-11-2022', 7, 9, N'FINISH', 1, CAST(N'2022-09-24T12:28:16.773' AS DateTime), 1, CAST(N'2022-09-24T12:28:38.813' AS DateTime))
INSERT [dbo].[equipment_repairment] ([equip_history_id], [equipment_id], [start_date], [end_date], [operation_time], [duration], [status], [created_by], [created_date], [updated_by], [updated_date]) VALUES (38, 9, N'30-11-2022', N'08-12-2022', 25, 8, N'FINISH', 1, CAST(N'2022-09-24T12:30:08.177' AS DateTime), 1, CAST(N'2022-09-24T12:30:21.927' AS DateTime))
INSERT [dbo].[equipment_repairment] ([equip_history_id], [equipment_id], [start_date], [end_date], [operation_time], [duration], [status], [created_by], [created_date], [updated_by], [updated_date]) VALUES (39, 9, N'29-12-2022', N'05-01-2023', 21, 7, N'FINISH', 1, CAST(N'2022-09-24T12:31:21.843' AS DateTime), 1, CAST(N'2022-09-24T12:31:37.757' AS DateTime))
SET IDENTITY_INSERT [dbo].[equipment_repairment] OFF
GO
SET IDENTITY_INSERT [dbo].[m_area] ON 

INSERT [dbo].[m_area] ([area_id], [area_name], [status], [created_by], [created_date]) VALUES (4, N'A', N'ACTIVE', 1, CAST(N'2022-09-17T11:57:07.650' AS DateTime))
INSERT [dbo].[m_area] ([area_id], [area_name], [status], [created_by], [created_date]) VALUES (5, N'B', N'ACTIVE', 1, CAST(N'2022-09-17T11:57:07.650' AS DateTime))
INSERT [dbo].[m_area] ([area_id], [area_name], [status], [created_by], [created_date]) VALUES (6, N'C', N'ACTIVE', 1, CAST(N'2022-09-17T11:57:07.650' AS DateTime))
INSERT [dbo].[m_area] ([area_id], [area_name], [status], [created_by], [created_date]) VALUES (7, N'D', N'ACTIVE', 1, CAST(N'2022-09-17T11:57:07.650' AS DateTime))
INSERT [dbo].[m_area] ([area_id], [area_name], [status], [created_by], [created_date]) VALUES (8, N'E', N'ACTIVE', 1, CAST(N'2022-09-17T11:57:07.650' AS DateTime))
INSERT [dbo].[m_area] ([area_id], [area_name], [status], [created_by], [created_date]) VALUES (9, N'F', N'ACTIVE', 1, CAST(N'2022-09-17T11:57:07.650' AS DateTime))
INSERT [dbo].[m_area] ([area_id], [area_name], [status], [created_by], [created_date]) VALUES (10, N'G', N'ACTIVE', 1, CAST(N'2022-09-17T11:57:07.650' AS DateTime))
SET IDENTITY_INSERT [dbo].[m_area] OFF
GO
SET IDENTITY_INSERT [dbo].[m_equipment] ON 

INSERT [dbo].[m_equipment] ([equipment_id], [tag_no], [area_id], [manufacture_id], [capacity], [fla], [rpm], [volt], [frame], [bearing_de], [bearing_nde], [wiring_diameter], [schedule_service], [last_service], [mttr], [mttf], [overdue_schedule], [created_by], [created_date]) VALUES (9, N'81', 4, 2, N'1', N'13', N'33', N'35', N'39', 20, 34, NULL, CAST(N'2027-09-21T21:09:04.520' AS DateTime), N'05-01-2023', N'7.40', N'13.80', NULL, 1, CAST(N'2022-09-21T21:09:04.520' AS DateTime))
SET IDENTITY_INSERT [dbo].[m_equipment] OFF
GO
SET IDENTITY_INSERT [dbo].[m_manufacture] ON 

INSERT [dbo].[m_manufacture] ([manufacture_id], [manufacture_name], [status], [created_by], [created_date]) VALUES (2, N'G.E', N'ACTIVE', 1, CAST(N'2022-09-17T11:58:31.727' AS DateTime))
INSERT [dbo].[m_manufacture] ([manufacture_id], [manufacture_name], [status], [created_by], [created_date]) VALUES (3, N'SIEMENS', N'ACTIVE', 1, CAST(N'2022-09-17T11:58:31.727' AS DateTime))
SET IDENTITY_INSERT [dbo].[m_manufacture] OFF
GO
SET IDENTITY_INSERT [dbo].[m_material] ON 

INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (5, N'DE', N'BEARING', N'45645645', N'ACTIVE', 1, CAST(N'2022-09-14T21:30:00.057' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (7, N'NDE', N'BEARING', N'BBBBB', N'ACTIVE', 1, CAST(N'2022-09-14T21:43:24.363' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (8, NULL, N'WIRING', N'0.7', N'ACTIVE', 1, CAST(N'2022-09-04T21:39:15.480' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (9, NULL, N'WIRING', N'0.75', N'ACTIVE', 1, CAST(N'2022-09-04T21:39:15.480' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (10, NULL, N'WIRING', N'0.8', N'ACTIVE', 1, CAST(N'2022-09-04T21:39:15.480' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (11, NULL, N'WIRING', N'0.85', N'ACTIVE', 1, CAST(N'2022-09-04T21:39:15.480' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (12, NULL, N'WIRING', N'0.9', N'ACTIVE', 1, CAST(N'2022-09-04T21:39:15.480' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (13, NULL, N'WIRING', N'0.95', N'ACTIVE', 1, CAST(N'2022-09-04T21:39:15.480' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (14, NULL, N'WIRING', N'1', N'ACTIVE', 1, CAST(N'2022-09-04T21:39:15.480' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (15, NULL, N'WIRING', N'1.5', N'ACTIVE', 1, CAST(N'2022-09-04T21:39:15.480' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (16, N'DE', N'BEARING', N'SLEEVE', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:08.490' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (17, N'DE', N'BEARING', N'6309', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:08.490' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (18, N'DE', N'BEARING', N'6312', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:08.490' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (19, N'DE', N'BEARING', N'6206', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:08.490' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (20, N'DE', N'BEARING', N'6214', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:08.490' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (21, N'DE', N'BEARING', N'6308', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:08.490' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (22, N'DE', N'BEARING', N'6207', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:08.490' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (23, N'DE', N'BEARING', N'6213', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:08.490' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (24, N'DE', N'BEARING', N'6310', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:08.490' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (25, N'DE', N'BEARING', N'6316', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:08.490' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (26, N'DE', N'BEARING', N'6314', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:08.490' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (27, N'DE', N'BEARING', N'6311', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:08.490' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (28, N'DE', N'BEARING', N'6219', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:08.490' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (29, N'DE', N'BEARING', N'NU217X2', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:08.490' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (30, N'NDE', N'BEARING', N'6207', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:15.120' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (31, N'NDE', N'BEARING', N'6210', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:15.120' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (32, N'NDE', N'BEARING', N'6205', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:15.120' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (33, N'NDE', N'BEARING', N'6312', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:15.120' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (34, N'NDE', N'BEARING', N'6309', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:15.120' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (35, N'NDE', N'BEARING', N'6213', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:15.120' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (36, N'NDE', N'BEARING', N'6316', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:15.120' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (37, N'NDE', N'BEARING', N'6314', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:15.120' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (38, N'NDE', N'BEARING', N'6208', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:15.120' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (39, N'NDE', N'BEARING', N'6311', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:15.120' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (40, N'NDE', N'BEARING', N'6310', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:15.120' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (41, N'NDE', N'BEARING', N'NU219', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:15.120' AS DateTime))
INSERT [dbo].[m_material] ([material_id], [material_type], [material_ing], [material_value], [status], [created_by], [created_date]) VALUES (42, N'NDE', N'BEARING', N'6217', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:15.120' AS DateTime))
SET IDENTITY_INSERT [dbo].[m_material] OFF
GO
SET IDENTITY_INSERT [dbo].[tn_m_area] ON 

INSERT [dbo].[tn_m_area] ([m_area_id], [m_area_code], [m_area_name], [status], [created_by], [created_date]) VALUES (1, N'A', N'A', N'ACTIVE', 1, NULL)
INSERT [dbo].[tn_m_area] ([m_area_id], [m_area_code], [m_area_name], [status], [created_by], [created_date]) VALUES (2, N'B', N'B', N'ACTIVE', 1, NULL)
INSERT [dbo].[tn_m_area] ([m_area_id], [m_area_code], [m_area_name], [status], [created_by], [created_date]) VALUES (3, N'C', N'C', N'ACTIVE', 1, NULL)
INSERT [dbo].[tn_m_area] ([m_area_id], [m_area_code], [m_area_name], [status], [created_by], [created_date]) VALUES (4, N'D', N'D', N'ACTIVE', 1, NULL)
INSERT [dbo].[tn_m_area] ([m_area_id], [m_area_code], [m_area_name], [status], [created_by], [created_date]) VALUES (5, N'E', N'E', N'ACTIVE', 1, NULL)
INSERT [dbo].[tn_m_area] ([m_area_id], [m_area_code], [m_area_name], [status], [created_by], [created_date]) VALUES (6, N'F', N'F', N'ACTIVE', 1, NULL)
INSERT [dbo].[tn_m_area] ([m_area_id], [m_area_code], [m_area_name], [status], [created_by], [created_date]) VALUES (7, N'G', N'G', N'ACTIVE', 1, NULL)
SET IDENTITY_INSERT [dbo].[tn_m_area] OFF
GO
SET IDENTITY_INSERT [dbo].[tn_m_dropdown] ON 

INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (1, N'CAPACITY', N'3')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (2, N'CAPACITY', N'10')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (3, N'CAPACITY', N'15')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (4, N'CAPACITY', N'25')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (5, N'CAPACITY', N'30')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (6, N'CAPACITY', N'40')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (7, N'CAPACITY', N'60')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (8, N'CAPACITY', N'75')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (9, N'CAPACITY', N'100')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (10, N'CAPACITY', N'150')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (11, N'CAPACITY', N'250')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (12, N'CAPACITY', N'500')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (13, N'FLA', N'6')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (14, N'FLA', N'14')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (15, N'FLA', N'21')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (16, N'FLA', N'30')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (17, N'FLA', N'41')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (18, N'FLA', N'57')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (19, N'FLA', N'92')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (20, N'FLA', N'108')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (21, N'FLA', N'135')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (22, N'FLA', N'191')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (23, N'FLA', N'40')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (24, N'FLA', N'91')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (25, N'WIRING', N'0.7')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (26, N'WIRING', N'0.75')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (27, N'WIRING', N'0.8')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (28, N'WIRING', N'0.85')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (29, N'WIRING', N'0.9')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (30, N'WIRING', N'0.95')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (31, N'WIRING', N'1')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (32, N'WIRING', N'1.5')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (33, N'RPM', N'1500')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (34, N'RPM', N'3000')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (35, N'VOLT', N'380.0')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (36, N'VOLT', N'3300')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (37, N'FRAME', N'8110S')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (38, N'FRAME', N'324TS')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (39, N'FRAME', N'SBFC')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (40, N'FRAME', N'364T')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (41, N'FRAME', N'365TS')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (42, N'FRAME', N'509LS')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (43, N'FRAME', N'254T')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (44, N'FRAME', N'365TS')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (45, N'FRAME', N'286TS')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (46, N'FRAME', N'445TS')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (47, N'FRAME', N'447TS')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (48, N'FRAME', N'215TCV')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (49, N'FRAME', N'324HPZ')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (50, N'FRAME', N'284TS')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (51, N'FRAME', N'ILA1402HDO')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (52, N'FRAME', N'ILA1402')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (53, N'FRAME', N'225S')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (54, N'DE', N'SLEEVE')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (55, N'DE', N'6309')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (56, N'DE', N'6312')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (57, N'DE', N'6206')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (58, N'DE', N'6214')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (59, N'DE', N'6308')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (60, N'DE', N'6207')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (61, N'DE', N'6213')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (62, N'DE', N'6310')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (63, N'DE', N'6316')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (64, N'DE', N'6314')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (65, N'DE', N'6311')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (66, N'DE', N'6219')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (67, N'DE', N'NU217X2')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (68, N'NDE', N'6207')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (69, N'NDE', N'6210')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (70, N'NDE', N'6205')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (71, N'NDE', N'6312')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (72, N'NDE', N'6309')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (73, N'NDE', N'6213')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (74, N'NDE', N'6316')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (75, N'NDE', N'6314')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (76, N'NDE', N'6208')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (77, N'NDE', N'6311')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (78, N'NDE', N'6310')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (79, N'NDE', N'NU219')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (80, N'NDE', N'6217')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (81, N'TAGNO', N'1')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (82, N'TAGNO', N'2')
INSERT [dbo].[tn_m_dropdown] ([md_id], [md_criteria], [md_value]) VALUES (83, N'TAGNO', N'3')
SET IDENTITY_INSERT [dbo].[tn_m_dropdown] OFF
GO
SET IDENTITY_INSERT [dbo].[tn_m_equipment] ON 

INSERT [dbo].[tn_m_equipment] ([m_equip_id], [m_tag_no], [m_area], [m_manufacture], [m_capacity], [m_fla], [m_rpm], [m_volt], [m_frame], [m_bearing_de], [m_bearing_nde], [m_wiring_de], [m_wiring_nde], [status], [created_by], [created_date]) VALUES (1, N'81', 1, 1, 1, N'13', N'33', N'35', N'40', 22, 22, NULL, NULL, N'ACTIVE', 1, CAST(N'2022-09-05T19:07:46.673' AS DateTime))
INSERT [dbo].[tn_m_equipment] ([m_equip_id], [m_tag_no], [m_area], [m_manufacture], [m_capacity], [m_fla], [m_rpm], [m_volt], [m_frame], [m_bearing_de], [m_bearing_nde], [m_wiring_de], [m_wiring_nde], [status], [created_by], [created_date]) VALUES (2, N'81', 1, 1, 1, N'13', N'33', N'35', N'39', 23, 22, NULL, NULL, N'ACTIVE', 1, CAST(N'2022-09-05T20:18:05.310' AS DateTime))
SET IDENTITY_INSERT [dbo].[tn_m_equipment] OFF
GO
SET IDENTITY_INSERT [dbo].[tn_m_manufacture] ON 

INSERT [dbo].[tn_m_manufacture] ([m_manu_id], [m_manu_code], [m_manu_name], [status], [created_by], [created_date]) VALUES (1, N'G.E', N'G.E', N'ACTIVE', 1, CAST(N'2022-07-24T15:26:08.937' AS DateTime))
INSERT [dbo].[tn_m_manufacture] ([m_manu_id], [m_manu_code], [m_manu_name], [status], [created_by], [created_date]) VALUES (2, N'SIEMENS', N'SIEMENS', N'ACTIVE', 1, CAST(N'2022-07-24T15:26:38.027' AS DateTime))
SET IDENTITY_INSERT [dbo].[tn_m_manufacture] OFF
GO
SET IDENTITY_INSERT [dbo].[tn_m_material] ON 

INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (10, N'WIRING', NULL, N'0.7', N'0.7', N'ACTIVE', 1, CAST(N'2022-09-04T21:39:15.480' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (11, N'WIRING', NULL, N'0.75', N'0.75', N'ACTIVE', 1, CAST(N'2022-09-04T21:39:15.480' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (12, N'WIRING', NULL, N'0.8', N'0.8', N'ACTIVE', 1, CAST(N'2022-09-04T21:39:15.480' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (13, N'WIRING', NULL, N'0.85', N'0.85', N'ACTIVE', 1, CAST(N'2022-09-04T21:39:15.480' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (14, N'WIRING', NULL, N'0.9', N'0.9', N'ACTIVE', 1, CAST(N'2022-09-04T21:39:15.480' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (15, N'WIRING', NULL, N'0.95', N'0.95', N'ACTIVE', 1, CAST(N'2022-09-04T21:39:15.480' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (16, N'WIRING', NULL, N'1', N'1', N'ACTIVE', 1, CAST(N'2022-09-04T21:39:15.480' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (17, N'WIRING', NULL, N'1.5', N'1.5', N'ACTIVE', 1, CAST(N'2022-09-04T21:39:15.480' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (18, N'BEARING', N'DE', N'SLEEVE', N'SLEEVE', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:08.490' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (19, N'BEARING', N'DE', N'6309', N'6309', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:08.490' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (20, N'BEARING', N'DE', N'6312', N'6312', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:08.490' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (21, N'BEARING', N'DE', N'6206', N'6206', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:08.490' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (22, N'BEARING', N'DE', N'6214', N'6214', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:08.490' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (23, N'BEARING', N'DE', N'6308', N'6308', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:08.490' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (24, N'BEARING', N'DE', N'6207', N'6207', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:08.490' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (25, N'BEARING', N'DE', N'6213', N'6213', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:08.490' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (26, N'BEARING', N'DE', N'6310', N'6310', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:08.490' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (27, N'BEARING', N'DE', N'6316', N'6316', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:08.490' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (28, N'BEARING', N'DE', N'6314', N'6314', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:08.490' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (29, N'BEARING', N'DE', N'6311', N'6311', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:08.490' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (30, N'BEARING', N'DE', N'6219', N'6219', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:08.490' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (31, N'BEARING', N'DE', N'NU217X2', N'NU217X2', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:08.490' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (32, N'BEARING', N'NDE', N'6207', N'6207', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:15.120' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (33, N'BEARING', N'NDE', N'6210', N'6210', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:15.120' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (34, N'BEARING', N'NDE', N'6205', N'6205', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:15.120' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (35, N'BEARING', N'NDE', N'6312', N'6312', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:15.120' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (36, N'BEARING', N'NDE', N'6309', N'6309', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:15.120' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (37, N'BEARING', N'NDE', N'6213', N'6213', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:15.120' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (38, N'BEARING', N'NDE', N'6316', N'6316', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:15.120' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (39, N'BEARING', N'NDE', N'6314', N'6314', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:15.120' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (40, N'BEARING', N'NDE', N'6208', N'6208', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:15.120' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (41, N'BEARING', N'NDE', N'6311', N'6311', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:15.120' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (42, N'BEARING', N'NDE', N'6310', N'6310', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:15.120' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (43, N'BEARING', N'NDE', N'NU219', N'NU219', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:15.120' AS DateTime))
INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (44, N'BEARING', N'NDE', N'6217', N'6217', N'ACTIVE', 1, CAST(N'2022-09-04T21:40:15.120' AS DateTime))
SET IDENTITY_INSERT [dbo].[tn_m_material] OFF
GO
SET IDENTITY_INSERT [dbo].[tn_u_login] ON 

INSERT [dbo].[tn_u_login] ([u_id], [u_name], [u_password], [u_role], [status], [created_by], [created_date]) VALUES (1, N'admin', N'L3bYml6rPGfulxWk6oFYP3IMfiu/EcqeqpQ9+SsCfhN4Gpc4JV2MEitjCrYmXZKKAnOOFziv3vvwsamJ6ULCqefOiPcJpPwfI0UnW9SpUjlgG5tyA1QXd9i2T5twG0Gb', N'ADMIN', N'ACTIVE', 1, NULL)
SET IDENTITY_INSERT [dbo].[tn_u_login] OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_repairment]    Script Date: 9/24/2022 12:37:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_repairment] (
	@repair_id INT,
	@equipment_id INT,
	@date VARCHAR(25),
	@status VARCHAR(25),
	@created_by INT
)
AS
BEGIN
	DECLARE @operating_time INT
	SET @operating_time = (CASE
							   WHEN (SELECT last_service FROM m_equipment WHERE equipment_id = @equipment_id) IS NULL
							   THEN (SELECT DATEDIFF(DAY, CONVERT(DATE,(SELECT created_date FROM m_equipment WHERE equipment_id = @equipment_id), 103), CONVERT(DATE, @date, 103)))
							   ELSE (SELECT DATEDIFF(DAY, CONVERT(DATE,(SELECT last_service FROM m_equipment WHERE equipment_id = @equipment_id), 103), CONVERT(DATE, @date, 103))) 
							   END)
	IF(@repair_id) = 0
	BEGIN
		
		
		INSERT INTO equipment_repairment (equipment_id, start_date, status, created_by, created_date, operation_time)
		VALUES (@equipment_id, @date, @status, @created_by, GETDATE(), @operating_time)
	END

	ELSE
	BEGIN
		IF(@status) = 'FINISH'
		BEGIN
			DECLARE @duration INT
			SET @operating_time = (CASE
							   WHEN (SELECT COUNT(*) FROM m_equipment WHERE equipment_id = @equipment_id) IS NULL
							   THEN (SELECT DATEDIFF(DAY, CONVERT(DATE,(SELECT created_date FROM m_equipment WHERE equipment_id = @equipment_id), 103), CONVERT(DATE, (SELECT start_date FROM equipment_repairment WHERE equipment_id = @equipment_id), 103)))
							   ELSE (SELECT DATEDIFF(DAY, CONVERT(DATE,(SELECT last_service FROM m_equipment WHERE equipment_id = @equipment_id), 103), CONVERT(DATE, @date, 103))) 
							   END)
			SET @duration = (SELECT DATEDIFF(DAY, CONVERT(DATE,(SELECT start_date FROM equipment_repairment WHERE equip_history_id = @repair_id), 103), CONVERT(DATE, @date, 103)))
			
			UPDATE equipment_repairment SET end_date = @date, status = @status, duration = @duration, updated_by = @created_by, updated_date = GETDATE() WHERE equip_history_id = @repair_id
			UPDATE m_equipment SET last_service = @date WHERE equipment_id = @equipment_id

			DECLARE @mttr DECIMAL(6,2)
			DECLARE @mttf DECIMAL(6,2)

			SET @mttr = (SELECT CONVERT(DECIMAL(6,2),(SELECT SUM(duration) FROM equipment_repairment WHERE equipment_id = @equipment_id)) / CONVERT(DECIMAL(6,2), (SELECT COUNT(*) FROM equipment_repairment WHERE equipment_id = @equipment_id)))
			SET @mttf = (SELECT CONVERT(DECIMAL(6,2), (SELECT SUM(operation_time) FROM equipment_repairment WHERE equipment_id = @equipment_id))  / CONVERT(DECIMAL(6,2), (SELECT COUNT(*) FROM equipment_repairment WHERE equipment_id = @equipment_id)))

			UPDATE m_equipment SET mttr = @mttr, mttf = @mttf WHERE equipment_id = @equipment_id
		END
	END
END
GO
