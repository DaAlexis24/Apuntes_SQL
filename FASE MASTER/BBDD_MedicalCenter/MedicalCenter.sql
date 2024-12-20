USE [master]
GO
/****** Object:  Database [MedicalCenter]    Script Date: 12/12/2024 14:39:16 ******/
CREATE DATABASE [MedicalCenter]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MedicalCenter', FILENAME = N'C:\SQLDATA\MedicalCenter\MedicalCenter.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MedicalCenter_log', FILENAME = N'C:\SQLDATA\MedicalCenter\MedicalCenter_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MedicalCenter] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MedicalCenter].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MedicalCenter] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MedicalCenter] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MedicalCenter] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MedicalCenter] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MedicalCenter] SET ARITHABORT OFF 
GO
ALTER DATABASE [MedicalCenter] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MedicalCenter] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MedicalCenter] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MedicalCenter] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MedicalCenter] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MedicalCenter] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MedicalCenter] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MedicalCenter] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MedicalCenter] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MedicalCenter] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MedicalCenter] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MedicalCenter] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MedicalCenter] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MedicalCenter] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MedicalCenter] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MedicalCenter] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MedicalCenter] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MedicalCenter] SET RECOVERY FULL 
GO
ALTER DATABASE [MedicalCenter] SET  MULTI_USER 
GO
ALTER DATABASE [MedicalCenter] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MedicalCenter] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MedicalCenter] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MedicalCenter] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MedicalCenter] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MedicalCenter] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MedicalCenter', N'ON'
GO
ALTER DATABASE [MedicalCenter] SET QUERY_STORE = ON
GO
ALTER DATABASE [MedicalCenter] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MedicalCenter]
GO
/****** Object:  UserDefinedDataType [dbo].[doctor]    Script Date: 12/12/2024 14:39:16 ******/
CREATE TYPE [dbo].[doctor] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[duty]    Script Date: 12/12/2024 14:39:16 ******/
CREATE TYPE [dbo].[duty] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[history]    Script Date: 12/12/2024 14:39:16 ******/
CREATE TYPE [dbo].[history] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[observation]    Script Date: 12/12/2024 14:39:16 ******/
CREATE TYPE [dbo].[observation] FROM [varchar](1000) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[patient]    Script Date: 12/12/2024 14:39:16 ******/
CREATE TYPE [dbo].[patient] FROM [int] NOT NULL
GO
/****** Object:  Table [dbo].[Concept]    Script Date: 12/12/2024 14:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Concept](
	[idConcept] [tinyint] IDENTITY(1,1) NOT NULL,
	[description] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idConcept] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 12/12/2024 14:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[idCountry] [char](3) NOT NULL,
	[country] [varchar](30) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[idCountry] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 12/12/2024 14:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[idDoctor] [dbo].[doctor] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[surname] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[idDoctor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoctorSpeciality]    Script Date: 12/12/2024 14:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorSpeciality](
	[idDoctor] [dbo].[doctor] NOT NULL,
	[idSpeciality] [int] NOT NULL,
	[description] [varchar](50) NULL,
 CONSTRAINT [PK_DoctorSpeciality] PRIMARY KEY CLUSTERED 
(
	[idDoctor] ASC,
	[idSpeciality] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Duty]    Script Date: 12/12/2024 14:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Duty](
	[idDuty] [dbo].[duty] IDENTITY(1,1) NOT NULL,
	[dutyTime] [datetime] NULL,
	[state] [smallint] NULL,
	[observation] [dbo].[observation] NULL,
 CONSTRAINT [PK_Duty] PRIMARY KEY CLUSTERED 
(
	[idDuty] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[History]    Script Date: 12/12/2024 14:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[idHistory] [dbo].[history] IDENTITY(1,1) NOT NULL,
	[timeLog] [datetime] NOT NULL,
	[observation] [dbo].[observation] NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[idHistory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 12/12/2024 14:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[idPatient] [dbo].[patient] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[surname] [varchar](50) NOT NULL,
	[birthday] [date] NOT NULL,
	[address] [varchar](50) NOT NULL,
	[idCountry] [char](3) NULL,
	[phoneNumber] [varchar](20) NULL,
	[email] [varchar](50) NOT NULL,
	[observation] [dbo].[observation] NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[idPatient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientDuty]    Script Date: 12/12/2024 14:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientDuty](
	[idDuty] [dbo].[duty] NOT NULL,
	[idPatient] [dbo].[patient] NOT NULL,
	[idDoctor] [dbo].[doctor] NOT NULL,
 CONSTRAINT [PK_PatientDuty] PRIMARY KEY CLUSTERED 
(
	[idDuty] ASC,
	[idPatient] ASC,
	[idDoctor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientHistory]    Script Date: 12/12/2024 14:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientHistory](
	[idHistory] [dbo].[history] NOT NULL,
	[idPatient] [dbo].[patient] NOT NULL,
	[idDoctor] [dbo].[doctor] NOT NULL,
 CONSTRAINT [PK_PatientHistory] PRIMARY KEY CLUSTERED 
(
	[idHistory] ASC,
	[idPatient] ASC,
	[idDoctor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientPayment]    Script Date: 12/12/2024 14:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientPayment](
	[idPayment] [int] NOT NULL,
	[idPatient] [dbo].[patient] NOT NULL,
	[idDuty] [dbo].[duty] NOT NULL,
 CONSTRAINT [PK__PatientP__070F4B64DC4F1E75] PRIMARY KEY CLUSTERED 
(
	[idPayment] ASC,
	[idPatient] ASC,
	[idDuty] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 12/12/2024 14:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[idPayment] [int] IDENTITY(1,1) NOT NULL,
	[concept] [tinyint] NOT NULL,
	[datePayment] [datetime] NOT NULL,
	[amount] [money] NOT NULL,
	[state] [tinyint] NULL,
	[observation] [dbo].[observation] NULL,
 CONSTRAINT [PK__Payment__F22D4A4519DFD74C] PRIMARY KEY CLUSTERED 
(
	[idPayment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Speciality]    Script Date: 12/12/2024 14:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speciality](
	[idSpeciality] [int] IDENTITY(1,1) NOT NULL,
	[speciality] [varchar](50) NULL,
 CONSTRAINT [PK_Speciality] PRIMARY KEY CLUSTERED 
(
	[idSpeciality] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StateDuty]    Script Date: 12/12/2024 14:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StateDuty](
	[idState] [smallint] IDENTITY(1,1) NOT NULL,
	[description] [varchar](50) NULL,
 CONSTRAINT [PK_StateDuty] PRIMARY KEY CLUSTERED 
(
	[idState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Concept] ON 

INSERT [dbo].[Concept] ([idConcept], [description]) VALUES (1, N'Laboratorio')
INSERT [dbo].[Concept] ([idConcept], [description]) VALUES (2, N'Radiografía')
SET IDENTITY_INSERT [dbo].[Concept] OFF
GO
INSERT [dbo].[Country] ([idCountry], [country]) VALUES (N'ARG', N'Argentina')
INSERT [dbo].[Country] ([idCountry], [country]) VALUES (N'BRA', N'Brasil')
INSERT [dbo].[Country] ([idCountry], [country]) VALUES (N'COL', N'Colombia')
INSERT [dbo].[Country] ([idCountry], [country]) VALUES (N'ESP', N'España')
INSERT [dbo].[Country] ([idCountry], [country]) VALUES (N'MEX', N'México')
INSERT [dbo].[Country] ([idCountry], [country]) VALUES (N'PER', N'Perú')
GO
SET IDENTITY_INSERT [dbo].[Doctor] ON 

INSERT [dbo].[Doctor] ([idDoctor], [name], [surname]) VALUES (1, N'Rafael', N'Castelo')
SET IDENTITY_INSERT [dbo].[Doctor] OFF
GO
SET IDENTITY_INSERT [dbo].[Duty] ON 

INSERT [dbo].[Duty] ([idDuty], [dutyTime], [state], [observation]) VALUES (4, CAST(N'2023-03-15T00:00:00.000' AS DateTime), 0, N'Paciente en ayunas')
INSERT [dbo].[Duty] ([idDuty], [dutyTime], [state], [observation]) VALUES (6, CAST(N'2019-01-22T10:00:00.000' AS DateTime), 0, N'Turno pendiente de aprobación')
SET IDENTITY_INSERT [dbo].[Duty] OFF
GO
SET IDENTITY_INSERT [dbo].[Patient] ON 

INSERT [dbo].[Patient] ([idPatient], [name], [surname], [birthday], [address], [idCountry], [phoneNumber], [email], [observation]) VALUES (1, N'Jorge', N'Ramirez', CAST(N'2019-01-18' AS Date), N'Calle 23, 1512', N'COL', NULL, N'jorge@gmail.com', N'Sin observación')
INSERT [dbo].[Patient] ([idPatient], [name], [surname], [birthday], [address], [idCountry], [phoneNumber], [email], [observation]) VALUES (6, N'Carlos ', N'Lopez', CAST(N'2002-02-19' AS Date), N'Calle Mendez, 67', N'MEX', NULL, N'correo@mail.com', N'Sin observación')
INSERT [dbo].[Patient] ([idPatient], [name], [surname], [birthday], [address], [idCountry], [phoneNumber], [email], [observation]) VALUES (7, N'Claudio', N'Lopez', CAST(N'2019-02-18' AS Date), N'Calle Piedras, 2056', N'ARG', NULL, N'clopez@gmail.com', N'Sin observación')
INSERT [dbo].[Patient] ([idPatient], [name], [surname], [birthday], [address], [idCountry], [phoneNumber], [email], [observation]) VALUES (8, N'Carlos ', N'Ramirez', CAST(N'1982-07-05' AS Date), N'Calle Christian Dominguez 3', N'COL', NULL, N'cramirez@gmail.com', N'Sin observación')
INSERT [dbo].[Patient] ([idPatient], [name], [surname], [birthday], [address], [idCountry], [phoneNumber], [email], [observation]) VALUES (9, N'Leandro', N'Paredes', CAST(N'1982-05-20' AS Date), N'Calle Piedras 150', N'ARG', NULL, N'leandro@gmail.com', N'Sin observación')
SET IDENTITY_INSERT [dbo].[Patient] OFF
GO
INSERT [dbo].[PatientDuty] ([idDuty], [idPatient], [idDoctor]) VALUES (6, 9, 1)
GO
INSERT [dbo].[PatientPayment] ([idPayment], [idPatient], [idDuty]) VALUES (5, 6, 4)
INSERT [dbo].[PatientPayment] ([idPayment], [idPatient], [idDuty]) VALUES (6, 8, 4)
INSERT [dbo].[PatientPayment] ([idPayment], [idPatient], [idDuty]) VALUES (7, 1, 4)
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([idPayment], [concept], [datePayment], [amount], [state], [observation]) VALUES (5, 1, CAST(N'2019-02-15T00:00:00.000' AS DateTime), 4500.0000, 0, N'Pago Pendiente')
INSERT [dbo].[Payment] ([idPayment], [concept], [datePayment], [amount], [state], [observation]) VALUES (6, 2, CAST(N'2019-05-20T00:00:00.000' AS DateTime), 6800.0000, 0, N'Pago Pendiente')
INSERT [dbo].[Payment] ([idPayment], [concept], [datePayment], [amount], [state], [observation]) VALUES (7, 1, CAST(N'2019-09-27T00:00:00.000' AS DateTime), 5600.0000, 0, N'Pago Pendiente')
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Speciality] ON 

INSERT [dbo].[Speciality] ([idSpeciality], [speciality]) VALUES (1, N'Traumatología')
INSERT [dbo].[Speciality] ([idSpeciality], [speciality]) VALUES (2, N'Clínica Médica')
INSERT [dbo].[Speciality] ([idSpeciality], [speciality]) VALUES (3, N'Gastroenterología')
INSERT [dbo].[Speciality] ([idSpeciality], [speciality]) VALUES (4, N'Pediatría')
SET IDENTITY_INSERT [dbo].[Speciality] OFF
GO
SET IDENTITY_INSERT [dbo].[StateDuty] ON 

INSERT [dbo].[StateDuty] ([idState], [description]) VALUES (0, N'Pendiente')
INSERT [dbo].[StateDuty] ([idState], [description]) VALUES (1, N'Realizado')
INSERT [dbo].[StateDuty] ([idState], [description]) VALUES (2, N'Cancelado')
INSERT [dbo].[StateDuty] ([idState], [description]) VALUES (3, N'Rechazado')
INSERT [dbo].[StateDuty] ([idState], [description]) VALUES (4, N'Postergado')
INSERT [dbo].[StateDuty] ([idState], [description]) VALUES (5, N'Anulado')
INSERT [dbo].[StateDuty] ([idState], [description]) VALUES (6, N'Derivado')
SET IDENTITY_INSERT [dbo].[StateDuty] OFF
GO
ALTER TABLE [dbo].[DoctorSpeciality]  WITH CHECK ADD  CONSTRAINT [FK_DoctorSpeciality_Doctor] FOREIGN KEY([idDoctor])
REFERENCES [dbo].[Doctor] ([idDoctor])
GO
ALTER TABLE [dbo].[DoctorSpeciality] CHECK CONSTRAINT [FK_DoctorSpeciality_Doctor]
GO
ALTER TABLE [dbo].[DoctorSpeciality]  WITH CHECK ADD  CONSTRAINT [FK_DoctorSpeciality_Speciality] FOREIGN KEY([idSpeciality])
REFERENCES [dbo].[Speciality] ([idSpeciality])
GO
ALTER TABLE [dbo].[DoctorSpeciality] CHECK CONSTRAINT [FK_DoctorSpeciality_Speciality]
GO
ALTER TABLE [dbo].[Duty]  WITH CHECK ADD  CONSTRAINT [FK_Duty_StateDuty] FOREIGN KEY([state])
REFERENCES [dbo].[StateDuty] ([idState])
GO
ALTER TABLE [dbo].[Duty] CHECK CONSTRAINT [FK_Duty_StateDuty]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Country] FOREIGN KEY([idCountry])
REFERENCES [dbo].[Country] ([idCountry])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Country]
GO
ALTER TABLE [dbo].[PatientDuty]  WITH CHECK ADD  CONSTRAINT [FK_PatientDuty_Doctor] FOREIGN KEY([idDoctor])
REFERENCES [dbo].[Doctor] ([idDoctor])
GO
ALTER TABLE [dbo].[PatientDuty] CHECK CONSTRAINT [FK_PatientDuty_Doctor]
GO
ALTER TABLE [dbo].[PatientDuty]  WITH CHECK ADD  CONSTRAINT [FK_PatientDuty_Duty] FOREIGN KEY([idDuty])
REFERENCES [dbo].[Duty] ([idDuty])
GO
ALTER TABLE [dbo].[PatientDuty] CHECK CONSTRAINT [FK_PatientDuty_Duty]
GO
ALTER TABLE [dbo].[PatientDuty]  WITH CHECK ADD  CONSTRAINT [FK_PatientDuty_Patient] FOREIGN KEY([idPatient])
REFERENCES [dbo].[Patient] ([idPatient])
GO
ALTER TABLE [dbo].[PatientDuty] CHECK CONSTRAINT [FK_PatientDuty_Patient]
GO
ALTER TABLE [dbo].[PatientHistory]  WITH CHECK ADD  CONSTRAINT [FK_PatientHistory_Doctor] FOREIGN KEY([idDoctor])
REFERENCES [dbo].[Doctor] ([idDoctor])
GO
ALTER TABLE [dbo].[PatientHistory] CHECK CONSTRAINT [FK_PatientHistory_Doctor]
GO
ALTER TABLE [dbo].[PatientHistory]  WITH CHECK ADD  CONSTRAINT [FK_PatientHistory_History] FOREIGN KEY([idHistory])
REFERENCES [dbo].[History] ([idHistory])
GO
ALTER TABLE [dbo].[PatientHistory] CHECK CONSTRAINT [FK_PatientHistory_History]
GO
ALTER TABLE [dbo].[PatientHistory]  WITH CHECK ADD  CONSTRAINT [FK_PatientHistory_Patient] FOREIGN KEY([idPatient])
REFERENCES [dbo].[Patient] ([idPatient])
GO
ALTER TABLE [dbo].[PatientHistory] CHECK CONSTRAINT [FK_PatientHistory_Patient]
GO
ALTER TABLE [dbo].[PatientPayment]  WITH CHECK ADD  CONSTRAINT [FK_PatientPayment_Duty] FOREIGN KEY([idDuty])
REFERENCES [dbo].[Duty] ([idDuty])
GO
ALTER TABLE [dbo].[PatientPayment] CHECK CONSTRAINT [FK_PatientPayment_Duty]
GO
ALTER TABLE [dbo].[PatientPayment]  WITH CHECK ADD  CONSTRAINT [FK_PatientPayment_Patient] FOREIGN KEY([idPatient])
REFERENCES [dbo].[Patient] ([idPatient])
GO
ALTER TABLE [dbo].[PatientPayment] CHECK CONSTRAINT [FK_PatientPayment_Patient]
GO
ALTER TABLE [dbo].[PatientPayment]  WITH CHECK ADD  CONSTRAINT [FK_PatientPayment_Payment] FOREIGN KEY([idPayment])
REFERENCES [dbo].[Payment] ([idPayment])
GO
ALTER TABLE [dbo].[PatientPayment] CHECK CONSTRAINT [FK_PatientPayment_Payment]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Concept] FOREIGN KEY([concept])
REFERENCES [dbo].[Concept] ([idConcept])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Concept]
GO
USE [master]
GO
ALTER DATABASE [MedicalCenter] SET  READ_WRITE 
GO
