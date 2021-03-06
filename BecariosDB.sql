/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2014 (12.0.2000)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [BecariosDB]    Script Date: 02-Apr-18 11:44:10 PM ******/
CREATE DATABASE [BecariosDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BecariosDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS2014\MSSQL\DATA\BecariosDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BecariosDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS2014\MSSQL\DATA\BecariosDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BecariosDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BecariosDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BecariosDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BecariosDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BecariosDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BecariosDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BecariosDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BecariosDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BecariosDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BecariosDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BecariosDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BecariosDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BecariosDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BecariosDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BecariosDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BecariosDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BecariosDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BecariosDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BecariosDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BecariosDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BecariosDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BecariosDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BecariosDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BecariosDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BecariosDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BecariosDB] SET  MULTI_USER 
GO
ALTER DATABASE [BecariosDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BecariosDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BecariosDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BecariosDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BecariosDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BecariosDB]
GO
/****** Object:  Table [dbo].[Becarios]    Script Date: 02-Apr-18 11:44:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Becarios](
	[Id_Becario] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[ApellidoPaterno] [varchar](50) NOT NULL,
	[ApellidoMaterno] [varchar](50) NOT NULL,
	[Edad] [int] NOT NULL,
	[Promedio] [float] NOT NULL,
	[EsRegular] [bit] NOT NULL,
	[IngresoMensual] [float] NOT NULL,
	[EsBecadoProspera] [bit] NOT NULL,
	[Discapacidad] [bit] NOT NULL,
	[Id_Municipio] [int] NOT NULL,
	[EsBecado] [bit] NULL,
	[FechaEvaluacionbeca] [date] NULL,
 CONSTRAINT [PK_Becarios] PRIMARY KEY CLUSTERED 
(
	[Id_Becario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Municipio]    Script Date: 02-Apr-18 11:44:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Municipio](
	[Id_Municipio] [int] NOT NULL,
	[Estado] [varchar](50) NOT NULL,
	[NombreMunicipio] [varchar](50) NOT NULL,
	[Prioridad] [bit] NOT NULL,
	[FechaModificacionValores] [date] NULL,
 CONSTRAINT [PK_Municipio] PRIMARY KEY CLUSTERED 
(
	[Id_Municipio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Becarios]  WITH CHECK ADD  CONSTRAINT [FK_Becarios_Municipio] FOREIGN KEY([Id_Municipio])
REFERENCES [dbo].[Municipio] ([Id_Municipio])
GO
ALTER TABLE [dbo].[Becarios] CHECK CONSTRAINT [FK_Becarios_Municipio]
GO
USE [master]
GO
ALTER DATABASE [BecariosDB] SET  READ_WRITE 
GO
