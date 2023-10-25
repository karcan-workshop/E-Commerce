CREATE TABLE [dbo].[Models] (
    [ID]                INT             NOT NULL        IDENTITY(1, 1),
    [BrandID]           SMALLINT        NOT NULL,
    [Name]              VARCHAR(64)     NULL,
    [IsActive]          BIT             NOT NULL        CONSTRAINT [DF_Models_IsActive] DEFAULT ((1)),
    [IsDeleted]         BIT             NOT NULL        CONSTRAINT [DF_Models_IsDeleted] DEFAULT ((0)),
    [CreateUserID]      INT             NOT NULL,
    [CreateDate]        DATETIME        NOT NULL        CONSTRAINT [DF_Models_CreateDate] DEFAULT (GETDATE()),
    [ModifyUserID]      INT             NULL,
    [ModifyDate]        DATETIME        NULL,

    CONSTRAINT [PK_Models] 
        PRIMARY KEY CLUSTERED ([ID] ASC)
        WITH (FILLFACTOR = 70),

    CONSTRAINT [FK_Models_BrandID_Brands] FOREIGN KEY ([BrandID]) REFERENCES [dbo].[Brands] ([ID]),

    CONSTRAINT [FK_Models_CreateUserID_Users] 
        FOREIGN KEY ([CreateUserID]) REFERENCES [dbo].[Users] ([ID]),

    CONSTRAINT [FK_Models_ModifyUserID_Users] 
        FOREIGN KEY ([ModifyUserID]) REFERENCES [dbo].[Users] ([ID])
);


GO

