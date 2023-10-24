CREATE TABLE [dbo].[CategoryFeatures] (
    [ID]                INT             NOT NULL        IDENTITY(1, 1),
    [CategoryID]        INT             NULL,
    [GroupName]         VARCHAR(64)     NOT NULL,
    [Name]              VARCHAR(64)     NULL,
    [IsActive]          BIT             NOT NULL        CONSTRAINT [DF_CategoryFeatures_IsActive] DEFAULT ((1)),
    [IsDeleted]         BIT             NOT NULL        CONSTRAINT [DF_CategoryFeatures_IsDeleted] DEFAULT ((0)),
    [CreateUserID]      INT             NOT NULL,
    [CreateDate]        DATETIME        NOT NULL        CONSTRAINT [DF_CategoryFeatures_CreateDate] DEFAULT (GETDATE()),
    [ModifyUserID]      INT             NULL,
    [ModifyDate]        DATETIME        NULL,

    CONSTRAINT [PK_CategoryFeatures] 
        PRIMARY KEY CLUSTERED ([ID] ASC)
        WITH (FILLFACTOR = 70),

    CONSTRAINT [FK_CategoryFeatures_Categories] 
        FOREIGN KEY ([CategoryID]) REFERENCES [dbo].[Categories] ([ID]),

    CONSTRAINT [FK_CategoryFeatures_CreateUserID_Users] 
        FOREIGN KEY ([CreateUserID]) REFERENCES [dbo].[Users] ([ID]),

    CONSTRAINT [FK_CategoryFeatures_CreateUserID_Users] 
        FOREIGN KEY ([ModifyUserID]) REFERENCES [dbo].[Users] ([ID])
);


GO

