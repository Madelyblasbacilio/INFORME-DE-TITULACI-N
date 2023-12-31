USE [master]
GO
/****** Object:  Database [BDLOUISPASTEUR]    Script Date: 26/11/2023 21:49:49 ******/
CREATE DATABASE [BDLOUISPASTEUR]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDLOUISPASTEUR', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MADELYBLAS\MSSQL\DATA\BDLOUISPASTEUR.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BDLOUISPASTEUR_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MADELYBLAS\MSSQL\DATA\BDLOUISPASTEUR_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BDLOUISPASTEUR] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDLOUISPASTEUR].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDLOUISPASTEUR] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDLOUISPASTEUR] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDLOUISPASTEUR] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDLOUISPASTEUR] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDLOUISPASTEUR] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDLOUISPASTEUR] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDLOUISPASTEUR] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDLOUISPASTEUR] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDLOUISPASTEUR] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDLOUISPASTEUR] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDLOUISPASTEUR] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDLOUISPASTEUR] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDLOUISPASTEUR] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDLOUISPASTEUR] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDLOUISPASTEUR] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDLOUISPASTEUR] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDLOUISPASTEUR] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDLOUISPASTEUR] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDLOUISPASTEUR] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDLOUISPASTEUR] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDLOUISPASTEUR] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDLOUISPASTEUR] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDLOUISPASTEUR] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BDLOUISPASTEUR] SET  MULTI_USER 
GO
ALTER DATABASE [BDLOUISPASTEUR] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDLOUISPASTEUR] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDLOUISPASTEUR] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDLOUISPASTEUR] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BDLOUISPASTEUR] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BDLOUISPASTEUR]
GO
/****** Object:  Table [dbo].[Almacen]    Script Date: 26/11/2023 21:49:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Almacen](
	[IDArticulo] [varchar](5) NOT NULL,
	[StockActual] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Articulos]    Script Date: 26/11/2023 21:49:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Articulos](
	[IDArticulo] [varchar](5) NOT NULL,
	[NombreA] [varchar](max) NOT NULL,
	[DescripcionA] [varchar](max) NULL,
	[Serie] [varchar](50) NULL,
	[IDCategoria] [varchar](5) NOT NULL,
 CONSTRAINT [PK_Articulos] PRIMARY KEY CLUSTERED 
(
	[IDArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 26/11/2023 21:49:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categorias](
	[IDCategoria] [varchar](5) NOT NULL,
	[NombreC] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[IDCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetalleEntrada]    Script Date: 26/11/2023 21:49:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetalleEntrada](
	[IDEntrada] [varchar](5) NOT NULL,
	[IDArticulo] [varchar](5) NULL,
	[Cantidad] [int] NULL,
	[Observaciones] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetalleSalida]    Script Date: 26/11/2023 21:49:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetalleSalida](
	[IDSalida] [varchar](5) NULL,
	[IDArticulo] [varchar](5) NULL,
	[Cantidad] [varchar](10) NULL,
	[Observaciones] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Entradas]    Script Date: 26/11/2023 21:49:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Entradas](
	[IDEntrada] [varchar](5) NOT NULL,
	[FechaEntrada] [datetime] NULL,
	[IDUsuario] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDEntrada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 26/11/2023 21:49:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[IDRol] [int] IDENTITY(1,1) NOT NULL,
	[NombreRol] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[IDRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Salidas]    Script Date: 26/11/2023 21:49:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Salidas](
	[IDSalida] [varchar](5) NOT NULL,
	[FechaSalida] [datetime] NULL,
	[IDUsuario] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDSalida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 26/11/2023 21:49:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IDusuario] [varchar](5) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[DNI] [varchar](8) NULL,
	[Email] [varchar](50) NULL,
	[Telefono] [varchar](20) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IDusuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsuariosRoles]    Script Date: 26/11/2023 21:49:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsuariosRoles](
	[IDusuario] [varchar](5) NOT NULL,
	[IDRol] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Almacen] ([IDArticulo], [StockActual]) VALUES (N'A0001', 8)
INSERT [dbo].[Almacen] ([IDArticulo], [StockActual]) VALUES (N'A0002', 9)
INSERT [dbo].[Almacen] ([IDArticulo], [StockActual]) VALUES (N'A0015', 2)
INSERT [dbo].[Almacen] ([IDArticulo], [StockActual]) VALUES (N'A0021', 4)
INSERT [dbo].[Almacen] ([IDArticulo], [StockActual]) VALUES (N'A0005', 1)
INSERT [dbo].[Almacen] ([IDArticulo], [StockActual]) VALUES (N'A0007', 14)
INSERT [dbo].[Almacen] ([IDArticulo], [StockActual]) VALUES (N'A0009', 3)
INSERT [dbo].[Almacen] ([IDArticulo], [StockActual]) VALUES (N'A0011', 1)
INSERT [dbo].[Almacen] ([IDArticulo], [StockActual]) VALUES (N'A0006', 1)
INSERT [dbo].[Almacen] ([IDArticulo], [StockActual]) VALUES (N'A0008', 9)
INSERT [dbo].[Almacen] ([IDArticulo], [StockActual]) VALUES (N'A0013', 18)
INSERT [dbo].[Almacen] ([IDArticulo], [StockActual]) VALUES (N'A0016', 5)
INSERT [dbo].[Almacen] ([IDArticulo], [StockActual]) VALUES (N'A0017', 3)
INSERT [dbo].[Almacen] ([IDArticulo], [StockActual]) VALUES (N'A0020', 8)
INSERT [dbo].[Almacen] ([IDArticulo], [StockActual]) VALUES (N'A0014', 3)
INSERT [dbo].[Almacen] ([IDArticulo], [StockActual]) VALUES (N'A0019', 8)
INSERT [dbo].[Almacen] ([IDArticulo], [StockActual]) VALUES (N'A0004', 18)
INSERT [dbo].[Almacen] ([IDArticulo], [StockActual]) VALUES (N'A0003', 31)
INSERT [dbo].[Almacen] ([IDArticulo], [StockActual]) VALUES (N'A0010', 19)
INSERT [dbo].[Articulos] ([IDArticulo], [NombreA], [DescripcionA], [Serie], [IDCategoria]) VALUES (N'A0001', N'Papel Bond', N'1/2 Ciento', N'No cuenta con Serie', N'C0001')
INSERT [dbo].[Articulos] ([IDArticulo], [NombreA], [DescripcionA], [Serie], [IDCategoria]) VALUES (N'A0002', N'Papel de Fotocopia', N'Tamaño A4', N'No cuenta con Serie', N'C0001')
INSERT [dbo].[Articulos] ([IDArticulo], [NombreA], [DescripcionA], [Serie], [IDCategoria]) VALUES (N'A0003', N'Frascos de Silicona', N'Unidad', N'No cuenta con Serie', N'C0001')
INSERT [dbo].[Articulos] ([IDArticulo], [NombreA], [DescripcionA], [Serie], [IDCategoria]) VALUES (N'A0004', N'Plumon Indeleble Color Negro', N'Unidad', N'No cuenta con Serie', N'C0001')
INSERT [dbo].[Articulos] ([IDArticulo], [NombreA], [DescripcionA], [Serie], [IDCategoria]) VALUES (N'A0005', N'Plumón para Pizarra', N'Unidad', N'No cuenta con Serie', N'C0001')
INSERT [dbo].[Articulos] ([IDArticulo], [NombreA], [DescripcionA], [Serie], [IDCategoria]) VALUES (N'A0006', N'Cartuchos de plumón', N'Unidad', N'No cuenta con Serie', N'C0001')
INSERT [dbo].[Articulos] ([IDArticulo], [NombreA], [DescripcionA], [Serie], [IDCategoria]) VALUES (N'A0007', N'Barras de Silicona Delgada', N'Unidad', N'No cuenta con Serie', N'C0001')
INSERT [dbo].[Articulos] ([IDArticulo], [NombreA], [DescripcionA], [Serie], [IDCategoria]) VALUES (N'A0008', N'Cinta Masking de Color', N'Unidad', N'No cuenta con Serie', N'C0001')
INSERT [dbo].[Articulos] ([IDArticulo], [NombreA], [DescripcionA], [Serie], [IDCategoria]) VALUES (N'A0009', N'Cinta Masking Normal', N'Unidad', N'No cuenta con Serie', N'C0001')
INSERT [dbo].[Articulos] ([IDArticulo], [NombreA], [DescripcionA], [Serie], [IDCategoria]) VALUES (N'A0010', N'Cinta de Embalaje Negra', N'Unidad', N'No cuenta con Serie', N'C0001')
INSERT [dbo].[Articulos] ([IDArticulo], [NombreA], [DescripcionA], [Serie], [IDCategoria]) VALUES (N'A0011', N'Papel Metalico', N'Por Metros', N'No cuenta con Serie', N'C0001')
INSERT [dbo].[Articulos] ([IDArticulo], [NombreA], [DescripcionA], [Serie], [IDCategoria]) VALUES (N'A0012', N'Plancha de Microporoso', N'Unidad', N'No cuenta con Serie', N'C0001')
INSERT [dbo].[Articulos] ([IDArticulo], [NombreA], [DescripcionA], [Serie], [IDCategoria]) VALUES (N'A0013', N'Plancha de Microporoso Escarchado', N'Unidad', N'No cuenta con Serie', N'C0001')
INSERT [dbo].[Articulos] ([IDArticulo], [NombreA], [DescripcionA], [Serie], [IDCategoria]) VALUES (N'A0014', N'Bolsa de Globos de Color', N'Unidad', N'No cuenta con Serie', N'C0001')
INSERT [dbo].[Articulos] ([IDArticulo], [NombreA], [DescripcionA], [Serie], [IDCategoria]) VALUES (N'A0015', N'Globos Satinados', N'Por Docena', N'No cuenta con Serie', N'C0001')
INSERT [dbo].[Articulos] ([IDArticulo], [NombreA], [DescripcionA], [Serie], [IDCategoria]) VALUES (N'A0016', N'Papelografo Cuadriculado', N'Por Plieges', N'No cuenta con Serie', N'C0001')
INSERT [dbo].[Articulos] ([IDArticulo], [NombreA], [DescripcionA], [Serie], [IDCategoria]) VALUES (N'A0017', N'Limpiatipo', N'Unidad', N'No cuenta con Serie', N'C0001')
INSERT [dbo].[Articulos] ([IDArticulo], [NombreA], [DescripcionA], [Serie], [IDCategoria]) VALUES (N'A0018', N'Alfileres', N'Por Caja', N'No cuenta con Serie', N'C0001')
INSERT [dbo].[Articulos] ([IDArticulo], [NombreA], [DescripcionA], [Serie], [IDCategoria]) VALUES (N'A0019', N'Frasco de Temperas a Color', N'Por Unidad', N'No cuenta con Serie', N'C0001')
INSERT [dbo].[Articulos] ([IDArticulo], [NombreA], [DescripcionA], [Serie], [IDCategoria]) VALUES (N'A0020', N'Diamantina', N'1/4', N'No cuenta con Serie', N'C0001')
INSERT [dbo].[Articulos] ([IDArticulo], [NombreA], [DescripcionA], [Serie], [IDCategoria]) VALUES (N'A0021', N'Jabón ', N'Unidad', N'No cuenta con Serie', N'C0002')
INSERT [dbo].[Categorias] ([IDCategoria], [NombreC]) VALUES (N'C0001', N'Utiles Escolares')
INSERT [dbo].[Categorias] ([IDCategoria], [NombreC]) VALUES (N'C0002', N'Articulos de Aseo')
INSERT [dbo].[Categorias] ([IDCategoria], [NombreC]) VALUES (N'C0003', N'Articulos de Limpieza')
INSERT [dbo].[Categorias] ([IDCategoria], [NombreC]) VALUES (N'C0004', N'Implementos Deportivos')
INSERT [dbo].[DetalleEntrada] ([IDEntrada], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'E0001', N'A0001', 1, N'- Sin Observaciones -')
INSERT [dbo].[DetalleEntrada] ([IDEntrada], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'E0001', N'A0002', 1, N'- Sin Observaciones -')
INSERT [dbo].[DetalleEntrada] ([IDEntrada], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'E0001', N'A0015', 1, N'- Sin Observaciones -')
INSERT [dbo].[DetalleEntrada] ([IDEntrada], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'E0001', N'A0021', 10, N'- Sin Observaciones -')
INSERT [dbo].[DetalleEntrada] ([IDEntrada], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'E0002', N'A0005', 2, N'Sin Observaciones')
INSERT [dbo].[DetalleEntrada] ([IDEntrada], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'E0002', N'A0007', 7, N'- Sin Observaciones -')
INSERT [dbo].[DetalleEntrada] ([IDEntrada], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'E0002', N'A0009', 3, N'- Sin Observaciones -')
INSERT [dbo].[DetalleEntrada] ([IDEntrada], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'E0003', N'A0011', 2, N'- Sin Observaciones -')
INSERT [dbo].[DetalleEntrada] ([IDEntrada], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'E0003', N'A0015', 1, N'- Sin Observaciones -')
INSERT [dbo].[DetalleEntrada] ([IDEntrada], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'E0003', N'A0007', 10, N'- Sin Observaciones -')
INSERT [dbo].[DetalleEntrada] ([IDEntrada], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'E0003', N'A0006', 12, N'- Sin Observaciones -')
INSERT [dbo].[DetalleEntrada] ([IDEntrada], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'E0003', N'A0008', 9, N'- Sin Observaciones -')
INSERT [dbo].[DetalleEntrada] ([IDEntrada], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'E0003', N'A0002', 13, N'- Sin Observaciones -')
INSERT [dbo].[DetalleEntrada] ([IDEntrada], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'E0005', N'A0007', 13, N'- Sin Observaciones -')
INSERT [dbo].[DetalleEntrada] ([IDEntrada], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'E0005', N'A0005', 2, N'- Sin Observaciones -')
INSERT [dbo].[DetalleEntrada] ([IDEntrada], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'E0006', N'A0013', 20, N'De la alumna Mía Contreras Frontado (5ºA)')
INSERT [dbo].[DetalleEntrada] ([IDEntrada], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'E0006', N'A0016', 5, N'De la alumna Mía Contreras Frontado (5ºA)')
INSERT [dbo].[DetalleEntrada] ([IDEntrada], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'E0006', N'A0017', 3, N'De la alumna Mía Contreras Frontado (5ºA)')
INSERT [dbo].[DetalleEntrada] ([IDEntrada], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'E0006', N'A0020', 10, N'De la alumna Mía Contreras Frontado (5ºA)')
INSERT [dbo].[DetalleEntrada] ([IDEntrada], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'E0006', N'A0014', 3, N'De la alumna Mía Contreras Frontado (5ºA)')
INSERT [dbo].[DetalleEntrada] ([IDEntrada], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'E0006', N'A0019', 8, N'De la alumna Mía Contreras Frontado (5ºA)')
INSERT [dbo].[DetalleEntrada] ([IDEntrada], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'E0007', N'A0003', 3, N'De la estudiante Karla Alvarado Contreras')
INSERT [dbo].[DetalleEntrada] ([IDEntrada], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'E0008', N'A0004', 7, N'Alumna Angie Nolasco Briceño')
INSERT [dbo].[DetalleEntrada] ([IDEntrada], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'E0008', N'A0001', 8, N'Alumna Angie Nolasco Briceño')
INSERT [dbo].[DetalleEntrada] ([IDEntrada], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'E0004', N'A0004', 11, N'- Sin Observaciones -')
INSERT [dbo].[DetalleEntrada] ([IDEntrada], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'E0004', N'A0003', 30, N'- Sin Observaciones -')
INSERT [dbo].[DetalleEntrada] ([IDEntrada], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'E0004', N'A0010', 20, N'- Sin Observaciones -')
INSERT [dbo].[DetalleSalida] ([IDSalida], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'S0001', N'A0001', N'1', N'Para 5º A')
INSERT [dbo].[DetalleSalida] ([IDSalida], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'S0001', N'A0021', N'2', N'Para Psicología')
INSERT [dbo].[DetalleSalida] ([IDSalida], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'S0001', N'A0002', N'1', N'Para 6ºA')
INSERT [dbo].[DetalleSalida] ([IDSalida], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'S0002', N'A0007', N'3', N'Para 5ºA')
INSERT [dbo].[DetalleSalida] ([IDSalida], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'S0002', N'A0021', N'1', N'Para 5ºA')
INSERT [dbo].[DetalleSalida] ([IDSalida], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'S0003', N'A0006', N'11', N'- Sin Observaciones -')
INSERT [dbo].[DetalleSalida] ([IDSalida], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'S0004', N'A0021', N'2', N'xyz')
INSERT [dbo].[DetalleSalida] ([IDSalida], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'S0004', N'A0002', N'2', N'- Sin Observaciones -')
INSERT [dbo].[DetalleSalida] ([IDSalida], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'S0005', N'A0007', N'5', N'- Sin Observaciones -')
INSERT [dbo].[DetalleSalida] ([IDSalida], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'S0006', N'A0002', N'2', N'Para 1º A')
INSERT [dbo].[DetalleSalida] ([IDSalida], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'S0006', N'A0007', N'5', N'Para 5 el aula de 5 años')
INSERT [dbo].[DetalleSalida] ([IDSalida], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'S0006', N'A0010', N'1', N'Para los alumnos de 3ºB de Secundaria')
INSERT [dbo].[DetalleSalida] ([IDSalida], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'S0007', N'A0003', N'2', N'Para la maestra Susan del aula de 5 años.')
INSERT [dbo].[DetalleSalida] ([IDSalida], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'S0007', N'A0005', N'3', N'Para el profesor de Aritmética')
INSERT [dbo].[DetalleSalida] ([IDSalida], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'S0007', N'A0021', N'1', N'Para 1ºA de primaria')
INSERT [dbo].[DetalleSalida] ([IDSalida], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'S0007', N'A0011', N'1', N'Para el área de psicología')
INSERT [dbo].[DetalleSalida] ([IDSalida], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'S0008', N'A0007', N'3', N'Para la maestra Madely Blas')
INSERT [dbo].[DetalleSalida] ([IDSalida], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'S0008', N'A0020', N'1', N'- Sin Observaciones -')
INSERT [dbo].[DetalleSalida] ([IDSalida], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'S0009', N'A0020', N'1', N'Salio para la profesora Tatiana Rios ')
INSERT [dbo].[DetalleSalida] ([IDSalida], [IDArticulo], [Cantidad], [Observaciones]) VALUES (N'S0009', N'A0013', N'2', N'Salio para la profesora Tatiana Rios ')
INSERT [dbo].[Entradas] ([IDEntrada], [FechaEntrada], [IDUsuario]) VALUES (N'E0001', CAST(N'2023-11-19 19:57:44.217' AS DateTime), N'U0001')
INSERT [dbo].[Entradas] ([IDEntrada], [FechaEntrada], [IDUsuario]) VALUES (N'E0002', CAST(N'2023-11-19 20:52:20.807' AS DateTime), N'U0002')
INSERT [dbo].[Entradas] ([IDEntrada], [FechaEntrada], [IDUsuario]) VALUES (N'E0003', CAST(N'2023-11-19 22:02:29.737' AS DateTime), N'U0001')
INSERT [dbo].[Entradas] ([IDEntrada], [FechaEntrada], [IDUsuario]) VALUES (N'E0004', CAST(N'2023-11-19 22:05:18.377' AS DateTime), N'U0002')
INSERT [dbo].[Entradas] ([IDEntrada], [FechaEntrada], [IDUsuario]) VALUES (N'E0005', CAST(N'2023-11-20 12:12:05.600' AS DateTime), N'U0002')
INSERT [dbo].[Entradas] ([IDEntrada], [FechaEntrada], [IDUsuario]) VALUES (N'E0006', CAST(N'2023-11-22 22:01:27.073' AS DateTime), N'U0002')
INSERT [dbo].[Entradas] ([IDEntrada], [FechaEntrada], [IDUsuario]) VALUES (N'E0007', CAST(N'2023-11-23 13:14:48.913' AS DateTime), N'U0002')
INSERT [dbo].[Entradas] ([IDEntrada], [FechaEntrada], [IDUsuario]) VALUES (N'E0008', CAST(N'2023-11-23 14:57:44.943' AS DateTime), N'U0001')
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([IDRol], [NombreRol]) VALUES (1, N'Administrador')
INSERT [dbo].[Roles] ([IDRol], [NombreRol]) VALUES (2, N'Almacenero')
SET IDENTITY_INSERT [dbo].[Roles] OFF
INSERT [dbo].[Salidas] ([IDSalida], [FechaSalida], [IDUsuario]) VALUES (N'S0001', CAST(N'2023-11-19 20:19:01.587' AS DateTime), N'U0001')
INSERT [dbo].[Salidas] ([IDSalida], [FechaSalida], [IDUsuario]) VALUES (N'S0002', CAST(N'2023-11-19 20:55:54.567' AS DateTime), N'U0002')
INSERT [dbo].[Salidas] ([IDSalida], [FechaSalida], [IDUsuario]) VALUES (N'S0003', CAST(N'2023-11-19 23:28:42.733' AS DateTime), N'U0002')
INSERT [dbo].[Salidas] ([IDSalida], [FechaSalida], [IDUsuario]) VALUES (N'S0004', CAST(N'2023-11-20 12:13:12.607' AS DateTime), N'U0002')
INSERT [dbo].[Salidas] ([IDSalida], [FechaSalida], [IDUsuario]) VALUES (N'S0005', CAST(N'2023-11-20 12:16:05.710' AS DateTime), N'U0002')
INSERT [dbo].[Salidas] ([IDSalida], [FechaSalida], [IDUsuario]) VALUES (N'S0006', CAST(N'2023-11-22 21:49:09.567' AS DateTime), N'U0002')
INSERT [dbo].[Salidas] ([IDSalida], [FechaSalida], [IDUsuario]) VALUES (N'S0007', CAST(N'2023-11-22 21:54:45.227' AS DateTime), N'U0002')
INSERT [dbo].[Salidas] ([IDSalida], [FechaSalida], [IDUsuario]) VALUES (N'S0008', CAST(N'2023-11-23 13:15:59.080' AS DateTime), N'U0002')
INSERT [dbo].[Salidas] ([IDSalida], [FechaSalida], [IDUsuario]) VALUES (N'S0009', CAST(N'2023-11-23 14:59:53.960' AS DateTime), N'U0001')
INSERT [dbo].[Usuarios] ([IDusuario], [Username], [Password], [Nombre], [DNI], [Email], [Telefono]) VALUES (N'U0001', N'Admin', N'Admin', N'Usuario Default', N'12345678', N'admin@gmail.com', N'123456789')
INSERT [dbo].[Usuarios] ([IDusuario], [Username], [Password], [Nombre], [DNI], [Email], [Telefono]) VALUES (N'U0002', N'JRebaza', N'2311juber', N'REBAZA ROSAS, JUBER', N'40080055', N'rebazajuber@gmail.com', N'924738922')
INSERT [dbo].[UsuariosRoles] ([IDusuario], [IDRol]) VALUES (N'U0001', 1)
INSERT [dbo].[UsuariosRoles] ([IDusuario], [IDRol]) VALUES (N'U0002', 2)
ALTER TABLE [dbo].[Almacen]  WITH CHECK ADD  CONSTRAINT [FK_Almacen_Articulos] FOREIGN KEY([IDArticulo])
REFERENCES [dbo].[Articulos] ([IDArticulo])
GO
ALTER TABLE [dbo].[Almacen] CHECK CONSTRAINT [FK_Almacen_Articulos]
GO
ALTER TABLE [dbo].[Articulos]  WITH CHECK ADD  CONSTRAINT [FK_Articulos_Categorias] FOREIGN KEY([IDCategoria])
REFERENCES [dbo].[Categorias] ([IDCategoria])
GO
ALTER TABLE [dbo].[Articulos] CHECK CONSTRAINT [FK_Articulos_Categorias]
GO
ALTER TABLE [dbo].[DetalleEntrada]  WITH CHECK ADD  CONSTRAINT [FK_DetalleEntrada_Articulos] FOREIGN KEY([IDArticulo])
REFERENCES [dbo].[Articulos] ([IDArticulo])
GO
ALTER TABLE [dbo].[DetalleEntrada] CHECK CONSTRAINT [FK_DetalleEntrada_Articulos]
GO
ALTER TABLE [dbo].[DetalleEntrada]  WITH CHECK ADD  CONSTRAINT [FK_DetalleEntrada_Entradas] FOREIGN KEY([IDEntrada])
REFERENCES [dbo].[Entradas] ([IDEntrada])
GO
ALTER TABLE [dbo].[DetalleEntrada] CHECK CONSTRAINT [FK_DetalleEntrada_Entradas]
GO
ALTER TABLE [dbo].[DetalleSalida]  WITH CHECK ADD  CONSTRAINT [FK_DetalleSalida_Articulos] FOREIGN KEY([IDArticulo])
REFERENCES [dbo].[Articulos] ([IDArticulo])
GO
ALTER TABLE [dbo].[DetalleSalida] CHECK CONSTRAINT [FK_DetalleSalida_Articulos]
GO
ALTER TABLE [dbo].[DetalleSalida]  WITH CHECK ADD  CONSTRAINT [FK_DetalleSalida_Salidas] FOREIGN KEY([IDSalida])
REFERENCES [dbo].[Salidas] ([IDSalida])
GO
ALTER TABLE [dbo].[DetalleSalida] CHECK CONSTRAINT [FK_DetalleSalida_Salidas]
GO
ALTER TABLE [dbo].[Entradas]  WITH CHECK ADD  CONSTRAINT [FK_Entradas_Usuarios] FOREIGN KEY([IDUsuario])
REFERENCES [dbo].[Usuarios] ([IDusuario])
GO
ALTER TABLE [dbo].[Entradas] CHECK CONSTRAINT [FK_Entradas_Usuarios]
GO
ALTER TABLE [dbo].[Salidas]  WITH CHECK ADD  CONSTRAINT [FK_Salidas_Usuarios] FOREIGN KEY([IDUsuario])
REFERENCES [dbo].[Usuarios] ([IDusuario])
GO
ALTER TABLE [dbo].[Salidas] CHECK CONSTRAINT [FK_Salidas_Usuarios]
GO
ALTER TABLE [dbo].[UsuariosRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsuariosRoles_Roles] FOREIGN KEY([IDRol])
REFERENCES [dbo].[Roles] ([IDRol])
GO
ALTER TABLE [dbo].[UsuariosRoles] CHECK CONSTRAINT [FK_UsuariosRoles_Roles]
GO
ALTER TABLE [dbo].[UsuariosRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsuariosRoles_Usuarios] FOREIGN KEY([IDusuario])
REFERENCES [dbo].[Usuarios] ([IDusuario])
GO
ALTER TABLE [dbo].[UsuariosRoles] CHECK CONSTRAINT [FK_UsuariosRoles_Usuarios]
GO
USE [master]
GO
ALTER DATABASE [BDLOUISPASTEUR] SET  READ_WRITE 
GO
