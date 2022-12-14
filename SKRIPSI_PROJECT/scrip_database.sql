USE [DB_SKRIPSI]
GO
/****** Object:  Table [dbo].[tn_m_area]    Script Date: 01/09/2022 20:08:21 ******/
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
/****** Object:  Table [dbo].[tn_m_dropdown]    Script Date: 01/09/2022 20:08:21 ******/
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
/****** Object:  Table [dbo].[tn_m_equipment]    Script Date: 01/09/2022 20:08:21 ******/
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
/****** Object:  Table [dbo].[tn_m_manufacture]    Script Date: 01/09/2022 20:08:21 ******/
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
/****** Object:  Table [dbo].[tn_m_material]    Script Date: 01/09/2022 20:08:21 ******/
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
/****** Object:  Table [dbo].[tn_u_login]    Script Date: 01/09/2022 20:08:21 ******/
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
/****** Object:  Table [dbo].[tn_users]    Script Date: 01/09/2022 20:08:21 ******/
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
SET IDENTITY_INSERT [dbo].[tn_m_dropdown] OFF
GO
SET IDENTITY_INSERT [dbo].[tn_m_manufacture] ON 

INSERT [dbo].[tn_m_manufacture] ([m_manu_id], [m_manu_code], [m_manu_name], [status], [created_by], [created_date]) VALUES (1, N'G.E', N'G.E', N'ACTIVE', 1, CAST(N'2022-07-24T15:26:08.937' AS DateTime))
INSERT [dbo].[tn_m_manufacture] ([m_manu_id], [m_manu_code], [m_manu_name], [status], [created_by], [created_date]) VALUES (2, N'SIEMENS', N'SIEMENS', N'ACTIVE', 1, CAST(N'2022-07-24T15:26:38.027' AS DateTime))
SET IDENTITY_INSERT [dbo].[tn_m_manufacture] OFF
GO
SET IDENTITY_INSERT [dbo].[tn_m_material] ON 

INSERT [dbo].[tn_m_material] ([m_material_id], [m_substance], [m_material_type], [m_material_code], [m_material_name], [status], [created_by], [created_date]) VALUES (3, N'BEARING', N'DE', N'SKF 6309Z', N'SKF 6309Z', N'ACTIVE', 1, CAST(N'2022-07-24T15:50:23.210' AS DateTime))
SET IDENTITY_INSERT [dbo].[tn_m_material] OFF
GO
SET IDENTITY_INSERT [dbo].[tn_u_login] ON 

INSERT [dbo].[tn_u_login] ([u_id], [u_name], [u_password], [u_role], [status], [created_by], [created_date]) VALUES (1, N'admin', N'L3bYml6rPGfulxWk6oFYP3IMfiu/EcqeqpQ9+SsCfhN4Gpc4JV2MEitjCrYmXZKKAnOOFziv3vvwsamJ6ULCqefOiPcJpPwfI0UnW9SpUjlgG5tyA1QXd9i2T5twG0Gb', N'ADMIN', N'ACTIVE', 1, NULL)
SET IDENTITY_INSERT [dbo].[tn_u_login] OFF
GO
ALTER TABLE [dbo].[tn_m_equipment]  WITH CHECK ADD  CONSTRAINT [FK__tn_m_equi__m_man__2E1BDC42] FOREIGN KEY([m_manufacture])
REFERENCES [dbo].[tn_m_manufacture] ([m_manu_id])
GO
ALTER TABLE [dbo].[tn_m_equipment] CHECK CONSTRAINT [FK__tn_m_equi__m_man__2E1BDC42]
GO
