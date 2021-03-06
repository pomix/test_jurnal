USE [test2]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 28.02.2016 21:07:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](56) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 28.02.2016 21:07:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL DEFAULT ((0)),
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL DEFAULT ((0)),
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 28.02.2016 21:07:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 28.02.2016 21:07:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 28.02.2016 21:07:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Занятия]    Script Date: 28.02.2016 21:07:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Занятия](
	[Номер_занятия] [int] NULL,
	[Тип_занятия] [nvarchar](50) NULL,
	[Код_предмета] [nvarchar](50) NOT NULL,
	[UserId] [int] NOT NULL,
	[Тема] [nvarchar](150) NULL,
	[Группа1] [nvarchar](50) NULL,
	[Группа2] [nvarchar](50) NULL,
	[Группа3] [nvarchar](50) NULL,
	[id_занятия] [int] NOT NULL,
	[Дата] [datetime] NULL,
	[Примечание] [nvarchar](150) NULL,
	[Подгруппа] [nvarchar](50) NULL,
 CONSTRAINT [XPKЗанятия] PRIMARY KEY CLUSTERED 
(
	[id_занятия] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Предметы]    Script Date: 28.02.2016 21:07:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Предметы](
	[Код_предмета] [nvarchar](50) NOT NULL,
	[Название] [nvarchar](50) NULL,
	[Количество_часов] [int] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [XPKПредметы] PRIMARY KEY CLUSTERED 
(
	[Код_предмета] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Расписание]    Script Date: 28.02.2016 21:07:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Расписание](
	[День_недели] [int] NULL,
	[Номер_пары] [int] NULL,
	[Код_предмета] [nvarchar](50) NULL,
	[UserId] [int] NULL,
	[Номер_аудитории] [nvarchar](50) NULL,
	[Группа1] [nvarchar](50) NULL,
	[Группа2] [nvarchar](50) NULL,
	[Группа3] [nvarchar](50) NULL,
	[id_расписания] [int] IDENTITY(1,1) NOT NULL,
	[Тип_занятия] [nvarchar](50) NULL,
	[Примечание] [nvarchar](150) NULL,
	[Верхняя_неделя] [bit] NULL,
	[Нижняя_неделя] [bit] NULL,
	[Типовая_неделя] [bit] NULL,
	[Нетиповая_неделя] [bit] NULL,
	[Время] [nvarchar](20) NULL,
	[Подгруппа] [nvarchar](50) NULL,
 CONSTRAINT [XPKРасписание] PRIMARY KEY CLUSTERED 
(
	[id_расписания] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Студенты]    Script Date: 28.02.2016 21:07:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Студенты](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [nvarchar](50) NULL,
	[Имя] [nvarchar](50) NULL,
	[Отчество] [nvarchar](50) NULL,
	[Дата_рождения] [datetime] NULL,
	[Подгруппа] [nvarchar](50) NULL,
	[Группа] [nvarchar](50) NULL,
 CONSTRAINT [XPKСтуденты] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Студенты_занятия]    Script Date: 28.02.2016 21:07:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Студенты_занятия](
	[Номер_зачетки] [int] NOT NULL,
	[Явка] [bit] NULL,
	[Оценка] [float] NULL,
	[id_занятия] [int] NOT NULL,
 CONSTRAINT [XPKСтуденты_занятия] PRIMARY KEY CLUSTERED 
(
	[Номер_зачетки] ASC,
	[id_занятия] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Студенты_Предметы]    Script Date: 28.02.2016 21:07:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Студенты_Предметы](
	[Номер_зачетки] [int] NOT NULL,
	[Код_предмета] [nvarchar](50) NOT NULL,
	[Рейтинг] [float] NULL,
 CONSTRAINT [XPKСтуденты_Предметы] PRIMARY KEY CLUSTERED 
(
	[Номер_зачетки] ASC,
	[Код_предмета] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[Gruppa]    Script Date: 28.02.2016 21:07:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[Gruppa]
AS
	
	select [Группа]
	from [dbo].[Студенты]
	group by [Группа]


GO
/****** Object:  View [dbo].[Группа]    Script Date: 28.02.2016 21:07:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[Группа]
AS
	
	select [Группа]
	from [dbo].[Студенты]
	group by [Группа]


GO
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

INSERT [dbo].[UserProfile] ([UserId], [UserName]) VALUES (1, N'pomix')
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (1, CAST(N'2016-02-22 20:45:46.597' AS DateTime), NULL, 1, CAST(N'2016-02-24 14:43:13.107' AS DateTime), 0, N'AA7MNbcA4ttvcF45kQ/95s9eB/miqbX7F6+OcXWHO3/lglTaz1JXyFRCFlJaOPTyKg==', CAST(N'2016-02-22 20:45:46.597' AS DateTime), N'', NULL, NULL)
INSERT [dbo].[Предметы] ([Код_предмета], [Название], [Количество_часов], [UserId]) VALUES (N'1', N'Объектно орентированое програмирование', NULL, 1)
INSERT [dbo].[Предметы] ([Код_предмета], [Название], [Количество_часов], [UserId]) VALUES (N'2', N'Филасовия', NULL, 1)
INSERT [dbo].[Предметы] ([Код_предмета], [Название], [Количество_часов], [UserId]) VALUES (N'3', N'Системный анализ', NULL, 1)
SET IDENTITY_INSERT [dbo].[Расписание] ON 

INSERT [dbo].[Расписание] ([День_недели], [Номер_пары], [Код_предмета], [UserId], [Номер_аудитории], [Группа1], [Группа2], [Группа3], [id_расписания], [Тип_занятия], [Примечание], [Верхняя_неделя], [Нижняя_неделя], [Типовая_неделя], [Нетиповая_неделя], [Время], [Подгруппа]) VALUES (1, 0, N'1', 1, N'409', N'АСОИ-111', NULL, NULL, 16, N'Лекция', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Расписание] ([День_недели], [Номер_пары], [Код_предмета], [UserId], [Номер_аудитории], [Группа1], [Группа2], [Группа3], [id_расписания], [Тип_занятия], [Примечание], [Верхняя_неделя], [Нижняя_неделя], [Типовая_неделя], [Нетиповая_неделя], [Время], [Подгруппа]) VALUES (5, 0, N'2', 1, N'213', N'АСОИ-111', N'АСОИ-112', NULL, 23, N'Лекция', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Расписание] ([День_недели], [Номер_пары], [Код_предмета], [UserId], [Номер_аудитории], [Группа1], [Группа2], [Группа3], [id_расписания], [Тип_занятия], [Примечание], [Верхняя_неделя], [Нижняя_неделя], [Типовая_неделя], [Нетиповая_неделя], [Время], [Подгруппа]) VALUES (3, 3, N'1', 1, N'678', N'АСОИ-111', NULL, NULL, 28, N'Семинар', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Расписание] OFF
SET IDENTITY_INSERT [dbo].[Студенты] ON 

INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (1, N'сакович', N'роман ', N'виктрович', CAST(N'1994-03-28 00:00:00.000' AS DateTime), N'АСОИ-112(2)', N'АСОИ-112')
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (2, N'авдеев', N'антон', N'михайлович', NULL, N'АСОИ-111(1)', N'АСОИ-111')
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (3, N'микулич', N'алена', N'николаевна', NULL, N'АСОИ-112(2)', N'АСОИ-112')
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (4, N'зуборев', N'кирил', N'александрович', NULL, N'АСОИ-111(1)', N'АСОИ-111')
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (30, N'Авдеев', N'Антон', N'Михайлович', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (31, N'Агуркова', N'Татьяна', N'Борисовна', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (32, N'Гончаренко', N'Георгий', N'Николаевич', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (33, N'Гончарова', N'Виктория', N'Александровна', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (34, N'Гудков', N'Роман', N'Вячеславович', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (35, N'Гуторов', N'Артем', N'Иванович', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (36, N'Дегольцов', N'Денис', N'Игоревич', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (37, N'Зубков', N'Егор', N'Александрович', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (38, N'Зуборев', N'Кирилл', N'Александрович', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (39, N'Кузьмин', N'Егор', N'Сергеевич', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (40, N'Кустреева', N'Евгения', N'Михайловна', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (41, N'Леоненко', N'Татьяна', N'Анатольевна', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (42, N'Любинина', N'Дарья', N'Романовна', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (43, N'Машук', N'Марина', N'Михайловна', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (44, N'Николайченко', N'Иван', N'Владимирович', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (45, N'Образовский', N'Андрей', N'Михайлович', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (46, N'Парукова', N'Алина', N'Сергеевна', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (47, N'Пожиткова', N'Светлана', N'Сергеевна', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (48, N'Пухарт', N'Валентин', N'Игоревич', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (49, N'Роговцов', N'Андрей', N'Александрович', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (50, N'Савенкова', N'Елена', N'Геннадьевна', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (51, N'Хрущёва', N'Валерия', N'Валерьевна', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (52, N'Байрамов', N'Бегмырат', N'Довлетгелдиевич', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (53, N'Мурадов', N'Азамат', N'Фуркатович', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (54, N'Батыщиков', N'Владислав', N'Олегович', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (55, N'Даюжин', N'Александр', N'Владимирович', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (56, N'Демидов', N'Никита', N'Петрович', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (57, N'Дерюжин', N'Дмитрий', N'Александрович', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (58, N'Димитриади', N'Александр', N'Владимирович', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (59, N'Долгий', N'Владимир', N'Анатольевич', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (60, N'Дроздов', N'Андрей', N'Владимирович', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (61, N'Захаров', N'Денис', N'Вячеславович', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (62, N'Калмыков', N'Артур', N'Андреевич', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (63, N'Книга', N'Евгений', N'Михайлович', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (64, N'Ковалев', N'Михаил', N'Леонидович', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (65, N'Ковалев', N'Родион', N'Константинович', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (66, N'Лукьяненко', N'Алина', N'Игоревна', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (67, N'Марченков', N'Владимир', N'Алексадрович', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (68, N'Микулич', N'Алёна', N'Николаевна', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (69, N'Петровец', N'Юрий', N'Дмитриевич', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (70, N'Сакович', N'Роман', N'Викторович', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (71, N'Сакульский', N'Илья', N'Леонидович', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (72, N'Суворова', N'Виктория', N'Андреевна', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (73, N'Шарснев', N'Станислав', N'Александрович', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (74, N'Ювченко', N'Ангелина', N'Андреевна', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (75, N'Якушев', N'Владимир', N'Сергеевич', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (76, N'Бегмырадов', N'Нияз', N'Бегмырадович', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (77, N'Дурдымырадов', N'Молланепес', N'Меретгелдиевич', NULL, NULL, NULL)
INSERT [dbo].[Студенты] ([id], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Подгруппа], [Группа]) VALUES (78, N'Хыдыров', N'Овез', N'Амангельдыевич', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Студенты] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__UserProf__C9F28456F5A71B01]    Script Date: 28.02.2016 21:07:32 ******/
ALTER TABLE [dbo].[UserProfile] ADD UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__webpages__8A2B6160801255A7]    Script Date: 28.02.2016 21:07:32 ******/
ALTER TABLE [dbo].[webpages_Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
ALTER TABLE [dbo].[Занятия]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[Занятия]  WITH CHECK ADD  CONSTRAINT [R_13] FOREIGN KEY([Код_предмета])
REFERENCES [dbo].[Предметы] ([Код_предмета])
GO
ALTER TABLE [dbo].[Занятия] CHECK CONSTRAINT [R_13]
GO
ALTER TABLE [dbo].[Предметы]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[Расписание]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[Расписание]  WITH CHECK ADD  CONSTRAINT [R_20] FOREIGN KEY([Код_предмета])
REFERENCES [dbo].[Предметы] ([Код_предмета])
GO
ALTER TABLE [dbo].[Расписание] CHECK CONSTRAINT [R_20]
GO
ALTER TABLE [dbo].[Студенты_занятия]  WITH CHECK ADD  CONSTRAINT [R_16] FOREIGN KEY([Номер_зачетки])
REFERENCES [dbo].[Студенты] ([id])
GO
ALTER TABLE [dbo].[Студенты_занятия] CHECK CONSTRAINT [R_16]
GO
ALTER TABLE [dbo].[Студенты_занятия]  WITH CHECK ADD  CONSTRAINT [R_17] FOREIGN KEY([id_занятия])
REFERENCES [dbo].[Занятия] ([id_занятия])
GO
ALTER TABLE [dbo].[Студенты_занятия] CHECK CONSTRAINT [R_17]
GO
ALTER TABLE [dbo].[Студенты_Предметы]  WITH CHECK ADD  CONSTRAINT [R_11] FOREIGN KEY([Номер_зачетки])
REFERENCES [dbo].[Студенты] ([id])
GO
ALTER TABLE [dbo].[Студенты_Предметы] CHECK CONSTRAINT [R_11]
GO
ALTER TABLE [dbo].[Студенты_Предметы]  WITH CHECK ADD  CONSTRAINT [R_12] FOREIGN KEY([Код_предмета])
REFERENCES [dbo].[Предметы] ([Код_предмета])
GO
ALTER TABLE [dbo].[Студенты_Предметы] CHECK CONSTRAINT [R_12]
GO
/****** Object:  StoredProcedure [dbo].[Grup]    Script Date: 28.02.2016 21:07:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Grup]

AS
BEGIN
	SELECT        Группа
FROM            dbo.Студенты
GROUP BY Группа
END

GO
/****** Object:  StoredProcedure [dbo].[ИдПредмет]    Script Date: 28.02.2016 21:07:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ИдПредмет]
	-- Add the parameters for the stored procedure here
	@param int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	select [Код_предмета] as value,[Название] as label
	from [dbo].[Предметы], [dbo].[Преподаватели]
	where [dbo].[Предметы].[UserId]= [dbo].[Преподаватели].[UserId]
END

GO
/****** Object:  StoredProcedure [dbo].[ПримечПоДатеГруппе]    Script Date: 28.02.2016 21:07:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ПримечПоДатеГруппе]
@d datetime, @group nvarchar(50), @podgr nvarchar(50)
as
select Занятия.Примечание from Занятия where Занятия.Группа1 = @group or Занятия.Дата = @d or Занятия.Подгруппа = @podgr
GO
/****** Object:  StoredProcedure [dbo].[Расписание_препода]    Script Date: 28.02.2016 21:07:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Расписание_препода] 
	-- Add the parameters for the stored procedure here
	@param int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [dbo].[Расписание].*,[dbo].[Предметы].Название
	from [dbo].[Расписание],[dbo].[Предметы]
	where [dbo].[Расписание].[UserId]=@param and [dbo].[Предметы].Код_предмета=[dbo].[Расписание].Код_предмета
END

GO
/****** Object:  StoredProcedure [dbo].[РасписаниеДатаПрепод]    Script Date: 28.02.2016 21:07:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[РасписаниеДатаПрепод]
	@param int ,
	@param1 int 

AS
BEGIN

   select [dbo].[Расписание].*,[dbo].[Предметы].[Название]
   from [dbo].[Расписание],[dbo].[Предметы]
   where [dbo].[Расписание].[Код_предмета]=[dbo].[Предметы].Код_предмета and @param=[День_недели]and @param1=[dbo].[Расписание].[UserId]
END

GO
/****** Object:  StoredProcedure [dbo].[СтудПоГруппе]    Script Date: 28.02.2016 21:07:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[СтудПоГруппе]
@group nvarchar(50), @podgr nvarchar(50)
as
select Студенты.Фамилия + ' ' + Студенты.Имя + ' ' + Студенты.Отчество, Студенты.Дата_рождения from Студенты where Студенты.Группа = @group or Студенты.Подгруппа = @podgr
GO
