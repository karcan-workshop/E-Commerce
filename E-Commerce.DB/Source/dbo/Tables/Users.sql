CREATE TABLE [dbo].[Users] (
    [ID]                INT             NOT NULL        IDENTITY(1, 1),
    [FirstName]         NVARCHAR(32)    NULL,
    [LastName]          NVARCHAR(32)    NULL,
    [Email]             NVARCHAR(320)   NULL,
    [PhoneNumber]       VARCHAR(15)     NULL,
    [PasswordHash]      VARCHAR(255)    NULL,
    [PasswordSalt]      VARCHAR(64)     NULL,
    [IsActive]          BIT             NOT NULL        CONSTRAINT [DF_Users_IsActive] DEFAULT ((1)),
    [IsDeleted]         BIT             NOT NULL        CONSTRAINT [DF_Users_IsDeleted] DEFAULT ((0)),
    [CreateUserID]      INT             NOT NULL,
    [CreateDate]        DATETIME        NOT NULL        CONSTRAINT [DF_Users_CreateDate] DEFAULT (GETDATE()),
    [ModifyUserID]      INT             NULL,
    [ModifyDate]        DATETIME        NULL,

    CONSTRAINT [PK_Users] 
        PRIMARY KEY CLUSTERED ([ID] ASC)
        WITH (FILLFACTOR = 70, PAD_INDEX = ON),

    CONSTRAINT [FK_Users_CreateUserID_Users] 
        FOREIGN KEY ([CreateUserID]) REFERENCES [dbo].[Users] ([ID]),

    CONSTRAINT [FK_Users_ModifyUserID_Users] 
        FOREIGN KEY ([ModifyUserID]) REFERENCES [dbo].[Users] ([ID])
);
GO

CREATE UNIQUE NONCLUSTERED INDEX [UX_Users_Email]
ON [dbo].[Users] ([Email] ASC)
WHERE ([IsDeleted] = 0 AND [IsActive] = 1)
WITH (FILLFACTOR = 70)
GO

CREATE UNIQUE NONCLUSTERED INDEX [UX_Users_PhoneNumber]
ON [dbo].[Users] ([PhoneNumber] ASC)
WHERE ([IsDeleted] = 0 AND [IsActive] = 1)
WITH (FILLFACTOR = 70)
