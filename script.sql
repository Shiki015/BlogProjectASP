USE [master]
GO
/****** Object:  Database [blog]    Script Date: 6/17/2021 5:31:26 PM ******/
CREATE DATABASE [blog]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'blog', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\blog.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'blog_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\blog_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [blog] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [blog].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [blog] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [blog] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [blog] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [blog] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [blog] SET ARITHABORT OFF 
GO
ALTER DATABASE [blog] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [blog] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [blog] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [blog] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [blog] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [blog] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [blog] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [blog] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [blog] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [blog] SET  DISABLE_BROKER 
GO
ALTER DATABASE [blog] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [blog] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [blog] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [blog] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [blog] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [blog] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [blog] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [blog] SET RECOVERY FULL 
GO
ALTER DATABASE [blog] SET  MULTI_USER 
GO
ALTER DATABASE [blog] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [blog] SET DB_CHAINING OFF 
GO
ALTER DATABASE [blog] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [blog] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [blog] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [blog] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'blog', N'ON'
GO
ALTER DATABASE [blog] SET QUERY_STORE = OFF
GO
USE [blog]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/17/2021 5:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/17/2021 5:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 6/17/2021 5:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CommentText] [nvarchar](max) NOT NULL,
	[UserId] [int] NOT NULL,
	[PostId] [int] NOT NULL,
	[ParentId] [int] NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExceptionLogs]    Script Date: 6/17/2021 5:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExceptionLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Response] [nvarchar](max) NOT NULL,
	[StatusCode] [bigint] NOT NULL,
	[Exception] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ExceptionLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 6/17/2021 5:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseCaseLogs]    Script Date: 6/17/2021 5:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseCaseLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UseCaseName] [nvarchar](max) NOT NULL,
	[Data] [nvarchar](max) NOT NULL,
	[Actor] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_UseCaseLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/17/2021 5:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[ProfilePhoto] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUseCases]    Script Date: 6/17/2021 5:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_UserUseCases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Votes]    Script Date: 6/17/2021 5:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Votes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[PostId] [int] NOT NULL,
	[Status] [bigint] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Votes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210601205301_initial', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210601212424_initial2', N'5.0.6')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (13, N'New Name 2', CAST(N'2021-06-05T21:42:37.6258920' AS DateTime2), CAST(N'2021-06-10T18:36:22.3235146' AS DateTime2), 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (14, N'Cat6', CAST(N'2021-06-05T22:13:29.2891620' AS DateTime2), CAST(N'2021-06-07T12:14:07.0922190' AS DateTime2), 0, CAST(N'2021-06-07T12:14:07.0920750' AS DateTime2), 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (15, N'Kat', CAST(N'2021-06-05T22:13:31.9692040' AS DateTime2), CAST(N'2021-06-05T14:27:26.9062740' AS DateTime2), 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (16, N'Cat4', CAST(N'2021-06-05T22:13:34.7914510' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (17, N'News', CAST(N'2021-06-07T12:11:54.8202340' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (18, N'Crypto', CAST(N'2021-06-07T12:11:59.8213860' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (19, N'Sport', CAST(N'2021-06-07T12:12:03.5743990' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (20, N'Games', CAST(N'2021-06-07T12:12:06.9762430' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (21, N'Code', CAST(N'2021-06-07T12:12:16.4706910' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (22, N'Health', CAST(N'2021-06-07T12:12:26.7344800' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (23, N'Music', CAST(N'2021-06-07T12:12:32.7307710' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (24, N'Books', CAST(N'2021-06-07T12:12:52.8215360' AS DateTime2), NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [CommentText], [UserId], [PostId], [ParentId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (69, N'dasdas', 9, 19, NULL, CAST(N'2021-06-26T18:11:29.0000000' AS DateTime2), CAST(N'2021-06-08T10:25:29.5848620' AS DateTime2), 0, CAST(N'2021-06-08T10:25:29.5659860' AS DateTime2), 1)
INSERT [dbo].[Comments] ([Id], [CommentText], [UserId], [PostId], [ParentId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (70, N'Dete1', 22, 19, NULL, CAST(N'2021-06-07T18:16:11.0000000' AS DateTime2), CAST(N'2021-06-08T11:12:05.7877420' AS DateTime2), 0, CAST(N'2021-06-08T11:12:05.7651410' AS DateTime2), 1)
INSERT [dbo].[Comments] ([Id], [CommentText], [UserId], [PostId], [ParentId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (71, N'Dete2', 22, 19, NULL, CAST(N'2021-06-07T18:18:45.0000000' AS DateTime2), CAST(N'2021-06-08T10:47:13.1095980' AS DateTime2), 0, CAST(N'2021-06-08T10:47:13.0939520' AS DateTime2), 1)
INSERT [dbo].[Comments] ([Id], [CommentText], [UserId], [PostId], [ParentId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (72, N'Radi Sve', 22, 22, NULL, CAST(N'2021-06-06T17:52:47.0111740' AS DateTime2), CAST(N'2021-06-08T12:39:00.4616260' AS DateTime2), 0, CAST(N'2021-06-08T12:39:00.4615310' AS DateTime2), 1)
INSERT [dbo].[Comments] ([Id], [CommentText], [UserId], [PostId], [ParentId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (73, N'Kom1', 22, 18, NULL, CAST(N'2021-06-06T17:55:57.9635520' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [CommentText], [UserId], [PostId], [ParentId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (74, N'UpdateCommSwagger', 22, 17, NULL, CAST(N'2021-06-08T12:33:56.2682620' AS DateTime2), CAST(N'2021-06-08T12:38:26.5508840' AS DateTime2), 0, CAST(N'2021-06-08T12:38:26.5508240' AS DateTime2), 1)
INSERT [dbo].[Comments] ([Id], [CommentText], [UserId], [PostId], [ParentId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (75, N'Ovo je swagger podCOmm', 22, 18, NULL, CAST(N'2021-06-08T12:35:33.1532210' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [CommentText], [UserId], [PostId], [ParentId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (76, N'Ovo je swagger podCOmm', 22, 16, NULL, CAST(N'2021-06-08T12:36:04.5927470' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [CommentText], [UserId], [PostId], [ParentId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (77, N'Kom2', 22, 21, NULL, CAST(N'2021-06-09T13:26:38.9898060' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [CommentText], [UserId], [PostId], [ParentId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (78, N'Kom3', 22, 21, NULL, CAST(N'2021-06-09T13:26:59.8581690' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [CommentText], [UserId], [PostId], [ParentId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (79, N'Kom3', 22, 21, NULL, CAST(N'2021-06-09T13:27:15.2700280' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [CommentText], [UserId], [PostId], [ParentId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (80, N'Bravo', 22, 20, NULL, CAST(N'2021-06-09T13:27:34.1426570' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [CommentText], [UserId], [PostId], [ParentId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (81, N'Super', 22, 20, NULL, CAST(N'2021-06-09T13:27:39.3089950' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [CommentText], [UserId], [PostId], [ParentId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (82, N'Super', 22, 16, NULL, CAST(N'2021-06-09T13:27:48.3273550' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [CommentText], [UserId], [PostId], [ParentId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (83, N'Super', 22, 16, NULL, CAST(N'2021-06-09T13:28:13.7775870' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [CommentText], [UserId], [PostId], [ParentId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (84, N'Wow', 22, 16, NULL, CAST(N'2021-06-09T13:28:20.1556720' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [CommentText], [UserId], [PostId], [ParentId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (85, N'Bravo !', 22, 16, NULL, CAST(N'2021-06-09T13:28:30.5042730' AS DateTime2), NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[ExceptionLogs] ON 

INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (24, N'{"message":"Resource not found."}', 404, N'Entity of type Post with and id of 3123 was not found', CAST(N'2021-06-06T18:32:29.4783810' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (25, N'{"message":"Failed due to validation errors.","errors":[{"PropertyName":"Username","ErrorMessage":"Username is already taken"},{"PropertyName":"Email","ErrorMessage":"Email is already taken"}]}', 422, N'Validation failed: n -- Username: Username is already takenn -- Email: Email is already taken', CAST(N'2021-06-06T23:11:51.7931220' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (26, N'{"message":"You are not allowed to execute this operation."}', 403, N'Actor with an id of 28 - flippy tried to execute EfAddCategoryCommand.', CAST(N'2021-06-06T11:45:24.1492940' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (27, N'{"message":"Resource not found."}', 404, N'Entity of type User with and id of 7 was not found', CAST(N'2021-06-07T12:11:23.2016130' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (28, N'{"message":"Resource not found."}', 404, N'Entity of type User with and id of 7 was not found', CAST(N'2021-06-07T12:11:31.6077010' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (29, N'{"message":"You are not allowed to execute this operation."}', 403, N'Actor with identity: flippy and id: 28 has tryed to access Use Case: EfUpdateUserCommandPersonal', CAST(N'2021-06-07T12:31:12.0834440' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (30, N'{"message":"Failed due to validation errors.","errors":[{"PropertyName":"ParentId","ErrorMessage":"Parent comment must exists."}]}', 422, N'Validation failed: n -- ParentId: Parent comment must exists.', CAST(N'2021-06-07T12:33:48.2049900' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (31, N'{"message":"You are not allowed to execute this operation."}', 403, N'Actor with identity: flippy and id: 28 has tryed to access Use Case: EfUpdateCommentPersonalCommand', CAST(N'2021-06-07T12:37:16.4823760' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (32, N'{"message":"You are not allowed to execute this operation."}', 403, N'Actor with identity: flippy and id: 28 has tryed to access Use Case: EfDeleteCommentPersonalCommand', CAST(N'2021-06-07T12:38:20.8309110' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (33, N'null', 500, N'An error occurred while updating the entries. See the inner exception for details.', CAST(N'2021-06-07T12:51:44.0615090' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (34, N'{"message":"Failed due to validation errors.","errors":[{"PropertyName":"Status","ErrorMessage":"Status must not be empty."}]}', 422, N'Validation failed: n -- Status: Status must not be empty.', CAST(N'2021-06-07T12:52:45.7530020' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (35, N'null', 500, N'Object reference not set to an instance of an object.', CAST(N'2021-06-07T12:53:11.6351120' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (36, N'null', 500, N'Object reference not set to an instance of an object.', CAST(N'2021-06-07T12:54:21.5343890' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (37, N'null', 500, N'Object reference not set to an instance of an object.', CAST(N'2021-06-07T12:55:29.9114340' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (38, N'null', 500, N'Object reference not set to an instance of an object.', CAST(N'2021-06-07T12:56:15.7245600' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (39, N'null', 500, N'Object reference not set to an instance of an object.', CAST(N'2021-06-07T12:57:02.9166090' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (40, N'null', 500, N'Object reference not set to an instance of an object.', CAST(N'2021-06-07T12:57:23.1570340' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (41, N'null', 500, N'Object reference not set to an instance of an object.', CAST(N'2021-06-07T12:57:29.7341010' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (42, N'null', 500, N'Object reference not set to an instance of an object.', CAST(N'2021-06-07T12:57:35.9860380' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (43, N'{"message":"Resource not found."}', 404, N'Entity of type Post with and id of 19 was not found', CAST(N'2021-06-07T13:01:04.0708500' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (44, N'{"message":"Failed due to validation errors.","errors":[{"PropertyName":"Status","ErrorMessage":"Status must not be empty."}]}', 422, N'Validation failed: n -- Status: Status must not be empty.', CAST(N'2021-06-07T13:06:18.1624240' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (45, N'{"message":"Failed due to validation errors.","errors":[{"PropertyName":"Status","ErrorMessage":"Not valid status"}]}', 422, N'Validation failed: n -- Status: Not valid status', CAST(N'2021-06-07T13:09:26.5379060' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (46, N'{"message":"Failed due to validation errors.","errors":[{"PropertyName":"ParentId","ErrorMessage":"Parent comment must exists."}]}', 422, N'Validation failed: n -- ParentId: Parent comment must exists.', CAST(N'2021-06-08T13:26:08.0009840' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (47, N'{"message":"Failed due to validation errors.","errors":[{"PropertyName":"ProfilePhoto","ErrorMessage":"''Profile Photo'' must not be empty."}]}', 422, N'Validation failed: 
 -- ProfilePhoto: ''Profile Photo'' must not be empty. Severity: Error', CAST(N'2021-06-10T17:32:06.8232548' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (48, N'{"message":"Failed due to validation errors.","errors":[{"PropertyName":"ProfilePhoto","ErrorMessage":"''Profile Photo'' must not be empty."}]}', 422, N'Validation failed: 
 -- ProfilePhoto: ''Profile Photo'' must not be empty. Severity: Error', CAST(N'2021-06-10T17:36:39.4085280' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (49, N'null', 500, N'Could not find a part of the path ''C:\Users\HP\source\repos\BlogProject.Api\BlogProject.Api\wwwroot\images\abcbb424-a7b3-4957-8486-817a09bf8d3f.jpg''.', CAST(N'2021-06-10T17:36:57.0904430' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (50, N'null', 500, N'Could not find a part of the path ''C:\Users\HP\source\repos\BlogProject.Api\BlogProject.Api\wwwroot\images\aa100e37-6290-4ca3-a6e6-dede32ab93e4.png''.', CAST(N'2021-06-10T17:37:37.9310508' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (51, N'null', 500, N'Could not find a part of the path ''C:\Users\HP\source\repos\BlogProject.Api\BlogProject.Api\wwwroot\images\e50e7451-5f7a-4717-8578-e1779759da70.jpg''.', CAST(N'2021-06-10T17:40:11.5732466' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (52, N'{"message":"You are not allowed to execute this operation."}', 403, N'Actor with an id of 23 - User24 tried to execute EfGetUsersQuery.', CAST(N'2021-06-10T17:57:01.8542096' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (53, N'{"message":"Failed due to validation errors.","errors":[{"PropertyName":"Email","ErrorMessage":"Email is taken."},{"PropertyName":"ProfilePhoto","ErrorMessage":"''Profile Photo'' must not be empty."}]}', 422, N'Validation failed: 
 -- Email: Email is taken. Severity: Error
 -- ProfilePhoto: ''Profile Photo'' must not be empty. Severity: Error', CAST(N'2021-06-10T18:27:14.1403750' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (54, N'{"message":"Resource not found."}', 404, N'Entity of type Post with and id of 3123 was not found', CAST(N'2021-06-11T12:05:41.0452270' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (55, N'{"message":"Failed due to validation errors.","errors":[{"PropertyName":"CategoryId","ErrorMessage":"Not valid Category."}]}', 422, N'Validation failed: 
 -- CategoryId: Not valid Category. Severity: Error', CAST(N'2021-06-11T12:07:41.9262149' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (56, N'{"message":"Failed due to validation errors.","errors":[{"PropertyName":"CategoryId","ErrorMessage":"Not valid Category."}]}', 422, N'Validation failed: 
 -- CategoryId: Not valid Category. Severity: Error', CAST(N'2021-06-11T12:07:54.4488655' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (57, N'{"message":"Resource not found."}', 404, N'Entity of type Post with and id of 10 was not found', CAST(N'2021-06-11T12:10:01.7955848' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (58, N'{"message":"DateFrom cant be before DateTo."}', 416, N'DateTo: 6/1/2021 12:00:00 AM cant be before DateFrom: 6/9/2021 12:00:00 AM', CAST(N'2021-06-11T12:12:04.4311854' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (59, N'{"message":"Failed due to validation errors.","errors":[{"PropertyName":"Title","ErrorMessage":"''Title'' must not be empty."}]}', 422, N'Validation failed: 
 -- Title: ''Title'' must not be empty. Severity: Error', CAST(N'2021-06-11T12:14:20.4279792' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[ExceptionLogs] ([Id], [Response], [StatusCode], [Exception], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (60, N'null', 500, N'The SMTP server requires a secure connection or the client was not authenticated. The server response was: 5.7.0 Authentication Required. Learn more at', CAST(N'2021-06-11T12:17:26.7730706' AS DateTime2), NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[ExceptionLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([Id], [Title], [CategoryId], [UserId], [Description], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (16, N'Title', 13, 8, N'Descdass das das a dad a', CAST(N'2021-06-01T11:49:07.0000000' AS DateTime2), CAST(N'2021-06-05T23:55:39.3659590' AS DateTime2), 0, CAST(N'2020-06-26T23:55:39.3498710' AS DateTime2), 1)
INSERT [dbo].[Posts] ([Id], [Title], [CategoryId], [UserId], [Description], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (17, N'Titledasdas', 13, 8, N'312321123123123123dad a', CAST(N'2021-06-02T11:49:07.0000000' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Posts] ([Id], [Title], [CategoryId], [UserId], [Description], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (18, N'Test1', 14, 9, N'Test2', CAST(N'2021-06-06T01:20:46.1604530' AS DateTime2), CAST(N'2021-06-06T01:22:59.1789890' AS DateTime2), 0, NULL, 1)
INSERT [dbo].[Posts] ([Id], [Title], [CategoryId], [UserId], [Description], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (19, N'Test1', 21, 9, N'Test2', CAST(N'2021-06-06T01:20:47.6366670' AS DateTime2), CAST(N'2021-06-06T01:21:35.7072350' AS DateTime2), 0, NULL, 1)
INSERT [dbo].[Posts] ([Id], [Title], [CategoryId], [UserId], [Description], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (20, N'Radi mapper', 23, 9, N'Test Mapper', CAST(N'2021-06-06T01:20:48.5320210' AS DateTime2), CAST(N'2021-06-06T01:33:36.4648320' AS DateTime2), 0, CAST(N'2020-06-27T01:31:40.1185420' AS DateTime2), 1)
INSERT [dbo].[Posts] ([Id], [Title], [CategoryId], [UserId], [Description], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (21, N'Radi mapper', 16, 22, N'Test Mapper', CAST(N'2021-06-06T01:30:19.7926390' AS DateTime2), CAST(N'2021-06-06T12:34:14.3598290' AS DateTime2), 0, NULL, 1)
INSERT [dbo].[Posts] ([Id], [Title], [CategoryId], [UserId], [Description], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (22, N'Title1', 14, 22, N'OVo je opis', CAST(N'2021-06-08T10:19:01.2121780' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Posts] ([Id], [Title], [CategoryId], [UserId], [Description], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (23, N'Title2', 19, 22, N'OVo je opis opet', CAST(N'2021-06-08T10:19:16.4496440' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Posts] ([Id], [Title], [CategoryId], [UserId], [Description], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (24, N'Naslov', 18, 22, N'Description1', CAST(N'2021-06-08T10:47:19.1444550' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Posts] ([Id], [Title], [CategoryId], [UserId], [Description], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (25, N'Ministarstvo zdravlja: Nije bilo propusta u lecenju dr Miodraga Lazica', 21, 22, N'das', CAST(N'2021-06-08T10:48:20.7831440' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Posts] ([Id], [Title], [CategoryId], [UserId], [Description], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (26, N'Ministarstvo zdravlja: Nije bilo propusta u lecenju dr Miodraga Lazica', 22, 22, N'Komisija Ministarstva zdravlja ocenila je u vanrednom inspekcijskom nadzoru u Klinickom centru Niš da nije bilo propusta u lecenju doktora Miodraga Lazica koji je preminuo od posledica infekcije koronavirusom, saopštilo je danas to ministarstvo.RTS je preneo navode Ministarstva zdravlja da je Klinickom centru naloženo da organizuje i sprovede vanrednu proveru kvaliteta strucnog rada zdravstvenih radnika koji su ucestvovali u lecenju dr Miodraga Lazica.', CAST(N'2021-06-08T10:48:31.7434590' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Posts] ([Id], [Title], [CategoryId], [UserId], [Description], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (27, N'Jankovic: Znali smo da epidemija nije gotova, ali nismo ocekivali ovakav nalet', 15, 22, N'Imunolog Srda Jankovic izjavio je da uvodenje restriktivnijih mera dolazi u obzir ukoliko ne budu dale rezultate nove epidemiološke mere koje se od danas primenjuju prvenstveno u Beogradu.', CAST(N'2021-06-08T10:50:17.6739630' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Posts] ([Id], [Title], [CategoryId], [UserId], [Description], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (28, N'Sto plus: Povecan broj sahrana u Novom Pazaru', 13, 22, N'Na muslimanskim i pravoslavnim grobljima u Novom Pazaru tokom prethodna cetiri dana videno je najmanje 35 dženaza, odnosno sahrana, saznaje radio Sto plus.', CAST(N'2021-06-08T10:50:46.7794180' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Posts] ([Id], [Title], [CategoryId], [UserId], [Description], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (29, N'Od koronavirusa zvanicno umrlo 277 ljudi u Srbiji, dosad ukupno 14.564 potvrdena slucaja. ', 17, 22, N'Epidemiolog Branislav Tiodorovic kaže da se pravi pik u Srbiji ocekuje verovatno za pet, šest dana. Nemacka i Slovenija još nisu otvorile granice za državljane Srbije. Više od 514 hiljada umrlih u svetu, zaraženo više od deset i po miliona.', CAST(N'2021-07-09T13:21:44.1601760' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Posts] ([Id], [Title], [CategoryId], [UserId], [Description], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (30, N'U Beogradu 240 studenata zaraženo koronavirusom', 21, 22, N'Kon je za televiziju Prva rekao da su oni smešteni u izolaciju u svojim ili iznajmljenim stanovima, kao i da su odredeni studentski domovi odredeni za te namene.', CAST(N'2021-07-09T13:22:06.5325460' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Posts] ([Id], [Title], [CategoryId], [UserId], [Description], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (31, N'Još 54 novobolelih u Hrvatskoj, jedna osoba preminula', 21, 22, N'U Hrvatskoj su u poslednja 24 sata zabeležena 54 nova slucaja koronavirusa, a jedna osoba je preminula, saopštio je Nacionalni štab civilne zaštite.', CAST(N'2021-07-09T13:22:49.1817930' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Posts] ([Id], [Title], [CategoryId], [UserId], [Description], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (32, N'Ðokovic donirao pet miliona dinara Novom Pazaru', 22, 22, N'Srpski teniser Novak Ðokovic donirao je pet miliona dolara pomoci Novom Pazaru, koji je trenutno jedno od najvecih žarišta koronavirusa u Srbiji.', CAST(N'2021-07-09T13:23:08.6654640' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Posts] ([Id], [Title], [CategoryId], [UserId], [Description], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (33, N'Ðokovic donirao pet miliona dinara Novom Pazaru', 22, 22, N'Srpski teniser Novak Ðokovic donirao je pet miliona dolara pomoci Novom Pazaru, koji je trenutno jedno od najvecih žarišta koronavirusa u Srbiji.', CAST(N'2021-07-09T13:23:11.6605360' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Posts] ([Id], [Title], [CategoryId], [UserId], [Description], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (34, N'Ðokovic donirao pet miliona dinara Novom Pazaru', 22, 22, N'Bravo Novaku', CAST(N'2021-07-09T13:23:19.6121130' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Posts] ([Id], [Title], [CategoryId], [UserId], [Description], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (35, N'Obavezna samoizolacija za državljane Srbije koji odu u Italiju', 22, 22, N'Državljani Srbije od srede mogu da ulaze u Italiju bez restrikcija, ali i dalje važi obaveza samoizolacije i medicinskog nadzora u trajanju od 14 dana po ulasku u tu zemlju, saopštila je Ambasada Italije u Beogradu.', CAST(N'2021-07-09T13:23:37.0797250' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Posts] ([Id], [Title], [CategoryId], [UserId], [Description], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (36, N'Vesic o izgradnji u bloku 37: Ta zgrada je monstrum i nije joj mesto tamo', 22, 22, N'Ako mene pitate, mislim da je ta zgrada ‘monstrum’ i da toj zgradi nije mesto tamo. Ti ljudi koji rade su iskoristili mogucnost koju im je davao urbanisticki plan, usvojen 2003. a menjan 2009, da grade tu zgradu, ocenio je Vesic', CAST(N'2021-07-09T13:23:50.4325130' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Posts] ([Id], [Title], [CategoryId], [UserId], [Description], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (37, N'Investitor: Prekidamo izgradnju u Bloku 37 dok se ne reši situacija', 19, 22, N'Usled novonastale situacije oko započetih radova na izgradnji našeg objekta u Bulevaru Milutina Milankovića na Novom Beogradu, te uključenja i aktivnosti Grada Beograda u vezi sa aktuelnim dešavanjima, bez obzira na činjenicu što posedujemo urednu i važeću dokumentaciju za izvođenje radove (važeću građevinsku dozvolu, plaćen doprinos za uređenje građevinskog zemljišta i aktuelnu potvrdu o prijavi radova), a kao izraz dobre volje prema Gradu Beogradu i stanarima Bloka 37, počevši od danas, 11. juna 2021, investitor obustavlja sve radove do daljnjeg, odnosno do rešavanja opšte situacije“, zaključili su iz Durst development.', CAST(N'2021-06-11T12:07:59.9807505' AS DateTime2), CAST(N'2021-06-11T12:14:45.8601568' AS DateTime2), 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[UseCaseLogs] ON 

INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1, N'EfGetUsersFrontQuery', N'{"Email":null,"Username":"stefan","PerPage":10,"Page":1,"DateFrom":"0001-01-01T00:00:00","DateTo":"2021-06-09T20:34:15.7278061Z"}', N'Anonymus', CAST(N'2021-06-09T20:34:24.5070156' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (2, N'EfGetUsersFrontQuery', N'{"Email":null,"Username":"stefan","PerPage":10,"Page":1,"DateFrom":"0001-01-01T00:00:00","DateTo":"2021-06-10T17:25:22.4761052Z"}', N'Anonymus', CAST(N'2021-06-10T17:25:33.3548754' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (3, N'EfRegisterUserCommand', N'{"Username":null,"Email":null,"Password":null,"ProfilePhoto":null}', N'Anonymus', CAST(N'2021-06-10T17:29:34.6720374' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (4, N'EfRegisterUserCommand', N'{"Username":"stefan2","Email":"stefan2@gmail.com","Password":"Sifra123","ProfilePhoto":null}', N'Anonymus', CAST(N'2021-06-10T17:31:53.4263906' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (5, N'EfRegisterUserCommand', N'{"Username":"User22","Email":"mail22@gmail.com","Password":"sifra22","ProfilePhoto":null}', N'Anonymus', CAST(N'2021-06-10T17:35:58.3052380' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (6, N'EfRegisterUserCommand', N'{"Username":"User22","Email":"mail22@gmail.com","Password":"sifra22","ProfilePhoto":{"ContentDisposition":"form-data; name=\"ProfilePhoto\"; filename=\"stefan2.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"ProfilePhoto\"; filename=\"stefan2.jpg\""],"Content-Type":["image/jpeg"]},"Length":40201,"Name":"ProfilePhoto","FileName":"stefan2.jpg"}}', N'Anonymus', CAST(N'2021-06-10T17:36:41.1543299' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (7, N'EfRegisterUserCommand', N'{"Username":"User22","Email":"mail22@gmail.com","Password":"sifra22","ProfilePhoto":{"ContentDisposition":"form-data; name=\"ProfilePhoto\"; filename=\"pic4.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"ProfilePhoto\"; filename=\"pic4.png\""],"Content-Type":["image/png"]},"Length":393324,"Name":"ProfilePhoto","FileName":"pic4.png"}}', N'Anonymus', CAST(N'2021-06-10T17:37:19.0671033' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (8, N'EfRegisterUserCommand', N'{"Username":"User24","Email":"mail24@gmail.com","Password":"sifra24","ProfilePhoto":{"ContentDisposition":"form-data; name=\"ProfilePhoto\"; filename=\"stefan.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"ProfilePhoto\"; filename=\"stefan.jpg\""],"Content-Type":["image/jpeg"]},"Length":194948,"Name":"ProfilePhoto","FileName":"stefan.jpg"}}', N'Anonymus', CAST(N'2021-06-10T17:38:38.9014727' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (9, N'EfRegisterUserCommand', N'{"Username":"User24","Email":"mail24@gmail.com","Password":"sifra24","ProfilePhoto":{"ContentDisposition":"form-data; name=\"ProfilePhoto\"; filename=\"stefan.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"ProfilePhoto\"; filename=\"stefan.jpg\""],"Content-Type":["image/jpeg"]},"Length":194948,"Name":"ProfilePhoto","FileName":"stefan.jpg"}}', N'Anonymus', CAST(N'2021-06-10T17:41:40.1548240' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (10, N'EfGetUsersQuery', N'{"Email":null,"Username":null,"PerPage":10,"Page":1,"DateFrom":"0001-01-01T00:00:00","DateTo":"2021-06-10T17:52:18.2029962Z"}', N'Anonymus', CAST(N'2021-06-10T17:52:18.2323199' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (11, N'EfGetUsersQuery', N'{"Email":null,"Username":null,"PerPage":10,"Page":1,"DateFrom":"0001-01-01T00:00:00","DateTo":"2021-06-10T17:52:28.4509694Z"}', N'Anonymus', CAST(N'2021-06-10T17:52:28.4594923' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (12, N'EfGetUsersQuery', N'{"Email":null,"Username":null,"PerPage":10,"Page":1,"DateFrom":"0001-01-01T00:00:00","DateTo":"2021-06-10T17:53:00.8510842Z"}', N'Anonymus', CAST(N'2021-06-10T17:53:00.8558667' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (13, N'EfGetUsersQuery', N'{"Email":null,"Username":null,"PerPage":10,"Page":1,"DateFrom":"0001-01-01T00:00:00","DateTo":"2021-06-10T17:56:46.5778906Z"}', N'User24', CAST(N'2021-06-10T17:56:46.9982842' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (14, N'EfGetUsersQuery', N'{"Email":null,"Username":null,"PerPage":10,"Page":1,"DateFrom":"0001-01-01T00:00:00","DateTo":"2021-06-10T17:59:18.0411656Z"}', N'stefan', CAST(N'2021-06-10T17:59:18.0464424' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (15, N'EfRegisterUserCommand', N'{"Username":"User25","Email":"mail25@gmail.com","Password":"sifra1","ProfilePhoto":{"ContentDisposition":"form-data; name=\"ProfilePhoto\"; filename=\"stefan.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"ProfilePhoto\"; filename=\"stefan.jpg\""],"Content-Type":["image/jpeg"]},"Length":194948,"Name":"ProfilePhoto","FileName":"stefan.jpg"}}', N'Anonymus', CAST(N'2021-06-10T18:05:40.2410266' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (16, N'EfRegisterUserCommand', N'{"Username":"User25","Email":"mail25@gmail.com","Password":"sifra1","ProfilePhoto":null}', N'Anonymus', CAST(N'2021-06-10T18:06:07.8295222' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (17, N'EfRegisterUserCommand', N'{"Username":"User26","Email":"mail26@gmail.com","Password":"sifra1","ProfilePhoto":{"ContentDisposition":"form-data; name=\"ProfilePhoto\"; filename=\"stefan.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"ProfilePhoto\"; filename=\"stefan.jpg\""],"Content-Type":["image/jpeg"]},"Length":194948,"Name":"ProfilePhoto","FileName":"stefan.jpg"}}', N'Anonymus', CAST(N'2021-06-10T18:17:31.0217502' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (18, N'EfGetUsersFrontQuery', N'{"Email":null,"Username":null,"PerPage":10,"Page":1,"DateFrom":"0001-01-01T00:00:00","DateTo":"2021-06-10T18:21:31.5739894Z"}', N'stefan', CAST(N'2021-06-10T18:21:31.5854725' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (19, N'EfAddUserCommand', N'{"Username":"User912","Password":"sifra24","Email":"mail911@gmail.com","ProfilePhoto":null,"UserUseCases":[1]}', N'stefan', CAST(N'2021-06-10T18:27:06.5469996' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (20, N'EfAddUserCommand', N'{"Username":"User912","Password":"sifra24","Email":"mail912@gmail.com","ProfilePhoto":{"ContentDisposition":"form-data; name=\"ProfilePhoto\"; filename=\"stefan.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"ProfilePhoto\"; filename=\"stefan.jpg\""],"Content-Type":["image/jpeg"]},"Length":194948,"Name":"ProfilePhoto","FileName":"stefan.jpg"},"UserUseCases":[1]}', N'stefan', CAST(N'2021-06-10T18:27:42.4997036' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (21, N'EfUpdateUserCommand', N'{"Id":26,"Username":"User912","Email":"user912@gmail.com","ProfilePhoto":{"ContentDisposition":"form-data; name=\"ProfilePhoto\"; filename=\"slika1.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"ProfilePhoto\"; filename=\"slika1.png\""],"Content-Type":["image/png"]},"Length":45566,"Name":"ProfilePhoto","FileName":"slika1.png"},"UserUseCases":[1,10,33]}', N'stefan', CAST(N'2021-06-10T18:29:40.6303012' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (22, N'EfDeleteUserCommand', N'25', N'stefan', CAST(N'2021-06-10T18:31:53.9366937' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (23, N'EfGetOneUserFrontQuery', N'8', N'stefan', CAST(N'2021-06-10T18:33:13.5036559' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (24, N'EfGetOneUserFrontQuery', N'24', N'stefan', CAST(N'2021-06-10T18:33:19.1700690' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (25, N'EfGetOneUserFrontQuery', N'22', N'stefan', CAST(N'2021-06-10T18:33:24.1868426' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (26, N'EfGetOneUserQuery', N'8', N'stefan', CAST(N'2021-06-10T18:34:29.3452764' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (27, N'EfGetOneUserQuery', N'22', N'stefan', CAST(N'2021-06-10T18:34:38.2811990' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (28, N'EfGetCategoriesQuery', N'{"Name":"healt","PerPage":10,"Page":1,"DateFrom":"0001-01-01T00:00:00","DateTo":"2021-06-10T18:35:16.0296482Z"}', N'stefan', CAST(N'2021-06-10T18:35:16.0354712' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (29, N'EfUpdateCategoryCommand', N'{"Id":13,"Name":"New Name 2"}', N'stefan', CAST(N'2021-06-10T18:36:22.2771330' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (30, N'EfGetCategoriesQuery', N'{"Name":"healt","PerPage":10,"Page":1,"DateFrom":"0001-01-01T00:00:00","DateTo":"2021-06-10T18:36:34.513687Z"}', N'stefan', CAST(N'2021-06-10T18:36:34.5165073' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (31, N'EfGetCategoriesQuery', N'{"Name":"2","PerPage":10,"Page":1,"DateFrom":"0001-01-01T00:00:00","DateTo":"2021-06-10T18:37:10.4216081Z"}', N'stefan', CAST(N'2021-06-10T18:37:10.4246752' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (32, N'EfGetCategoriesQuery', N'{"Name":"cat","PerPage":10,"Page":1,"DateFrom":"0001-01-01T00:00:00","DateTo":"2021-06-10T18:37:16.4488332Z"}', N'stefan', CAST(N'2021-06-10T18:37:16.4506493' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (33, N'EfGetPostsQuery', N'{"Keyword":null,"CategoryIds":[],"PerPage":10,"Page":1,"DateFrom":"0001-01-01T00:00:00","DateTo":"2021-06-11T12:05:04.0939913Z"}', N'stefan', CAST(N'2021-06-11T12:05:04.2085587' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (34, N'EfGetOnePostQuery', N'3123', N'stefan', CAST(N'2021-06-11T12:05:32.0449505' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (35, N'EfGetOnePostQuery', N'23', N'stefan', CAST(N'2021-06-11T12:05:53.4020381' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (36, N'EfAddPostCommand', N'{"Title":"Investitor: Prekidamo izgradnju u Bloku 37 dok se ne reši situacija","Description":"Durst development doo Beograd, investitor objekta u Bloku 37 protiv čije izgradnje protestuju građani tog dela grada, saopštio je da obustavlja sve radove do daljeg.Kako se navodi u saopštenju te kompanije, oni to čine kao „izraz dobre volje prema Gradu Beogradu i stanarima Bloka 37“.","UserId":22,"CategoryId":4}', N'stefan', CAST(N'2021-06-11T12:07:34.1410184' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (37, N'EfAddPostCommand', N'{"Title":"Investitor: Prekidamo izgradnju u Bloku 37 dok se ne reši situacija","Description":"Durst development doo Beograd, investitor objekta u Bloku 37 protiv čije izgradnje protestuju građani tog dela grada, saopštio je da obustavlja sve radove do daljeg.Kako se navodi u saopštenju te kompanije, oni to čine kao „izraz dobre volje prema Gradu Beogradu i stanarima Bloka 37“.","UserId":22,"CategoryId":12}', N'stefan', CAST(N'2021-06-11T12:07:50.7648192' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (38, N'EfAddPostCommand', N'{"Title":"Investitor: Prekidamo izgradnju u Bloku 37 dok se ne reši situacija","Description":"Durst development doo Beograd, investitor objekta u Bloku 37 protiv čije izgradnje protestuju građani tog dela grada, saopštio je da obustavlja sve radove do daljeg.Kako se navodi u saopštenju te kompanije, oni to čine kao „izraz dobre volje prema Gradu Beogradu i stanarima Bloka 37“.","UserId":22,"CategoryId":18}', N'stefan', CAST(N'2021-06-11T12:07:59.9489795' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (39, N'EfGetPostsQuery', N'{"Keyword":null,"CategoryIds":[],"PerPage":10,"Page":1,"DateFrom":"0001-01-01T00:00:00","DateTo":"2021-06-11T12:08:28.1760642Z"}', N'stefan', CAST(N'2021-06-11T12:08:28.1821333' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (40, N'EfGetOnePostQuery', N'10', N'stefan', CAST(N'2021-06-11T12:09:52.1151177' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (41, N'EfGetPostsQuery', N'{"Keyword":null,"CategoryIds":[],"PerPage":10,"Page":1,"DateFrom":"0001-01-01T00:00:00","DateTo":"2021-06-11T12:10:22.9755682Z"}', N'stefan', CAST(N'2021-06-11T12:10:22.9771387' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (42, N'EfGetPostsQuery', N'{"Keyword":null,"CategoryIds":[],"PerPage":25,"Page":1,"DateFrom":"2021-06-09T00:00:00","DateTo":"2021-06-01T00:00:00"}', N'stefan', CAST(N'2021-06-11T12:11:53.0834978' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (43, N'EfGetPostsQuery', N'{"Keyword":null,"CategoryIds":[],"PerPage":25,"Page":1,"DateFrom":"2021-06-01T00:00:00","DateTo":"2021-06-09T00:00:00"}', N'stefan', CAST(N'2021-06-11T12:12:16.0804109' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (44, N'EfGetPostsQuery', N'{"Keyword":null,"CategoryIds":[],"PerPage":25,"Page":1,"DateFrom":"2021-05-01T00:00:00","DateTo":"2021-06-09T00:00:00"}', N'stefan', CAST(N'2021-06-11T12:12:51.2180008' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (45, N'EfGetPostsQuery', N'{"Keyword":null,"CategoryIds":[],"PerPage":10,"Page":1,"DateFrom":"0001-01-01T00:00:00","DateTo":"2021-06-11T12:13:37.0497051Z"}', N'stefan', CAST(N'2021-06-11T12:13:37.0561876' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (46, N'EfGetOnePostQuery', N'37', N'stefan', CAST(N'2021-06-11T12:13:49.9705961' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (47, N'EfUpdatePostCommand', N'{"Id":37,"Title":null,"Description":"Usled novonastale situacije oko započetih radova na izgradnji našeg objekta u Bulevaru Milutina Milankovića na Novom Beogradu, te uključenja i aktivnosti Grada Beograda u vezi sa aktuelnim dešavanjima, bez obzira na činjenicu što posedujemo urednu i važeću dokumentaciju za izvođenje radove (važeću građevinsku dozvolu, plaćen doprinos za uređenje građevinskog zemljišta i aktuelnu potvrdu o prijavi radova), a kao izraz dobre volje prema Gradu Beogradu i stanarima Bloka 37, počevši od danas, 11. juna 2021, investitor obustavlja sve radove do daljnjeg, odnosno do rešavanja opšte situacije“, zaključili su iz Durst development.","CategoryId":19}', N'stefan', CAST(N'2021-06-11T12:14:07.7994167' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (48, N'EfUpdatePostCommand', N'{"Id":37,"Title":"Investitor: Prekidamo izgradnju u Bloku 37 dok se ne reši situacija","Description":"Usled novonastale situacije oko započetih radova na izgradnji našeg objekta u Bulevaru Milutina Milankovića na Novom Beogradu, te uključenja i aktivnosti Grada Beograda u vezi sa aktuelnim dešavanjima, bez obzira na činjenicu što posedujemo urednu i važeću dokumentaciju za izvođenje radove (važeću građevinsku dozvolu, plaćen doprinos za uređenje građevinskog zemljišta i aktuelnu potvrdu o prijavi radova), a kao izraz dobre volje prema Gradu Beogradu i stanarima Bloka 37, počevši od danas, 11. juna 2021, investitor obustavlja sve radove do daljnjeg, odnosno do rešavanja opšte situacije“, zaključili su iz Durst development.","CategoryId":19}', N'stefan', CAST(N'2021-06-11T12:14:45.8196290' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (49, N'EfGetOnePostQuery', N'37', N'stefan', CAST(N'2021-06-11T12:14:49.7233623' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (50, N'ContactCommand', N'{"Subject":"Ovo je naslov","Content":"TestTestTest","SendFrom":"zika@gmail.com"}', N'stefan', CAST(N'2021-06-11T12:16:56.9898035' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (51, N'ContactCommand', N'{"Subject":"Ovo je naslov","Content":"TestTestTest","SendFrom":"zika@gmail.com"}', N'stefan', CAST(N'2021-06-11T12:22:04.4423837' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (52, N'EfGetLogQuest', N'{"Actor":"stefan","UseCaseName":"Log","PerPage":10,"Page":1,"DateFrom":"0001-01-01T00:00:00","DateTo":"2021-06-11T12:24:00.9721162Z"}', N'stefan', CAST(N'2021-06-11T12:24:00.9756706' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (53, N'EfGetLogQuest', N'{"Actor":"stefan","UseCaseName":"Log","PerPage":25,"Page":1,"DateFrom":"0001-01-01T00:00:00","DateTo":"2021-06-11T12:24:23.3629522Z"}', N'stefan', CAST(N'2021-06-11T12:24:23.3648998' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [Data], [Actor], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (54, N'EfGetLogQuest', N'{"Actor":"stefan","UseCaseName":null,"PerPage":25,"Page":1,"DateFrom":"0001-01-01T00:00:00","DateTo":"2021-06-11T12:25:21.8380728Z"}', N'stefan', CAST(N'2021-06-11T12:25:21.8398296' AS DateTime2), NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[UseCaseLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [ProfilePhoto], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1, N'User', N'mail4@gmail.com', N'eab6a342dd366f18110133d7bf26ae123871f22b4e33e16e8b77f8307f4ec327', N'b9aaf12b-2b6b-4e39-933d-277235190282.png', CAST(N'2021-06-01T22:56:07.9050310' AS DateTime2), CAST(N'2021-06-07T12:11:16.0981630' AS DateTime2), 1, CAST(N'2021-06-07T12:11:16.0851480' AS DateTime2), 1)
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [ProfilePhoto], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (2, N'User7', N'mail7@gmail.com', N'eab6a342dd366f18110133d7bf26ae123871f22b4e33e16e8b77f8307f4ec327', N'8feb4ce9-b054-4d01-9330-8036666d9270.png', CAST(N'2021-06-02T16:56:01.0948610' AS DateTime2), CAST(N'2021-06-06T00:50:55.1392450' AS DateTime2), 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [ProfilePhoto], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (3, N'Pavle1', N'pavle1@gmail.com', N'eab6a342dd366f18110133d7bf26ae123871f22b4e33e16e8b77f8307f4ec327', N'ecd9fae2-56d9-40df-a83c-b1d09b95139e.png', CAST(N'2021-06-02T17:27:12.9394450' AS DateTime2), CAST(N'2021-06-07T14:34:17.4418160' AS DateTime2), 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [ProfilePhoto], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (4, N'User6', N'mail6@gmail.com', N'eab6a342dd366f18110133d7bf26ae123871f22b4e33e16e8b77f8307f4ec327', N'3482dab4-51ae-4a33-88d7-97b38528ea8d.png', CAST(N'2021-06-02T18:31:03.2083250' AS DateTime2), CAST(N'2021-06-03T21:48:51.7788290' AS DateTime2), 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [ProfilePhoto], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (5, N'User1', N'mail1@gmail.com', N'eab6a342dd366f18110133d7bf26ae123871f22b4e33e16e8b77f8307f4ec327', N'5a8132a5-aee0-49c5-817c-b1908a21db14.jpg', CAST(N'2021-06-03T13:58:01.7902100' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [ProfilePhoto], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (6, N'User9', N'mail9@gmail.com', N'eab6a342dd366f18110133d7bf26ae123871f22b4e33e16e8b77f8307f4ec327', N'20096337-babd-4812-aba0-23209784ca56.jpg', CAST(N'2021-06-03T14:03:43.0043470' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [ProfilePhoto], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (7, N'User911', N'mail911@gmail.com', N'eab6a342dd366f18110133d7bf26ae123871f22b4e33e16e8b77f8307f4ec327', N'14661eb1-4edc-48b5-9fc4-ab341ed7c3a2.jpg', CAST(N'2021-06-06T14:51:30.1837460' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [ProfilePhoto], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (8, N'UName1', N'uname1@gmail.com', N'eab6a342dd366f18110133d7bf26ae123871f22b4e33e16e8b77f8307f4ec327', N'2c430d64-c1ea-4de1-9ffa-cd872d4bc27d.jpg', CAST(N'2021-06-07T23:11:29.4921530' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [ProfilePhoto], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (9, N'UName2', N'uname2@gmail.com', N'eab6a342dd366f18110133d7bf26ae123871f22b4e33e16e8b77f8307f4ec327', N'dec99e29-345e-4fb8-803a-db04bbba0d38.jpg', CAST(N'2021-06-07T23:12:42.4318060' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [ProfilePhoto], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (10, N'UName3', N'uname3@gmail.com', N'eab6a342dd366f18110133d7bf26ae123871f22b4e33e16e8b77f8307f4ec327', N'8652d795-1f87-469e-8fd4-c8970da4920c.jpg', CAST(N'2021-06-07T23:14:49.1921030' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [ProfilePhoto], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (11, N'UName4', N'uname4@gmail.com', N'eab6a342dd366f18110133d7bf26ae123871f22b4e33e16e8b77f8307f4ec327', N'206280d1-66bb-48d1-a99b-303fd4496b0b.jpg', CAST(N'2021-06-07T23:14:55.1166560' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [ProfilePhoto], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (12, N'UName5', N'uname5@gmail.com', N'eab6a342dd366f18110133d7bf26ae123871f22b4e33e16e8b77f8307f4ec327', N'9152d5db-267d-40f7-a466-fe2245c5804f.jpg', CAST(N'2021-06-07T23:24:29.0563950' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [ProfilePhoto], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (13, N'UName6', N'uname6@gmail.com', N'eab6a342dd366f18110133d7bf26ae123871f22b4e33e16e8b77f8307f4ec327', N'ad1029c8-4338-4416-a91c-e39e55ac831c.jpg', CAST(N'2021-06-07T23:24:34.4974260' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [ProfilePhoto], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (14, N'UName7', N'uname7@gmail.com', N'eab6a342dd366f18110133d7bf26ae123871f22b4e33e16e8b77f8307f4ec327', N'13b7d9a3-6d0a-4fb5-a936-248f003373e9.jpg', CAST(N'2021-06-07T23:24:40.5331350' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [ProfilePhoto], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (15, N'UName8', N'uname8@gmail.com', N'eab6a342dd366f18110133d7bf26ae123871f22b4e33e16e8b77f8307f4ec327', N'a81616f2-0442-4f76-aefe-00e7620f517e.jpg', CAST(N'2021-06-07T23:24:46.4568000' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [ProfilePhoto], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (16, N'Pera', N'pera@gmail.com', N'eab6a342dd366f18110133d7bf26ae123871f22b4e33e16e8b77f8307f4ec327', N'894be2cd-2972-4c98-b25a-0aeea4dd8fbc.jpg', CAST(N'2021-06-07T23:24:57.0274160' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [ProfilePhoto], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (17, N'Peric', N'peric@gmail.com', N'eab6a342dd366f18110133d7bf26ae123871f22b4e33e16e8b77f8307f4ec327', N'a6140597-24f5-45d1-a364-6a579f1075e9.jpg', CAST(N'2021-06-07T23:25:06.0594360' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [ProfilePhoto], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (18, N'Mika', N'mikic@gmail.com', N'eab6a342dd366f18110133d7bf26ae123871f22b4e33e16e8b77f8307f4ec327', N'70a33a91-0cd0-4471-a612-bfaa97f832d2.jpg', CAST(N'2021-06-07T23:25:14.4189730' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [ProfilePhoto], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (19, N'Mikic', N'mika@gmail.com', N'eab6a342dd366f18110133d7bf26ae123871f22b4e33e16e8b77f8307f4ec327', N'774ba5bb-1c4a-4d46-a966-f8b1674d9196.jpg', CAST(N'2021-06-07T23:25:22.9746090' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [ProfilePhoto], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (20, N'Laza', N'laza@gmail.com', N'eab6a342dd366f18110133d7bf26ae123871f22b4e33e16e8b77f8307f4ec327', N'48612611-561b-4900-a46c-80949d1301a0.jpg', CAST(N'2021-06-07T23:25:29.4609240' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [ProfilePhoto], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (21, N'lazic', N'lazic@gmail.com', N'eab6a342dd366f18110133d7bf26ae123871f22b4e33e16e8b77f8307f4ec327', N'82c126d1-d506-43ad-825a-f4160833ed29.jpg', CAST(N'2021-06-07T23:25:37.2023830' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [ProfilePhoto], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (22, N'stefan', N'stefan@gmail.com', N'eab6a342dd366f18110133d7bf26ae123871f22b4e33e16e8b77f8307f4ec327', N'3344d430-1ab5-4e20-8cda-d53c87c0fff5.jpg', CAST(N'2021-06-07T23:25:51.0017490' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [ProfilePhoto], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (23, N'User24', N'mail24@gmail.com', N'eab6a342dd366f18110133d7bf26ae123871f22b4e33e16e8b77f8307f4ec327', N'c7bf8bb8-7f08-4ded-b94f-460e01ffe978.jpg', CAST(N'2021-06-10T17:41:41.2551051' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [ProfilePhoto], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (24, N'User25', N'mail25@gmail.com', N'eab6a342dd366f18110133d7bf26ae123871f22b4e33e16e8b77f8307f4ec327', N'9113ab4c-28a0-43bf-81df-484e7e5753c8.jpg', CAST(N'2021-06-10T18:05:41.4210979' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [ProfilePhoto], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (25, N'User26', N'mail26@gmail.com', N'eab6a342dd366f18110133d7bf26ae123871f22b4e33e16e8b77f8307f4ec327', N'e80129d7-208e-4c29-a801-5061a0c0cfc7.jpg', CAST(N'2021-06-10T18:17:32.1272499' AS DateTime2), CAST(N'2021-06-10T18:31:53.9624194' AS DateTime2), 1, CAST(N'2021-06-10T18:31:53.9623299' AS DateTime2), 1)
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [ProfilePhoto], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (26, N'User912', N'user912@gmail.com', N'eab6a342dd366f18110133d7bf26ae123871f22b4e33e16e8b77f8307f4ec327', N'1214fbcc-9266-4521-94ab-e83654a361e7.png', CAST(N'2021-06-10T18:27:42.5143078' AS DateTime2), CAST(N'2021-06-10T18:29:40.7128376' AS DateTime2), 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserUseCases] ON 

INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (224, 1, 1, CAST(N'2021-06-01T21:48:51.7788280' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (225, 1, 10, CAST(N'2021-06-01T21:48:51.7788290' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (226, 2, 1, CAST(N'2021-06-03T13:58:01.8154530' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (227, 4, 2, CAST(N'2021-06-03T13:58:01.8154540' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (228, 4, 3, CAST(N'2021-06-03T13:58:01.8154540' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (229, 4, 1, CAST(N'2021-06-03T14:03:43.0670550' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (230, 5, 1, CAST(N'2021-06-05T00:50:55.1392440' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (231, 5, 10, CAST(N'2021-06-05T00:50:55.1392440' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (232, 5, 33, CAST(N'2021-06-05T00:50:55.1392450' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (233, 6, 1, CAST(N'2021-06-05T00:52:44.9444000' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (234, 6, 10, CAST(N'2021-06-05T00:52:44.9444080' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (235, 6, 33, CAST(N'2021-06-05T00:52:44.9444120' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (236, 7, 1, CAST(N'2021-06-06T14:34:17.4418110' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (237, 7, 10, CAST(N'2021-06-06T14:34:17.4418160' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (238, 7, 33, CAST(N'2021-06-06T14:34:17.4418160' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (239, 8, 1, CAST(N'2021-06-06T14:51:30.2656790' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (240, 8, 16, CAST(N'2021-06-07T23:11:29.5378900' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (241, 8, 17, CAST(N'2021-06-07T23:11:29.5378900' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (242, 8, 18, CAST(N'2021-06-07T23:11:29.5378900' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (243, 8, 20, CAST(N'2021-06-07T23:11:29.5378910' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (244, 8, 30, CAST(N'2021-06-07T23:11:29.5378910' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (245, 8, 31, CAST(N'2021-06-07T23:11:29.5378910' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (246, 8, 32, CAST(N'2021-06-07T23:11:29.5378910' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (247, 8, 33, CAST(N'2021-06-07T23:11:29.5378910' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (248, 8, 35, CAST(N'2021-06-07T23:11:29.5378920' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (249, 8, 42, CAST(N'2021-06-07T23:11:29.5378920' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (250, 8, 43, CAST(N'2021-06-07T23:11:29.5378920' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (251, 8, 45, CAST(N'2021-06-07T23:11:29.5378920' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (252, 8, 400, CAST(N'2021-06-07T23:11:29.5378920' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (253, 9, 16, CAST(N'2021-06-07T23:12:42.4456550' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (254, 9, 17, CAST(N'2021-06-07T23:12:42.4456560' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (255, 9, 18, CAST(N'2021-06-07T23:12:42.4456560' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (256, 9, 20, CAST(N'2021-06-07T23:12:42.4456560' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (257, 9, 30, CAST(N'2021-06-07T23:12:42.4456570' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (258, 9, 31, CAST(N'2021-06-07T23:12:42.4456570' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (259, 9, 32, CAST(N'2021-06-07T23:12:42.4456570' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (260, 9, 33, CAST(N'2021-06-07T23:12:42.4456570' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (261, 9, 35, CAST(N'2021-06-07T23:12:42.4456570' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (262, 9, 42, CAST(N'2021-06-07T23:12:42.4456580' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (263, 9, 43, CAST(N'2021-06-07T23:12:42.4456580' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (264, 9, 45, CAST(N'2021-06-07T23:12:42.4456580' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (265, 9, 400, CAST(N'2021-06-07T23:12:42.4456580' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (266, 10, 16, CAST(N'2021-06-07T23:14:49.2030370' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (267, 10, 17, CAST(N'2021-06-07T23:14:49.2030400' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (268, 10, 18, CAST(N'2021-06-07T23:14:49.2030640' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (269, 10, 20, CAST(N'2021-06-07T23:14:49.2030670' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (270, 10, 30, CAST(N'2021-06-07T23:14:49.2030700' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (271, 10, 31, CAST(N'2021-06-07T23:14:49.2030720' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (272, 10, 32, CAST(N'2021-06-07T23:14:49.2030750' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (273, 10, 33, CAST(N'2021-06-07T23:14:49.2030770' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (274, 10, 35, CAST(N'2021-06-07T23:14:49.2030800' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (275, 10, 42, CAST(N'2021-06-07T23:14:49.2030900' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (276, 10, 43, CAST(N'2021-06-07T23:14:49.2030930' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (277, 10, 45, CAST(N'2021-06-07T23:14:49.2030960' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (278, 10, 400, CAST(N'2021-06-07T23:14:49.2030980' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (279, 11, 16, CAST(N'2021-06-07T23:14:55.1211810' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (280, 11, 17, CAST(N'2021-06-07T23:14:55.1211820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (281, 11, 18, CAST(N'2021-06-07T23:14:55.1211820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (282, 11, 20, CAST(N'2021-06-07T23:14:55.1211820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (283, 11, 30, CAST(N'2021-06-07T23:14:55.1211830' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (284, 11, 31, CAST(N'2021-06-07T23:14:55.1211830' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (285, 11, 32, CAST(N'2021-06-07T23:14:55.1211830' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (286, 11, 33, CAST(N'2021-06-07T23:14:55.1211830' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (287, 11, 35, CAST(N'2021-06-07T23:14:55.1211830' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (288, 11, 42, CAST(N'2021-06-07T23:14:55.1211830' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (289, 11, 43, CAST(N'2021-06-07T23:14:55.1211840' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (290, 11, 45, CAST(N'2021-06-07T23:14:55.1211840' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (291, 11, 400, CAST(N'2021-06-07T23:14:55.1211840' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (292, 12, 16, CAST(N'2021-06-07T23:24:29.0602380' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (293, 12, 17, CAST(N'2021-06-07T23:24:29.0602390' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (294, 12, 18, CAST(N'2021-06-07T23:24:29.0602390' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (295, 12, 20, CAST(N'2021-06-07T23:24:29.0602390' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (296, 12, 30, CAST(N'2021-06-07T23:24:29.0602390' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (297, 12, 31, CAST(N'2021-06-07T23:24:29.0602390' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (298, 12, 32, CAST(N'2021-06-07T23:24:29.0602390' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (299, 12, 33, CAST(N'2021-06-07T23:24:29.0602400' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (300, 12, 35, CAST(N'2021-06-07T23:24:29.0602400' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (301, 12, 42, CAST(N'2021-06-07T23:24:29.0602400' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (302, 12, 43, CAST(N'2021-06-07T23:24:29.0602400' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (303, 12, 45, CAST(N'2021-06-07T23:24:29.0602400' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (304, 12, 400, CAST(N'2021-06-07T23:24:29.0602400' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (305, 13, 16, CAST(N'2021-06-07T23:24:34.5007570' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (306, 13, 17, CAST(N'2021-06-07T23:24:34.5007570' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (307, 13, 18, CAST(N'2021-06-07T23:24:34.5007570' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (308, 13, 20, CAST(N'2021-06-07T23:24:34.5007570' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (309, 13, 30, CAST(N'2021-06-07T23:24:34.5007570' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (310, 13, 31, CAST(N'2021-06-07T23:24:34.5007580' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (311, 13, 32, CAST(N'2021-06-07T23:24:34.5007580' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (312, 13, 33, CAST(N'2021-06-07T23:24:34.5007580' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (313, 13, 35, CAST(N'2021-06-07T23:24:34.5007580' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (314, 13, 42, CAST(N'2021-06-07T23:24:34.5007580' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (315, 13, 43, CAST(N'2021-06-07T23:24:34.5007580' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (316, 13, 45, CAST(N'2021-06-07T23:24:34.5007580' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (317, 13, 400, CAST(N'2021-06-07T23:24:34.5007590' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (318, 14, 16, CAST(N'2021-06-07T23:24:40.5363590' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (319, 14, 17, CAST(N'2021-06-07T23:24:40.5363600' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (320, 14, 18, CAST(N'2021-06-07T23:24:40.5363600' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (321, 14, 20, CAST(N'2021-06-07T23:24:40.5363600' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (322, 14, 30, CAST(N'2021-06-07T23:24:40.5363600' AS DateTime2), NULL, 0, NULL, 1)
GO
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (323, 14, 31, CAST(N'2021-06-07T23:24:40.5363610' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (324, 14, 32, CAST(N'2021-06-07T23:24:40.5363610' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (325, 14, 33, CAST(N'2021-06-07T23:24:40.5363610' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (326, 14, 35, CAST(N'2021-06-07T23:24:40.5363610' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (327, 14, 42, CAST(N'2021-06-07T23:24:40.5363610' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (328, 14, 43, CAST(N'2021-06-07T23:24:40.5363610' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (329, 14, 45, CAST(N'2021-06-07T23:24:40.5363620' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (330, 14, 400, CAST(N'2021-06-07T23:24:40.5363620' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (331, 15, 16, CAST(N'2021-06-07T23:24:46.4596430' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (332, 15, 17, CAST(N'2021-06-07T23:24:46.4596440' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (333, 15, 18, CAST(N'2021-06-07T23:24:46.4596440' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (334, 15, 20, CAST(N'2021-06-07T23:24:46.4596440' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (335, 15, 30, CAST(N'2021-06-07T23:24:46.4596440' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (336, 15, 31, CAST(N'2021-06-07T23:24:46.4596450' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (337, 15, 32, CAST(N'2021-06-07T23:24:46.4596450' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (338, 15, 33, CAST(N'2021-06-07T23:24:46.4596450' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (339, 15, 35, CAST(N'2021-06-07T23:24:46.4596450' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (340, 15, 42, CAST(N'2021-06-07T23:24:46.4596450' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (341, 15, 43, CAST(N'2021-06-07T23:24:46.4596450' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (342, 15, 45, CAST(N'2021-06-07T23:24:46.4596450' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (343, 15, 400, CAST(N'2021-06-07T23:24:46.4596460' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (344, 16, 16, CAST(N'2021-06-07T23:24:57.0299230' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (345, 16, 17, CAST(N'2021-06-07T23:24:57.0299240' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (346, 16, 18, CAST(N'2021-06-07T23:24:57.0299240' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (347, 16, 20, CAST(N'2021-06-07T23:24:57.0299240' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (348, 16, 30, CAST(N'2021-06-07T23:24:57.0299240' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (349, 16, 31, CAST(N'2021-06-07T23:24:57.0299240' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (350, 16, 32, CAST(N'2021-06-07T23:24:57.0299250' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (351, 16, 33, CAST(N'2021-06-07T23:24:57.0299250' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (352, 16, 35, CAST(N'2021-06-07T23:24:57.0299250' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (353, 16, 42, CAST(N'2021-06-07T23:24:57.0299250' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (354, 16, 43, CAST(N'2021-06-07T23:24:57.0299250' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (355, 16, 45, CAST(N'2021-06-07T23:24:57.0299250' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (356, 16, 400, CAST(N'2021-06-07T23:24:57.0299250' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (357, 17, 16, CAST(N'2021-06-07T23:25:06.0634370' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (358, 17, 17, CAST(N'2021-06-07T23:25:06.0634370' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (359, 17, 18, CAST(N'2021-06-07T23:25:06.0634380' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (360, 17, 20, CAST(N'2021-06-07T23:25:06.0634380' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (361, 17, 30, CAST(N'2021-06-07T23:25:06.0634380' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (362, 17, 31, CAST(N'2021-06-07T23:25:06.0634380' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (363, 17, 32, CAST(N'2021-06-07T23:25:06.0634390' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (364, 17, 33, CAST(N'2021-06-07T23:25:06.0634390' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (365, 17, 35, CAST(N'2021-06-07T23:25:06.0634390' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (366, 17, 42, CAST(N'2021-06-07T23:25:06.0634390' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (367, 17, 43, CAST(N'2021-06-07T23:25:06.0634400' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (368, 17, 45, CAST(N'2021-06-07T23:25:06.0634400' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (369, 17, 400, CAST(N'2021-06-07T23:25:06.0634400' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (370, 18, 16, CAST(N'2021-06-07T23:25:14.4238390' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (371, 18, 17, CAST(N'2021-06-07T23:25:14.4238400' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (372, 18, 18, CAST(N'2021-06-07T23:25:14.4238410' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (373, 18, 20, CAST(N'2021-06-07T23:25:14.4238410' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (374, 18, 30, CAST(N'2021-06-07T23:25:14.4238410' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (375, 18, 31, CAST(N'2021-06-07T23:25:14.4238410' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (376, 18, 32, CAST(N'2021-06-07T23:25:14.4238410' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (377, 18, 33, CAST(N'2021-06-07T23:25:14.4238420' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (378, 18, 35, CAST(N'2021-06-07T23:25:14.4238420' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (379, 18, 42, CAST(N'2021-06-07T23:25:14.4238420' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (380, 18, 43, CAST(N'2021-06-07T23:25:14.4238420' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (381, 18, 45, CAST(N'2021-06-07T23:25:14.4238430' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (382, 18, 400, CAST(N'2021-06-07T23:25:14.4238430' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (383, 19, 16, CAST(N'2021-06-07T23:25:22.9779130' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (384, 19, 17, CAST(N'2021-06-07T23:25:22.9779140' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (385, 19, 18, CAST(N'2021-06-07T23:25:22.9779140' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (386, 19, 20, CAST(N'2021-06-07T23:25:22.9779140' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (387, 19, 30, CAST(N'2021-06-07T23:25:22.9779140' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (388, 19, 31, CAST(N'2021-06-07T23:25:22.9779140' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (389, 19, 32, CAST(N'2021-06-07T23:25:22.9779140' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (390, 19, 33, CAST(N'2021-06-07T23:25:22.9779150' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (391, 19, 35, CAST(N'2021-06-07T23:25:22.9779150' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (392, 19, 42, CAST(N'2021-06-07T23:25:22.9779150' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (393, 19, 43, CAST(N'2021-06-07T23:25:22.9779150' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (394, 19, 45, CAST(N'2021-06-07T23:25:22.9779150' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (395, 19, 400, CAST(N'2021-06-07T23:25:22.9779150' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (396, 20, 16, CAST(N'2021-06-07T23:25:29.4641280' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (397, 20, 17, CAST(N'2021-06-07T23:25:29.4641280' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (398, 20, 18, CAST(N'2021-06-07T23:25:29.4641290' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (399, 20, 20, CAST(N'2021-06-07T23:25:29.4641290' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (400, 20, 30, CAST(N'2021-06-07T23:25:29.4641290' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (401, 20, 31, CAST(N'2021-06-07T23:25:29.4641290' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (402, 20, 32, CAST(N'2021-06-07T23:25:29.4641290' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (403, 20, 33, CAST(N'2021-06-07T23:25:29.4641290' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (404, 20, 35, CAST(N'2021-06-07T23:25:29.4641300' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (405, 20, 42, CAST(N'2021-06-07T23:25:29.4641300' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (406, 20, 43, CAST(N'2021-06-07T23:25:29.4641300' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (407, 20, 45, CAST(N'2021-06-07T23:25:29.4641300' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (408, 20, 400, CAST(N'2021-06-07T23:25:29.4641300' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (409, 21, 16, CAST(N'2021-06-07T23:25:37.2067560' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (410, 21, 17, CAST(N'2021-06-07T23:25:37.2067560' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (411, 21, 18, CAST(N'2021-06-07T23:25:37.2067560' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (412, 21, 20, CAST(N'2021-06-07T23:25:37.2067570' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (413, 21, 30, CAST(N'2021-06-07T23:25:37.2067570' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (414, 21, 31, CAST(N'2021-06-07T23:25:37.2067570' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (415, 21, 32, CAST(N'2021-06-07T23:25:37.2067570' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (416, 21, 33, CAST(N'2021-06-07T23:25:37.2067570' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (417, 21, 35, CAST(N'2021-06-07T23:25:37.2067570' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (418, 21, 42, CAST(N'2021-06-07T23:25:37.2067570' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (419, 21, 43, CAST(N'2021-06-07T23:25:37.2067580' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (420, 21, 45, CAST(N'2021-06-07T23:25:37.2067580' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (421, 21, 400, CAST(N'2021-06-07T23:25:37.2067580' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (422, 22, 16, CAST(N'2021-06-07T23:25:51.0216390' AS DateTime2), NULL, 0, NULL, 1)
GO
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (423, 22, 17, CAST(N'2021-06-07T23:25:51.0216400' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (424, 22, 18, CAST(N'2021-06-07T23:25:51.0216410' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (425, 22, 20, CAST(N'2021-06-07T23:25:51.0216410' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (426, 22, 30, CAST(N'2021-06-07T23:25:51.0216410' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (427, 22, 31, CAST(N'2021-06-07T23:25:51.0216420' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (428, 22, 32, CAST(N'2021-06-07T23:25:51.0216420' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (429, 22, 33, CAST(N'2021-06-07T23:25:51.0216420' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (430, 22, 35, CAST(N'2021-06-07T23:25:51.0216420' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (431, 22, 42, CAST(N'2021-06-07T23:25:51.0216430' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (432, 22, 43, CAST(N'2021-06-07T23:25:51.0216430' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (433, 22, 45, CAST(N'2021-06-07T23:25:51.0216430' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (434, 22, 400, CAST(N'2021-06-07T23:25:51.0216440' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (435, 22, 10, CAST(N'2021-06-08T11:56:56.4896940' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (436, 22, 11, CAST(N'2021-06-08T11:56:56.4896990' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (437, 22, 12, CAST(N'2021-06-08T11:56:56.4897000' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (438, 22, 13, CAST(N'2021-06-08T11:56:56.4897000' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (439, 22, 14, CAST(N'2021-06-08T11:56:56.4897000' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (440, 22, 22, CAST(N'2021-06-08T11:56:56.4897000' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (441, 22, 23, CAST(N'2021-06-08T11:56:56.4897010' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (442, 22, 24, CAST(N'2021-06-08T11:56:56.4897010' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (443, 22, 34, CAST(N'2021-06-08T11:56:56.4897010' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (444, 22, 44, CAST(N'2021-06-08T11:56:56.4897020' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (445, 22, 700, CAST(N'2021-06-08T11:56:56.4897020' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (446, 22, 701, CAST(N'2021-06-08T11:56:56.4897020' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (447, 23, 16, CAST(N'2021-06-10T17:41:41.3096067' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (448, 23, 17, CAST(N'2021-06-10T17:41:41.3096092' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (449, 23, 18, CAST(N'2021-06-10T17:41:41.3096096' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (450, 23, 20, CAST(N'2021-06-10T17:41:41.3096098' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (451, 23, 30, CAST(N'2021-06-10T17:41:41.3096100' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (452, 23, 31, CAST(N'2021-06-10T17:41:41.3096103' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (453, 23, 32, CAST(N'2021-06-10T17:41:41.3096107' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (454, 23, 33, CAST(N'2021-06-10T17:41:41.3096110' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (455, 23, 35, CAST(N'2021-06-10T17:41:41.3096113' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (456, 23, 42, CAST(N'2021-06-10T17:41:41.3096115' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (457, 23, 43, CAST(N'2021-06-10T17:41:41.3096117' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (458, 23, 45, CAST(N'2021-06-10T17:41:41.3096120' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (459, 23, 400, CAST(N'2021-06-10T17:41:41.3096122' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (460, 24, 16, CAST(N'2021-06-10T18:05:41.4745200' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (461, 24, 17, CAST(N'2021-06-10T18:05:41.4745222' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (462, 24, 18, CAST(N'2021-06-10T18:05:41.4745224' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (463, 24, 20, CAST(N'2021-06-10T18:05:41.4745226' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (464, 24, 30, CAST(N'2021-06-10T18:05:41.4745229' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (465, 24, 31, CAST(N'2021-06-10T18:05:41.4745231' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (466, 24, 32, CAST(N'2021-06-10T18:05:41.4745233' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (467, 24, 33, CAST(N'2021-06-10T18:05:41.4745236' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (468, 24, 35, CAST(N'2021-06-10T18:05:41.4745238' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (469, 24, 42, CAST(N'2021-06-10T18:05:41.4745240' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (470, 24, 43, CAST(N'2021-06-10T18:05:41.4745243' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (471, 24, 45, CAST(N'2021-06-10T18:05:41.4745245' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (472, 24, 400, CAST(N'2021-06-10T18:05:41.4745247' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (473, 25, 16, CAST(N'2021-06-10T18:17:32.1802647' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (474, 25, 17, CAST(N'2021-06-10T18:17:32.1802664' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (475, 25, 18, CAST(N'2021-06-10T18:17:32.1802666' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (476, 25, 20, CAST(N'2021-06-10T18:17:32.1802669' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (477, 25, 30, CAST(N'2021-06-10T18:17:32.1802671' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (478, 25, 31, CAST(N'2021-06-10T18:17:32.1802673' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (479, 25, 32, CAST(N'2021-06-10T18:17:32.1802675' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (480, 25, 33, CAST(N'2021-06-10T18:17:32.1802677' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (481, 25, 35, CAST(N'2021-06-10T18:17:32.1802679' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (482, 25, 42, CAST(N'2021-06-10T18:17:32.1802681' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (483, 25, 43, CAST(N'2021-06-10T18:17:32.1802683' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (484, 25, 45, CAST(N'2021-06-10T18:17:32.1802685' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (485, 25, 400, CAST(N'2021-06-10T18:17:32.1802687' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (487, 26, 1, CAST(N'2021-06-10T18:29:40.7128329' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (488, 26, 10, CAST(N'2021-06-10T18:29:40.7128369' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (489, 26, 33, CAST(N'2021-06-10T18:29:40.7128372' AS DateTime2), NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[UserUseCases] OFF
GO
SET IDENTITY_INSERT [dbo].[Votes] ON 

INSERT [dbo].[Votes] ([Id], [UserId], [PostId], [Status], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (7, 12, 16, 1, CAST(N'2021-06-04T00:22:47.0000000' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Votes] ([Id], [UserId], [PostId], [Status], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (8, 11, 17, 1, CAST(N'2021-06-06T23:45:05.5557210' AS DateTime2), CAST(N'2021-06-08T23:54:31.0662120' AS DateTime2), 0, NULL, 1)
INSERT [dbo].[Votes] ([Id], [UserId], [PostId], [Status], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (9, 13, 18, 0, CAST(N'2021-06-07T12:52:55.1365020' AS DateTime2), CAST(N'2021-06-09T13:07:54.4334290' AS DateTime2), 0, NULL, 1)
INSERT [dbo].[Votes] ([Id], [UserId], [PostId], [Status], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (10, 22, 21, 1, CAST(N'2021-06-09T13:29:41.1547890' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Votes] ([Id], [UserId], [PostId], [Status], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (11, 22, 20, 1, CAST(N'2021-06-09T13:29:45.7043970' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Votes] ([Id], [UserId], [PostId], [Status], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (12, 22, 19, 2, CAST(N'2021-06-09T13:29:54.8668870' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Votes] ([Id], [UserId], [PostId], [Status], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (13, 22, 21, 2, CAST(N'2021-06-09T13:29:58.4820100' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Votes] ([Id], [UserId], [PostId], [Status], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (14, 22, 23, 1, CAST(N'2021-06-09T13:30:07.4511590' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Votes] ([Id], [UserId], [PostId], [Status], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (15, 22, 24, 1, CAST(N'2021-06-09T13:30:11.6501390' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Votes] ([Id], [UserId], [PostId], [Status], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (16, 22, 32, 1, CAST(N'2021-06-09T13:30:13.6504890' AS DateTime2), NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[Votes] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Categories_Name]    Script Date: 6/17/2021 5:31:26 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Categories_Name] ON [dbo].[Categories]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_ParentId]    Script Date: 6/17/2021 5:31:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_ParentId] ON [dbo].[Comments]
(
	[ParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_PostId]    Script Date: 6/17/2021 5:31:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_PostId] ON [dbo].[Comments]
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_UserId]    Script Date: 6/17/2021 5:31:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_UserId] ON [dbo].[Comments]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Posts_CategoryId]    Script Date: 6/17/2021 5:31:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Posts_CategoryId] ON [dbo].[Posts]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Posts_UserId]    Script Date: 6/17/2021 5:31:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Posts_UserId] ON [dbo].[Posts]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Username]    Script Date: 6/17/2021 5:31:26 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Username] ON [dbo].[Users]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUseCases_UserId]    Script Date: 6/17/2021 5:31:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserUseCases_UserId] ON [dbo].[UserUseCases]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Votes_PostId]    Script Date: 6/17/2021 5:31:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Votes_PostId] ON [dbo].[Votes]
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Votes_UserId]    Script Date: 6/17/2021 5:31:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Votes_UserId] ON [dbo].[Votes]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (N'') FOR [Name]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (N'') FOR [CommentText]
GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT (N'') FOR [Title]
GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT (N'') FOR [Description]
GO
ALTER TABLE [dbo].[UseCaseLogs] ADD  DEFAULT (N'') FOR [UseCaseName]
GO
ALTER TABLE [dbo].[UseCaseLogs] ADD  DEFAULT (N'') FOR [Data]
GO
ALTER TABLE [dbo].[UseCaseLogs] ADD  DEFAULT (N'') FOR [Actor]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'') FOR [Username]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'') FOR [Email]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'') FOR [Password]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'') FOR [ProfilePhoto]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Comments_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Comments] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Comments_ParentId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Posts_PostId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users_UserId]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users_UserId]
GO
ALTER TABLE [dbo].[UserUseCases]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCases_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserUseCases] CHECK CONSTRAINT [FK_UserUseCases_Users_UserId]
GO
ALTER TABLE [dbo].[Votes]  WITH CHECK ADD  CONSTRAINT [FK_Votes_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Votes] CHECK CONSTRAINT [FK_Votes_Posts_PostId]
GO
ALTER TABLE [dbo].[Votes]  WITH CHECK ADD  CONSTRAINT [FK_Votes_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Votes] CHECK CONSTRAINT [FK_Votes_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [blog] SET  READ_WRITE 
GO
