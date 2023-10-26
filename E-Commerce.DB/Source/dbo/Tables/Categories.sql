CREATE TABLE [dbo].[Categories] (
    [ID]                    INT             NOT NULL        IDENTITY(1, 1),
    [Name]                  VARCHAR(64)     NULL,
    [ParentCategoryID]      INT             NULL,
    [IsActive]              BIT             NOT NULL        CONSTRAINT [DF_Categories_IsActive] DEFAULT ((1)),
    [IsDeleted]             BIT             NOT NULL        CONSTRAINT [DF_Categories_IsDeleted] DEFAULT ((0)),
    [CreateUserID]          INT             NOT NULL,
    [CreateDate]            DATETIME        NOT NULL        CONSTRAINT [DF_Categories_CreateDate] DEFAULT (GETDATE()),
    [ModifyUserID]          INT             NULL,
    [ModifyDate]            DATETIME        NULL,

    CONSTRAINT [PK_Categories] 
        PRIMARY KEY CLUSTERED ([ID] ASC)
        WITH (FILLFACTOR = 70, PAD_INDEX = ON),

    CONSTRAINT [FK_Categories_ParentCategoryID_Categories] 
        FOREIGN KEY ([ParentCategoryID]) REFERENCES [dbo].[Categories] ([ID]),

    CONSTRAINT [FK_Categories_CreateUserID_Users] 
        FOREIGN KEY ([CreateUserID]) REFERENCES [dbo].[Users] ([ID]),

    CONSTRAINT [FK_Categories_ModifyUserID_Users] 
        FOREIGN KEY ([ModifyUserID]) REFERENCES [dbo].[Users] ([ID])
);


GO

