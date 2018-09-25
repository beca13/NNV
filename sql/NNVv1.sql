USE [master]
GO
/****** Object:  Database [NNV]    Script Date: 9/25/2018 11:26:30 PM ******/
CREATE DATABASE [NNV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NNV_data1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\NNV_data1.mdf' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%), 
 FILEGROUP [Secondary] 
( NAME = N'NNV_data2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\NNV_data2.ndf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1%)
 LOG ON 
( NAME = N'NNV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\NNV_log.ldf' , SIZE = 5120KB , MAXSIZE = 71680KB , FILEGROWTH = 1024KB )
GO
ALTER DATABASE [NNV] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NNV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NNV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NNV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NNV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NNV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NNV] SET ARITHABORT OFF 
GO
ALTER DATABASE [NNV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NNV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NNV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NNV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NNV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NNV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NNV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NNV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NNV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NNV] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NNV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NNV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NNV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NNV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NNV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NNV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NNV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NNV] SET RECOVERY FULL 
GO
ALTER DATABASE [NNV] SET  MULTI_USER 
GO
ALTER DATABASE [NNV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NNV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NNV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NNV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NNV] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'NNV', N'ON'
GO
ALTER DATABASE [NNV] SET QUERY_STORE = OFF
GO
USE [NNV]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [NNV]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 9/25/2018 11:26:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 9/25/2018 11:26:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 9/25/2018 11:26:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 9/25/2018 11:26:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 9/25/2018 11:26:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 9/25/2018 11:26:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clanovi]    Script Date: 9/25/2018 11:26:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clanovi](
	[ClanID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](50) NOT NULL,
	[Prezime] [nvarchar](50) NOT NULL,
	[ImePrezime]  AS (([Ime]+' ')+[Prezime]) PERSISTED NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
	[KorisnickoIme] [nvarchar](40) NOT NULL,
	[Lozinka] [nvarchar](25) NOT NULL,
	[Uloga] [nvarchar](50) NULL,
 CONSTRAINT [PK_ClanID] PRIMARY KEY CLUSTERED 
(
	[ClanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_KorisnickoIme] UNIQUE NONCLUSTERED 
(
	[KorisnickoIme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prilozi]    Script Date: 9/25/2018 11:26:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prilozi](
	[PrilogID] [int] NOT NULL,
	[SednicaID] [int] NOT NULL,
	[DokumentID] [int] NOT NULL,
	[NazivPriloga] [nvarchar](max) NULL,
	[Putanja] [nvarchar](max) NULL,
	[Poslato] [bit] NULL,
	[DatumSlanja] [datetime2](7) NULL,
 CONSTRAINT [PK_PrilogID] PRIMARY KEY CLUSTERED 
(
	[PrilogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prisustvo]    Script Date: 9/25/2018 11:26:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prisustvo](
	[ClanID] [int] NOT NULL,
	[SednicaID] [int] NOT NULL,
	[Prisutan] [bit] NOT NULL,
	[Opravdano] [bit] NULL,
 CONSTRAINT [PK_CK_PrisustvoID] PRIMARY KEY CLUSTERED 
(
	[ClanID] ASC,
	[SednicaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sednice]    Script Date: 9/25/2018 11:26:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sednice](
	[SednicaID] [int] NOT NULL,
	[Datum] [datetime2](7) NOT NULL,
	[VrstaSednice] [nvarchar](20) NOT NULL,
	[Ucionica] [nvarchar](10) NULL,
	[Zapisnik] [nvarchar](max) NOT NULL,
	[Poziv] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SednicaID] PRIMARY KEY CLUSTERED 
(
	[SednicaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VrsteDokumenata]    Script Date: 9/25/2018 11:26:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VrsteDokumenata](
	[DokumentID] [int] IDENTITY(1,1) NOT NULL,
	[VrstaDokumenta] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_DokumentID] PRIMARY KEY CLUSTERED 
(
	[DokumentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 9/25/2018 11:26:31 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 9/25/2018 11:26:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 9/25/2018 11:26:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 9/25/2018 11:26:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 9/25/2018 11:26:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 9/25/2018 11:26:31 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Prilozi]  WITH CHECK ADD  CONSTRAINT [FK_DokumentID] FOREIGN KEY([DokumentID])
REFERENCES [dbo].[VrsteDokumenata] ([DokumentID])
GO
ALTER TABLE [dbo].[Prilozi] CHECK CONSTRAINT [FK_DokumentID]
GO
ALTER TABLE [dbo].[Prilozi]  WITH CHECK ADD  CONSTRAINT [FKK_SednicaID] FOREIGN KEY([SednicaID])
REFERENCES [dbo].[Sednice] ([SednicaID])
GO
ALTER TABLE [dbo].[Prilozi] CHECK CONSTRAINT [FKK_SednicaID]
GO
ALTER TABLE [dbo].[Prisustvo]  WITH CHECK ADD  CONSTRAINT [FK_ClanID] FOREIGN KEY([ClanID])
REFERENCES [dbo].[Clanovi] ([ClanID])
GO
ALTER TABLE [dbo].[Prisustvo] CHECK CONSTRAINT [FK_ClanID]
GO
ALTER TABLE [dbo].[Prisustvo]  WITH CHECK ADD  CONSTRAINT [FK_SednicaID] FOREIGN KEY([SednicaID])
REFERENCES [dbo].[Sednice] ([SednicaID])
GO
ALTER TABLE [dbo].[Prisustvo] CHECK CONSTRAINT [FK_SednicaID]
GO
ALTER TABLE [dbo].[Clanovi]  WITH CHECK ADD  CONSTRAINT [CHK_Lozinka] CHECK  ((len([Lozinka])>=(8) AND len([Lozinka])<=(25)))
GO
ALTER TABLE [dbo].[Clanovi] CHECK CONSTRAINT [CHK_Lozinka]
GO
USE [master]
GO
ALTER DATABASE [NNV] SET  READ_WRITE 
GO
