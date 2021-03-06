USE [master]
GO
/****** Object:  Database [Correo]    Script Date: 10/04/2020 2:00:29 ******/
CREATE DATABASE [Correo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Correo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER2016\MSSQL\DATA\Correo.mdf' , SIZE = 6144KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Correo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER2016\MSSQL\DATA\Correo_log.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Correo] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Correo].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [Correo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Correo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Correo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Correo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Correo] SET ARITHABORT OFF 
GO
ALTER DATABASE [Correo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Correo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Correo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Correo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Correo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Correo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Correo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Correo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Correo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Correo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Correo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Correo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Correo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Correo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Correo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Correo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Correo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Correo] SET RECOVERY FULL 
GO
ALTER DATABASE [Correo] SET  MULTI_USER 
GO
ALTER DATABASE [Correo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Correo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Correo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Correo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Correo] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Correo', N'ON'
GO
ALTER DATABASE [Correo] SET QUERY_STORE = OFF
GO
USE [Correo]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Correo]
GO
/****** Object:  User [NT AUTHORITY\ANONYMOUS LOGON]    Script Date: 10/04/2020 2:00:29 ******/
CREATE USER [NT AUTHORITY\ANONYMOUS LOGON] FOR LOGIN [NT AUTHORITY\ANONYMOUS LOGON]
GO
/****** Object:  User [JUANK-PC\patricia]    Script Date: 10/04/2020 2:00:29 ******/
CREATE USER [JUANK-PC\patricia] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [NT AUTHORITY\ANONYMOUS LOGON]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [NT AUTHORITY\ANONYMOUS LOGON]
GO
ALTER ROLE [db_datareader] ADD MEMBER [NT AUTHORITY\ANONYMOUS LOGON]
GO
ALTER ROLE [db_owner] ADD MEMBER [JUANK-PC\patricia]
GO
ALTER ROLE [db_datareader] ADD MEMBER [JUANK-PC\patricia]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [JUANK-PC\patricia]
GO
/****** Object:  UserDefinedFunction [dbo].[Mes]    Script Date: 10/04/2020 2:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[Mes]
(
	-- Add the parameters for the function here
	@NumMes int
)
RETURNS varchar(50)
AS
BEGIN
	-- Declare the return variable here
	declare @Meses table(MesN int,MesC varchar(50))
	-- Add the T-SQL statements to compute the return value here
	insert into @Meses values (1,'Enero')
    insert into @Meses values (2,'Febrero')
    insert into @Meses values (3,'Marzo')
    insert into @Meses values (4,'Abril')
    insert into @Meses values (5,'Mayo')
    insert into @Meses values (6,'Junio')
    insert into @Meses values (7,'Julio')
    insert into @Meses values (8,'Agosto')
    insert into @Meses values (9,'Septiembre')
    insert into @Meses values (10,'Octubre')
    insert into @Meses values (11,'Noviembre')
    insert into @Meses values (12,'Diciembre')

	-- Return the result of the function
	declare @MesActual nvarchar(50)
    set @MesActual = (select MesC from @Meses where MesN = @NumMes)
    return @MesActual
END

GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 10/04/2020 2:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Cod] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NULL,
	[Email] [nvarchar](50) NULL,
	[Cell] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Direccion] [nvarchar](max) NULL,
	[FechaInicio] [datetime] NULL,
	[Notificado] [bit] NULL,
	[Eliminado] [bit] NULL,
	[DiaCobro] [int] NULL,
	[Tarifa] [real] NULL,
	[FechaEliminado] [datetime] NULL,
	[TipoConeccion] [int] NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClienteLista]    Script Date: 10/04/2020 2:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClienteLista](
	[CodCliente] [int] NOT NULL,
	[CodLista] [int] NOT NULL,
 CONSTRAINT [PK_ClienteLista] PRIMARY KEY CLUSTERED 
(
	[CodCliente] ASC,
	[CodLista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cobro]    Script Date: 10/04/2020 2:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cobro](
	[CodCobro] [int] IDENTITY(1,1) NOT NULL,
	[Monto] [real] NULL,
	[Fecha] [datetime] NULL,
	[CodCliente] [int] NULL,
	[Mes] [int] NULL,
 CONSTRAINT [PK_Cobro] PRIMARY KEY CLUSTERED 
(
	[CodCobro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Config]    Script Date: 10/04/2020 2:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config](
	[Cod] [int] IDENTITY(1,1) NOT NULL,
	[Variable] [nvarchar](max) NULL,
	[Valor] [nvarchar](max) NULL,
 CONSTRAINT [PK_Config] PRIMARY KEY CLUSTERED 
(
	[Cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gastos]    Script Date: 10/04/2020 2:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gastos](
	[Cod] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](max) NULL,
	[Monto] [real] NULL,
	[Registrados] [bit] NULL,
 CONSTRAINT [PK_Gastos] PRIMARY KEY CLUSTERED 
(
	[Cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ListaCorreo]    Script Date: 10/04/2020 2:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListaCorreo](
	[Cod] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
 CONSTRAINT [PK_ListaCorreo] PRIMARY KEY CLUSTERED 
(
	[Cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoConeccion]    Script Date: 10/04/2020 2:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoConeccion](
	[CodC] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](100) NULL,
 CONSTRAINT [PK_TipoConeccion] PRIMARY KEY CLUSTERED 
(
	[CodC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET IDENTITY_INSERT [dbo].[Config] ON 

GO
INSERT [dbo].[Config] ([Cod], [Variable], [Valor]) VALUES (1, N'Dominio', N'cubatomic.com')
GO
INSERT [dbo].[Config] ([Cod], [Variable], [Valor]) VALUES (2, N'PuertoSMTP', N'25')
GO
INSERT [dbo].[Config] ([Cod], [Variable], [Valor]) VALUES (3, N'Servidor', N'192.168.3.220')
GO
INSERT [dbo].[Config] ([Cod], [Variable], [Valor]) VALUES (4, N'UserName', N'administrador')
GO
INSERT [dbo].[Config] ([Cod], [Variable], [Valor]) VALUES (5, N'Pass', N'9n1b0b|256z1z0r|722x2x0f|2166i6e0e|11094l6j1b|9216v9z1l|81p1j1x|8214z6c0w|400k4w1j|486z6r1m')
GO
SET IDENTITY_INSERT [dbo].[Config] OFF
GO
SET IDENTITY_INSERT [dbo].[Gastos] ON 

GO
INSERT [dbo].[Gastos] ([Cod], [Descripcion], [Monto], [Registrados]) VALUES (18, N'Local', 115, 1)
GO
INSERT [dbo].[Gastos] ([Cod], [Descripcion], [Monto], [Registrados]) VALUES (19, N'Internet', 30, 1)
GO
SET IDENTITY_INSERT [dbo].[Gastos] OFF
GO
SET IDENTITY_INSERT [dbo].[ListaCorreo] ON 

GO
INSERT [dbo].[ListaCorreo] ([Cod], [Nombre]) VALUES (4, N'EVERYONE')
GO
INSERT [dbo].[ListaCorreo] ([Cod], [Nombre]) VALUES (9, N'RED')
GO
INSERT [dbo].[ListaCorreo] ([Cod], [Nombre]) VALUES (10, N'RAS')
GO
SET IDENTITY_INSERT [dbo].[ListaCorreo] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoConeccion] ON 

GO
INSERT [dbo].[TipoConeccion] ([CodC], [Descripcion]) VALUES (1, N'RAS')
GO
INSERT [dbo].[TipoConeccion] ([CodC], [Descripcion]) VALUES (2, N'LAN')
GO
INSERT [dbo].[TipoConeccion] ([CodC], [Descripcion]) VALUES (3, N'WIFI')
GO
SET IDENTITY_INSERT [dbo].[TipoConeccion] OFF
GO
ALTER TABLE [dbo].[Cliente] ADD  CONSTRAINT [DF_Cliente_TipoConeccion]  DEFAULT ((1)) FOR [TipoConeccion]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_TipoConeccion] FOREIGN KEY([TipoConeccion])
REFERENCES [dbo].[TipoConeccion] ([CodC])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_TipoConeccion]
GO
ALTER TABLE [dbo].[ClienteLista]  WITH CHECK ADD  CONSTRAINT [FK_ClienteLista_Cliente] FOREIGN KEY([CodCliente])
REFERENCES [dbo].[Cliente] ([Cod])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClienteLista] CHECK CONSTRAINT [FK_ClienteLista_Cliente]
GO
ALTER TABLE [dbo].[ClienteLista]  WITH CHECK ADD  CONSTRAINT [FK_ClienteLista_ListaCorreo] FOREIGN KEY([CodLista])
REFERENCES [dbo].[ListaCorreo] ([Cod])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClienteLista] CHECK CONSTRAINT [FK_ClienteLista_ListaCorreo]
GO
ALTER TABLE [dbo].[Cobro]  WITH CHECK ADD  CONSTRAINT [FK_Cobro_Cliente] FOREIGN KEY([CodCliente])
REFERENCES [dbo].[Cliente] ([Cod])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cobro] CHECK CONSTRAINT [FK_Cobro_Cliente]
GO
/****** Object:  StoredProcedure [dbo].[ClientesANotificar]    Script Date: 10/04/2020 2:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE
 PROCEDURE [dbo].[ClientesANotificar]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from Cliente where DiaCobro = (day(dateadd(day,1,getdate()))) and Cliente.Eliminado = 'false' and
    Notificado = 'false'
END


GO
/****** Object:  StoredProcedure [dbo].[ClientesDeLista]    Script Date: 10/04/2020 2:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ClientesDeLista]
	-- Add the parameters for the stored procedure here
    @CodLista int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 SELECT     Cliente.*
     FROM       Cliente, ClienteLista
     WHERE Cliente.Cod = ClienteLista.CodCliente and ClienteLista.CodLista = @CodLista
                      
END



GO
/****** Object:  StoredProcedure [dbo].[CobrosCliente]    Script Date: 10/04/2020 2:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CobrosCliente]
	-- Add the parameters for the stored procedure here
	@CodCliente int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     Cobro.Monto, Cobro.Fecha, Cobro.Fecha
    FROM        Cobro
    where Cobro.CodCliente = @CodCliente
END


GO
/****** Object:  StoredProcedure [dbo].[DineroEstimadoMes]    Script Date: 10/04/2020 2:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DineroEstimadoMes]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT sum(tarifa) as Dinero from Cliente 
    where Cliente.Cod not in (select CodCliente from Cobro where Mes = Month(Getdate())) and Cliente.Eliminado = 'false'
END



GO
/****** Object:  StoredProcedure [dbo].[DineroPorMes]    Script Date: 10/04/2020 2:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DineroPorMes]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
 Create table #Temp(Monto real,Mes int, Anno int)

 insert into #Temp select Monto, Mes, Year(Fecha)  from Cobro

 insert into #Temp select Monto, Mes, Year(Fecha) from CobroExtra

 select Sum(Monto) as Ganancias, Mes, Anno  from #Temp group by Mes,Anno
    
 drop table #Temp 
END






GO
/****** Object:  StoredProcedure [dbo].[DineroPorMesCobro]    Script Date: 10/04/2020 2:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DineroPorMesCobro]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
-- Create table #Temp(Monto real,Mes int, Anno int)
--
-- insert into #Temp select Monto, Mes, Year(Fecha)  from Cobro
--
-- insert into #Temp select Monto, Mes, Year(Fecha) from CobroExtra
--
-- select Sum(Monto) as Ganancias, Mes, Anno  from #Temp group by Mes,Anno
--    
-- drop table #Temp 
select sum(Monto) as Ganancias, Mes, Year(Fecha) as Anno  from Cobro group by Mes, Year(Fecha)

END






GO
/****** Object:  StoredProcedure [dbo].[DineroPorMesExtra]    Script Date: 10/04/2020 2:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DineroPorMesExtra]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select sum(Monto) as Ganancias, Mes, Year(Fecha) as Anno  from CobroExtra group by Mes, Year(Fecha)
END

GO
/****** Object:  StoredProcedure [dbo].[EliminarCliente]    Script Date: 10/04/2020 2:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EliminarCliente] 
	-- Add the parameters for the stored procedure here
	@Cod int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Cliente set Eliminado = 'true' where Cod = @Cod
END

GO
/****** Object:  StoredProcedure [dbo].[InsertarCliente]    Script Date: 10/04/2020 2:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertarCliente]
	-- Add the parameters for the stored procedure here
@Nombre nvarchar(max),
@Email nvarchar(max),
@Cell nvarchar(max),
@Phone nvarchar(max),
@Direccion nvarchar(max),
@DiaCobro int,
@Tarifa real,
@TipoConeccion int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into Cliente values (@Nombre,@Email,@Cell,@Phone,@Direccion,Getdate(),0,0,@DiaCobro,@Tarifa,null,@TipoConeccion)

   return @@IDENTITY;
END






GO
/****** Object:  StoredProcedure [dbo].[InsertarGasto]    Script Date: 10/04/2020 2:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertarGasto]
	-- Add the parameters for the stored procedure here
	@Descrip nvarchar(max), @Monto real
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into Gastos values (@Descrip, @Monto, 1)
END

GO
/****** Object:  StoredProcedure [dbo].[SBuscarClientes]    Script Date: 10/04/2020 2:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SBuscarClientes]
	-- Add the parameters for the stored procedure here
    @Param nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if(@Param='')
      SELECT    Cod, Nombre, (Email+'@'+(select Valor from Config where Variable='Dominio')) as Email, Cell, Phone, Direccion, FechaInicio, DiaCobro,Tarifa,(TipoConeccion.Descripcion) as TipoDeConeccion
      FROM       Cliente inner join TipoConeccion on Cliente.TipoConeccion = TipoConeccion.CodC
      WHERE Eliminado = 'false'
      Order by DiaCobro
     
    else
      SELECT    Cod, Nombre, (Email+'@'+(select Valor from Config where Variable='Dominio')) as Email, Cell, Phone, Direccion, FechaInicio, DiaCobro,Tarifa,(TipoConeccion.Descripcion) as TipoDeConeccion
      FROM       Cliente inner join TipoConeccion on Cliente.TipoConeccion = TipoConeccion.CodC
      WHERE ((Nombre like '%'+@Param+'%') or (Email like '%'+@Param+'%') or (Cell like '%'+ @Param+'%') or (Phone like '%'+@Param+'%') or (Direccion like '%'+@Param+'%') or  (str(DiaCobro) like '%'+@Param+'%') or(str(Tarifa) like '%'+ @Param+'%'))
            and Eliminado = 'false'
      Order by DiaCobro


END


GO
/****** Object:  StoredProcedure [dbo].[SCliente]    Script Date: 10/04/2020 2:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SCliente]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	  SELECT    Cod, Nombre, (Email+'@'+(select Valor from Config where Variable='Dominio')) as Email, Cell, Phone, Direccion, FechaInicio, DiaCobro,Tarifa,(TipoConeccion.Descripcion) as TipoDeConeccion
      FROM       Cliente inner join TipoConeccion on Cliente.TipoConeccion = TipoConeccion.CodC
      WHERE Eliminado = 'false'
      Order by DiaCobro

END







GO
/****** Object:  StoredProcedure [dbo].[SClienteDesactivado]    Script Date: 10/04/2020 2:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SClienteDesactivado]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	  SELECT    Cod, Nombre, (Email+'@'+(select Valor from Config where Variable='Dominio')) as Email, Cell, Phone, Direccion, FechaInicio,FechaEliminado, DiaCobro,Tarifa,(TipoConeccion.Descripcion) as TipoDeConeccion
      FROM       Cliente inner join TipoConeccion on Cliente.TipoConeccion = TipoConeccion.CodC
      WHERE Eliminado = 'true'
      Order by Nombre
END



GO
/****** Object:  StoredProcedure [dbo].[SCobros]    Script Date: 10/04/2020 2:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SCobros]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT     Cliente.Nombre, Cobro.Fecha, Cobro.Mes, Cobro.Monto, Cliente.Eliminado
FROM         Cliente INNER JOIN
                      Cobro ON Cliente.Cod = Cobro.CodCliente
WHERE Cobro.Monto>0


order by Fecha desc
END




GO
/****** Object:  StoredProcedure [dbo].[SConfiguracion]    Script Date: 10/04/2020 2:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SConfiguracion]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     Cod, Variable, Valor
FROM         Config
END

GO
/****** Object:  StoredProcedure [dbo].[SListas]    Script Date: 10/04/2020 2:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SListas]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from ListaCorreo
END

GO
/****** Object:  StoredProcedure [dbo].[SListasCorreo]    Script Date: 10/04/2020 2:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SListasCorreo] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     Cod, Nombre
FROM         ListaCorreo
END

GO
/****** Object:  StoredProcedure [dbo].[STipoConeccion]    Script Date: 10/04/2020 2:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[STipoConeccion]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     CodC, Descripcion
FROM         TipoConeccion
END

GO
USE [master]
GO
ALTER DATABASE [Correo] SET  READ_WRITE 
GO
