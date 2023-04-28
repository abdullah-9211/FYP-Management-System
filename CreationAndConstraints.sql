-- ========================================================================================================================================================================================================
-- DELETION
-- ========================================================================================================================================================================================================

DROP TABLE    IF EXISTS [PERMISSION]
DROP TABLE    IF EXISTS [NOTIFICATION]
DROP TABLE    IF EXISTS [AUDIT TRAIL]
DROP TABLE    IF EXISTS [PANEL MEMBER]
DROP TABLE    IF EXISTS [EVALUATION]
DROP TABLE    IF EXISTS [ASSIGNED WORK]
DROP TABLE    IF EXISTS [PROJECT GROUP]
DROP TABLE    IF EXISTS [USER]
DROP TABLE    IF EXISTS [ROLE]
DROP TABLE    IF EXISTS [PANEL]
DROP TABLE    IF EXISTS [PROJECT]

DROP FUNCTION IF EXISTS dbo.GetUserRole
DROP FUNCTION IF EXISTS dbo.GetProjectCount

-- ========================================================================================================================================================================================================
-- ROLE
-- ========================================================================================================================================================================================================

CREATE TABLE [ROLE]
(
	[Role Name]	VARCHAR(30)	NOT NULL,
	CONSTRAINT [ROLE_PK]	PRIMARY KEY	([Role Name])
)

-- ========================================================================================================================================================================================================
-- PERMISSION
-- ========================================================================================================================================================================================================

CREATE TABLE [PERMISSION]
(
	[Role Name]		VARCHAR(30)	NOT NULL,
	[Permission]	VARCHAR(50)	NOT NULL,
	CONSTRAINT	[PERMISSION_PK]	PRIMARY KEY	([Role Name],[Permission])
)

-- ========================================================================================================================================================================================================
-- USER
-- ========================================================================================================================================================================================================

CREATE TABLE [USER]
(
	[Username]		VARCHAR(30)	NOT NULL,
	[Password]		VARCHAR(30)	NOT NULL,
	[First Name]	VARCHAR(20)	NOT NULL,
	[Last Name]		VARCHAR(20)	NOT NULL,
	[Position]		VARCHAR(10)	NOT NULL,
	[Role]			VARCHAR(30)	NULL,
	CONSTRAINT	[USER_PK]		PRIMARY KEY	([Username]),
	CONSTRAINT	[USER_Position_Check]	CHECK	([Position] in ('Student','Faculty'))
)

-- ========================================================================================================================================================================================================
-- NOTIFICATION
-- ========================================================================================================================================================================================================

CREATE TABLE [NOTIFICATION]
(
	[Receiver]	VARCHAR(30)		NOT NULL,
	[Date]		DATE			NOT NULL,
	[Time]		TIME			NOT NULL,
	[Text Body]	VARCHAR(1000)	NOT NULL,
	CONSTRAINT	[NOTIFICATION_PK]	PRIMARY KEY	([Receiver],[Date],[Time])
)

-- ========================================================================================================================================================================================================
-- AUDIT TRAIL
-- ========================================================================================================================================================================================================

CREATE TABLE [AUDIT TRAIL]
(
	[Username]	VARCHAR(30)	NOT NULL,
	[Date]		DATE		NOT NULL,
	[Time]		TIME		NOT NULL,
	[Action]	VARCHAR(100)NOT NULL,
	CONSTRAINT	[AUDIT_TRAIL_PK]	PRIMARY KEY	([Username],[Date],[Time])
)

-- ========================================================================================================================================================================================================
-- PANEL
-- ========================================================================================================================================================================================================

CREATE TABLE [PANEL]
(
	[Panel ID]	INT	NOT NULL,
	CONSTRAINT	[PANEL_PK]	PRIMARY KEY	([Panel ID])
)

-- ========================================================================================================================================================================================================
-- PANEL MEMBER
-- ========================================================================================================================================================================================================

CREATE TABLE [PANEL MEMBER]
(
	[Panel]		INT			NOT NULL,
	[Member]	VARCHAR(30)	NOT NULL,
	CONSTRAINT	[PANEL_MEMBER_PK]	PRIMARY KEY	([Member])
	-- Function Based Constraints:
	-- Member must refer to a User with role Panel Member
)

-- ========================================================================================================================================================================================================
-- PROJECT
-- ========================================================================================================================================================================================================

CREATE TABLE [PROJECT]
(
	[Title]			VARCHAR(100)	NOT NULL,
	[Supervisor]	VARCHAR(30)	NOT NULL,
	[Co-Supervisor]	VARCHAR(30)	NULL,
	[Eval Panel]	INT			NOT NULL,
	[isActive]		CHAR(1)		NOT NULL,
	CONSTRAINT	[PROJECT_PK]	PRIMARY KEY	([Title])
	-- Function Based Constraints:
	-- Supervisor and co-supervisor each must have less than 6 projects under their supervision
)

-- ========================================================================================================================================================================================================
-- PROJECT GROUP
-- ========================================================================================================================================================================================================

CREATE TABLE [PROJECT GROUP]
(
	[Project]	VARCHAR(100)	NOT NULL,
	[Member]	VARCHAR(30)	NOT NULL,
	CONSTRAINT	[PROJECT_GROUP_PK]	PRIMARY KEY	([Project],[Member])
	-- Function Based Constraints:
	-- Member must refer to a User with role of student
)

-- ========================================================================================================================================================================================================
-- ASSIGNED WORK
-- ========================================================================================================================================================================================================

CREATE TABLE [ASSIGNED WORK]
(
	[Project]			VARCHAR(100)		NOT NULL,
	[Work Description]	VARCHAR(200)	NOT NULL,
	[Deadline Date]		DATE			NOT NULL,
	[Deadline Time]		TIME			NOT NULL,
	[isSubmitted]		CHAR(1)			NOT NULL,
	[Review]			VARCHAR(200)	NULL,
	CONSTRAINT	[ASSIGNED_WORK_PK]	PRIMARY KEY	([Project],[Work Description])
)

-- ========================================================================================================================================================================================================
-- EVALUATION
-- ========================================================================================================================================================================================================

CREATE TABLE [EVALUATION]
(
	[Project]		VARCHAR(100)	NOT NULL,
	[Panel Member]	VARCHAR(30)	NOT NULL,
	[Evaluation]	VARCHAR(100)	NULL,
	[Suggestion]	VARCHAR(200)NULL,
	[Deadline Date]	DATE		NOT NULL,
	[Deadline Time]	TIME		NOT NULL,
	CONSTRAINT	[EVALUATION_PK]		PRIMARY KEY	([Project],[Panel Member])
)

-- ========================================================================================================================================================================================================
-- FOREIGN KEYS
-- ========================================================================================================================================================================================================

ALTER TABLE [PERMISSION]		ADD CONSTRAINT [PERMISSION_ROLE_FK]			FOREIGN KEY ([Role Name])	REFERENCES [ROLE] ([Role Name])	ON DELETE CASCADE
ALTER TABLE [USER]				ADD CONSTRAINT [USER_ROLE_FK]				FOREIGN KEY ([Role])		REFERENCES [ROLE] ([Role Name]) ON DELETE SET NULL
ALTER TABLE [NOTIFICATION]		ADD CONSTRAINT [NOTIFICATION_USER_FK]		FOREIGN KEY ([Receiver])	REFERENCES [USER] ([Username])	ON DELETE CASCADE
ALTER TABLE [AUDIT TRAIL]		ADD CONSTRAINT [AUDIT_TRAIL_USER_FK]		FOREIGN KEY ([Username])	REFERENCES [USER] ([Username])	ON DELETE CASCADE
ALTER TABLE [PANEL MEMBER]		ADD CONSTRAINT [PANEL_MEMBER_PANEL_FK]		FOREIGN KEY ([Panel])		REFERENCES [PANEL] ([PANEL ID]) ON DELETE CASCADE
ALTER TABLE [PANEL MEMBER]		ADD CONSTRAINT [PANEL_MEMBER_USER_FK]		FOREIGN KEY ([Member])		REFERENCES [USER] ([Username])	ON DELETE CASCADE
ALTER TABLE [PROJECT GROUP]		ADD CONSTRAINT [PROJECT_GROUP_USER_FK]		FOREIGN KEY ([Member])		REFERENCES [USER] ([Username])	ON DELETE CASCADE
ALTER TABLE [PROJECT GROUP]		ADD CONSTRAINT [PROJECT_GROUP_PROJECT_FK]	FOREIGN KEY ([Project])		REFERENCES [Project] ([Title])	ON DELETE CASCADE
ALTER TABLE [ASSIGNED WORK]		ADD CONSTRAINT [ASSIGNED_WORK_PROJECT_FK]	FOREIGN KEY ([Project])		REFERENCES [Project] ([Title])	ON DELETE CASCADE
ALTER TABLE [EVALUATION]		ADD CONSTRAINT [EVALUATION_PROJECT_FK]		FOREIGN KEY ([Project])		REFERENCES [Project] ([Title])	ON DELETE CASCADE
ALTER TABLE [EVALUATION]		ADD CONSTRAINT [EVALUATION_USER_FK]			FOREIGN KEY ([Panel Member])REFERENCES [USER] ([USERNAME])	ON DELETE CASCADE
ALTER TABLE [PROJECT]			ADD CONSTRAINT [PANEL_ID_FK]				FOREIGN KEY ([EVAL PANEL])  REFERENCES [PANEL]([Panel ID])  ON DELETE CASCADE

-- ========================================================================================================================================================================================================
-- CONSTRAINT FUNCTIONS
-- ========================================================================================================================================================================================================

-- Return role of the username passed as input
GO
CREATE FUNCTION dbo.GetUserRole(@username VARCHAR(30))
RETURNS VARCHAR(30) AS 
BEGIN
	RETURN (SELECT [Role] FROM [USER] WHERE [Username] = @username)
END
GO

-- Return count of projects under supervision of username passed as input
GO
CREATE FUNCTION dbo.GetProjectCount(@username VARCHAR(30))
RETURNS INT AS 
BEGIN
	RETURN (SELECT COUNT(*) FROM [PROJECT] WHERE ([Supervisor] = @username OR [Co-Supervisor] = @username) AND [isActive]=1)
END
GO

--Check that a student is part of one group only
GO
CREATE FUNCTION dbo.CheckStudentGroup(@username VARCHAR(30))
RETURNS BIT AS
BEGIN
	IF ((SELECT COUNT(*) FROM [PROJECT GROUP] WHERE [MEMBER] = @username) > 1)
		RETURN 1
	RETURN 0
END
GO

--Counts members in a group
GO
CREATE FUNCTION dbo.MemberNum(@title VARCHAR(100))
RETURNS BIT AS
BEGIN
	IF ((SELECT COUNT(*) FROM [PROJECT GROUP] WHERE [Project] = @title) > 3)
		RETURN 1
	RETURN 0
END
GO

-- ========================================================================================================================================================================================================
-- FUNCTION BASED CONSTRAINTS
-- ========================================================================================================================================================================================================

ALTER TABLE [PANEL MEMBER]  ADD CONSTRAINT [PANEL_MEMBER_HAS_CORRECT_ROLE]
CHECK (dbo.GetUserRole([Member]) = 'Panel Member')

ALTER TABLE [PROJECT GROUP] ADD CONSTRAINT [GROUP_MEMBER_HAS_CORRECT_ROLE]
CHECK (dbo.GetUserRole([Member]) = 'Student')

ALTER TABLE [PROJECT] ADD CONSTRAINT [PROJECT_HAS_SUPERVISOR]
CHECK (dbo.GetUserRole([Supervisor]) = 'Supervisor')

ALTER TABLE [PROJECT] ADD CONSTRAINT [PROJECT_HAS_CO_SUPERVISOR]
CHECK (dbo.GetUserRole([Co-Supervisor]) = 'Supervisor')

ALTER TABLE [NOTIFICATION] ADD CONSTRAINT [RECIEVER_IS_SUPERVISOR]
CHECK (dbo.GetUserRole([Receiver]) = 'Supervisor')

ALTER TABLE [PROJECT]		ADD CONSTRAINT [SUPERVISOR_HAS_MANAGEABLE_PROJECTS]
CHECK (dbo.GetProjectCount([Supervisor]) < 6)

ALTER TABLE [PROJECT]		ADD CONSTRAINT [CO_SUPERVISOR_HAS_MANAGEABLE_PROJECTS]
CHECK (dbo.GetProjectCount([Co-Supervisor]) < 6)

ALTER TABLE [PROJECT GROUP]		ADD CONSTRAINT [STUDENT_ALREADY_EXISTS]
CHECK (dbo.CheckStudentGroup([Member]) = 0)

ALTER TABLE [PROJECT GROUP]		ADD CONSTRAINT [MEMBER_COUNT_LIMIT]
CHECK (dbo.MemberNum([Project]) = 0)
