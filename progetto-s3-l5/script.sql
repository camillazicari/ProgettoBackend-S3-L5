USE [master]
GO
/****** Object:  Database [Municipale]    Script Date: 28/02/2025 12:48:54 ******/
CREATE DATABASE [Municipale]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Municipale', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Municipale.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Municipale_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Municipale_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Municipale] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Municipale].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Municipale] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Municipale] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Municipale] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Municipale] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Municipale] SET ARITHABORT OFF 
GO
ALTER DATABASE [Municipale] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Municipale] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Municipale] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Municipale] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Municipale] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Municipale] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Municipale] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Municipale] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Municipale] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Municipale] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Municipale] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Municipale] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Municipale] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Municipale] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Municipale] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Municipale] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Municipale] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Municipale] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Municipale] SET  MULTI_USER 
GO
ALTER DATABASE [Municipale] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Municipale] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Municipale] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Municipale] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Municipale] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Municipale] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Municipale] SET QUERY_STORE = ON
GO
ALTER DATABASE [Municipale] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Municipale]
GO
/****** Object:  Table [dbo].[ANAGRAFICA]    Script Date: 28/02/2025 12:48:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ANAGRAFICA](
	[idanagrafica] [int] IDENTITY(1,1) NOT NULL,
	[Cognome] [varchar](20) NOT NULL,
	[Nome] [varchar](20) NOT NULL,
	[Indirizzo] [varchar](100) NOT NULL,
	[Città] [varchar](20) NOT NULL,
	[CAP] [varchar](5) NOT NULL,
	[Cod_Fisc] [varchar](16) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idanagrafica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Cod_Fisc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_VIOLAZIONE]    Script Date: 28/02/2025 12:48:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_VIOLAZIONE](
	[idviolazione] [int] IDENTITY(1,1) NOT NULL,
	[descrizione] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idviolazione] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VERBALE]    Script Date: 28/02/2025 12:48:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VERBALE](
	[idverbale] [int] IDENTITY(1,1) NOT NULL,
	[DataViolazione] [date] NOT NULL,
	[IndirizzoViolazione] [varchar](100) NOT NULL,
	[Nominativo_Agente] [varchar](20) NOT NULL,
	[DataTrascrizioneVerbale] [date] NOT NULL,
	[Importo] [money] NOT NULL,
	[DecurtamentoPunti] [int] NOT NULL,
	[idanagrafica] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idverbale] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VERBALE_VIOLAZIONE]    Script Date: 28/02/2025 12:48:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VERBALE_VIOLAZIONE](
	[id_verbale_violazione] [int] IDENTITY(1,1) NOT NULL,
	[idverbale] [int] NOT NULL,
	[idviolazione] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_verbale_violazione] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VERBALE]  WITH CHECK ADD  CONSTRAINT [FK_ID_ANAGRAFICA] FOREIGN KEY([idanagrafica])
REFERENCES [dbo].[ANAGRAFICA] ([idanagrafica])
GO
ALTER TABLE [dbo].[VERBALE] CHECK CONSTRAINT [FK_ID_ANAGRAFICA]
GO
ALTER TABLE [dbo].[VERBALE_VIOLAZIONE]  WITH CHECK ADD  CONSTRAINT [FK_ID_VERBALE] FOREIGN KEY([idverbale])
REFERENCES [dbo].[VERBALE] ([idverbale])
GO
ALTER TABLE [dbo].[VERBALE_VIOLAZIONE] CHECK CONSTRAINT [FK_ID_VERBALE]
GO
ALTER TABLE [dbo].[VERBALE_VIOLAZIONE]  WITH CHECK ADD  CONSTRAINT [FK_ID_VIOLAZIONE] FOREIGN KEY([idviolazione])
REFERENCES [dbo].[TIPO_VIOLAZIONE] ([idviolazione])
GO
ALTER TABLE [dbo].[VERBALE_VIOLAZIONE] CHECK CONSTRAINT [FK_ID_VIOLAZIONE]
GO
USE [master]
GO
ALTER DATABASE [Municipale] SET  READ_WRITE 
GO
