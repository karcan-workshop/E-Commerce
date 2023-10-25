IF NOT EXISTS (SELECT NULL FROM dbo.Users AS u WHERE u.ID = 1)
BEGIN
	ALTER TABLE dbo.Users
	ALTER COLUMN CreateUserID INT NULL;

	ALTER TABLE dbo.Users
	DROP CONSTRAINT IF EXISTS [FK_Users_CreateUserID_Users];

	SET IDENTITY_INSERT [dbo].[Users] ON;

	INSERT INTO dbo.Users (ID, FirstName, LastName, Email, PhoneNumber, PasswordHash, PasswordSalt, CreateUserID)
	VALUES (1, 'system', 'system', 'system@system.com', '', '', '', 1);
	SET IDENTITY_INSERT [dbo].[Users] OFF;

	ALTER TABLE dbo.Users
	ALTER COLUMN CreateUserID INT NOT NULL;

	ALTER TABLE dbo.Users
	ADD CONSTRAINT [FK_Users_CreateUserID_Users] 
    FOREIGN KEY ([CreateUserID]) REFERENCES [dbo].[Users] ([ID]);
END