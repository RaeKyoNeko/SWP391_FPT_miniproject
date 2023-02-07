USE [master]
GO
/****** Object:  Database [BirdAccommodation]    Script Date: 1/26/2023 12:23:14 ******/
CREATE DATABASE [BirdAccommodation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BirdAccommodation', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BirdAccommodation.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BirdAccommodation_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BirdAccommodation_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BirdAccommodation] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BirdAccommodation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BirdAccommodation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BirdAccommodation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BirdAccommodation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BirdAccommodation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BirdAccommodation] SET ARITHABORT OFF 
GO
ALTER DATABASE [BirdAccommodation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BirdAccommodation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BirdAccommodation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BirdAccommodation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BirdAccommodation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BirdAccommodation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BirdAccommodation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BirdAccommodation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BirdAccommodation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BirdAccommodation] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BirdAccommodation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BirdAccommodation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BirdAccommodation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BirdAccommodation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BirdAccommodation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BirdAccommodation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BirdAccommodation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BirdAccommodation] SET RECOVERY FULL 
GO
ALTER DATABASE [BirdAccommodation] SET  MULTI_USER 
GO
ALTER DATABASE [BirdAccommodation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BirdAccommodation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BirdAccommodation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BirdAccommodation] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BirdAccommodation] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BirdAccommodation] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BirdAccommodation', N'ON'
GO
ALTER DATABASE [BirdAccommodation] SET QUERY_STORE = ON
GO
ALTER DATABASE [BirdAccommodation] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BirdAccommodation]
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 1/26/2023 12:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[contract_id] [nvarchar](20) NOT NULL,
	[provider_id] [nvarchar](20) NOT NULL,
	[admin_id] [nvarchar](20) NOT NULL,
	[constract_service_id] [nvarchar](20) NOT NULL,
	[contract_price] [int] NOT NULL,
 CONSTRAINT [PK_Contract] PRIMARY KEY CLUSTERED 
(
	[contract_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Account]    Script Date: 1/26/2023 12:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Account](
	[acc_id] [nvarchar](20) NOT NULL,
	[role] [int] NOT NULL,
	[full_name] [nvarchar](50) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[status] [bit] NOT NULL,
	[phone] [int] NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[account_img] [nvarchar](200) NOT NULL,
	[token] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[acc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Bird]    Script Date: 1/26/2023 12:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Bird](
	[bird_id] [nvarchar](20) NOT NULL,
	[customer_id] [nvarchar](20) NOT NULL,
	[type] [nvarchar](20) NULL,
	[age] [int] NULL,
	[bird_img] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Bird] PRIMARY KEY CLUSTERED 
(
	[bird_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_BookingService]    Script Date: 1/26/2023 12:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_BookingService](
	[booking_service_id] [nvarchar](20) NOT NULL,
	[status] [bit] NOT NULL,
	[price] [float] NOT NULL,
	[description] [nvarchar](200) NULL,
	[service_name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_tbl_BookingService] PRIMARY KEY CLUSTERED 
(
	[booking_service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ConstractService]    Script Date: 1/26/2023 12:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ConstractService](
	[contract_service_id] [nvarchar](20) NOT NULL,
	[service_name] [nvarchar](20) NOT NULL,
	[description] [text] NULL,
	[service_price] [float] NOT NULL,
 CONSTRAINT [PK_tbl_ConstractService] PRIMARY KEY CLUSTERED 
(
	[contract_service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_News]    Script Date: 1/26/2023 12:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_News](
	[new_id] [nvarchar](20) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[description] [text] NULL,
	[new_img] [nvarchar](100) NULL,
	[reference] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tbl_News] PRIMARY KEY CLUSTERED 
(
	[new_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_TransactionDetail]    Script Date: 1/26/2023 12:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TransactionDetail](
	[trans_detail_id] [nvarchar](20) NOT NULL,
	[bird_id] [nvarchar](20) NOT NULL,
	[booking_service_id] [nvarchar](20) NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NOT NULL,
	[price] [int] NOT NULL,
	[payment_status] [bit] NOT NULL,
	[payment_method] [bit] NOT NULL,
	[description] [text] NULL,
	[feedback] [text] NULL,
 CONSTRAINT [PK_tbl_TransactionDetail] PRIMARY KEY CLUSTERED 
(
	[trans_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 1/26/2023 12:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[trans_id] [nvarchar](20) NOT NULL,
	[customer_id] [nvarchar](20) NOT NULL,
	[provider_id] [nvarchar](20) NOT NULL,
	[detail_id] [nvarchar](20) NOT NULL,
	[status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[trans_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [Admin] FOREIGN KEY([admin_id])
REFERENCES [dbo].[tbl_Account] ([acc_id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [Admin]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [contract Service] FOREIGN KEY([contract_id])
REFERENCES [dbo].[Contract] ([contract_id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [contract Service]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [Provider_id] FOREIGN KEY([provider_id])
REFERENCES [dbo].[tbl_Account] ([acc_id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [Provider_id]
GO
ALTER TABLE [dbo].[tbl_Bird]  WITH CHECK ADD  CONSTRAINT [belong to customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[tbl_Account] ([acc_id])
GO
ALTER TABLE [dbo].[tbl_Bird] CHECK CONSTRAINT [belong to customer]
GO
ALTER TABLE [dbo].[tbl_TransactionDetail]  WITH CHECK ADD  CONSTRAINT [bird_id] FOREIGN KEY([bird_id])
REFERENCES [dbo].[tbl_Bird] ([bird_id])
GO
ALTER TABLE [dbo].[tbl_TransactionDetail] CHECK CONSTRAINT [bird_id]
GO
ALTER TABLE [dbo].[tbl_TransactionDetail]  WITH CHECK ADD  CONSTRAINT [booking service ] FOREIGN KEY([booking_service_id])
REFERENCES [dbo].[tbl_BookingService] ([booking_service_id])
GO
ALTER TABLE [dbo].[tbl_TransactionDetail] CHECK CONSTRAINT [booking service ]
GO
ALTER TABLE [dbo].[tbl_TransactionDetail]  WITH CHECK ADD  CONSTRAINT [trans id] FOREIGN KEY([trans_detail_id])
REFERENCES [dbo].[Transaction] ([trans_id])
GO
ALTER TABLE [dbo].[tbl_TransactionDetail] CHECK CONSTRAINT [trans id]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [Customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[tbl_Account] ([acc_id])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [Customer]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [Provider] FOREIGN KEY([provider_id])
REFERENCES [dbo].[tbl_Account] ([acc_id])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [Provider]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [price validation contract] CHECK  (((0)=(0)))
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [price validation contract]
GO
ALTER TABLE [dbo].[tbl_Account]  WITH CHECK ADD  CONSTRAINT [phone validate] CHECK  (([phone]>=(1000000000) AND [phone]<=(9999999999.)))
GO
ALTER TABLE [dbo].[tbl_Account] CHECK CONSTRAINT [phone validate]
GO
ALTER TABLE [dbo].[tbl_Account]  WITH CHECK ADD  CONSTRAINT [role] CHECK  (([role]=(0) OR [role]=(1) OR [role]=(2)))
GO
ALTER TABLE [dbo].[tbl_Account] CHECK CONSTRAINT [role]
GO
ALTER TABLE [dbo].[tbl_Account]  WITH CHECK ADD  CONSTRAINT [status] CHECK  (([status]=(0) OR [status]=(1)))
GO
ALTER TABLE [dbo].[tbl_Account] CHECK CONSTRAINT [status]
GO
ALTER TABLE [dbo].[tbl_Bird]  WITH CHECK ADD  CONSTRAINT [age] CHECK  (([age]>=(1) AND [age]<=(100)))
GO
ALTER TABLE [dbo].[tbl_Bird] CHECK CONSTRAINT [age]
GO
ALTER TABLE [dbo].[tbl_BookingService]  WITH CHECK ADD  CONSTRAINT [price contraint] CHECK  (([price]>=(0) AND [price]<=(99999999)))
GO
ALTER TABLE [dbo].[tbl_BookingService] CHECK CONSTRAINT [price contraint]
GO
ALTER TABLE [dbo].[tbl_ConstractService]  WITH CHECK ADD  CONSTRAINT [price validation] CHECK  (([service_price]>=(0) AND [service_price]<=(99999999)))
GO
ALTER TABLE [dbo].[tbl_ConstractService] CHECK CONSTRAINT [price validation]
GO
ALTER TABLE [dbo].[tbl_TransactionDetail]  WITH CHECK ADD  CONSTRAINT [price validate] CHECK  (([price]>=(0) AND [price]<=(999999999)))
GO
ALTER TABLE [dbo].[tbl_TransactionDetail] CHECK CONSTRAINT [price validate]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [status validation] CHECK  (([status]=(0) OR [status]=(1) OR [status]=(2)))
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [status validation]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: admin, 1:provider, 2:customer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_Account', @level2type=N'COLUMN',@level2name=N'role'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: provider, 1: admin, 2: customer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_Account', @level2type=N'CONSTRAINT',@level2name=N'role'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: on-going, 1: successful, 2: cancel ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_Account', @level2type=N'CONSTRAINT',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: OFF , 1: ON' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_BookingService', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'url' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_News', @level2type=N'COLUMN',@level2name=N'reference'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: not yet, 1: already pay' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_TransactionDetail', @level2type=N'COLUMN',@level2name=N'price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: COD, 1:online' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_TransactionDetail', @level2type=N'COLUMN',@level2name=N'payment_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'about transaction ( of customer)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_TransactionDetail', @level2type=N'COLUMN',@level2name=N'payment_method'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: ongoing, 1: successful, 2: canceled' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Transaction', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: on-going, 1: successful, 2:cancel' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Transaction', @level2type=N'CONSTRAINT',@level2name=N'status validation'
GO
USE [master]
GO
ALTER DATABASE [BirdAccommodation] SET  READ_WRITE 
GO
