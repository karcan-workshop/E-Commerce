CREATE TABLE [dbo].[ProductImages] (
    [ID]                BIGINT              NOT NULL        IDENTITY(1, 1),
    [ProductID]         INT                 NOT NULL,
    [Source]            VARCHAR(2048)       NOT NULL,
    [Type]              SMALLINT            NOT NULL,
    [IsActive]          BIT                 NOT NULL        CONSTRAINT [DF_ProductImages_IsActive] DEFAULT ((1)),
    [IsDeleted]         BIT                 NOT NULL        CONSTRAINT [DF_ProductImages_IsDeleted] DEFAULT ((0)),
    [CreateUserID]      INT                 NOT NULL,
    [CreateDate]        DATETIME            NOT NULL        CONSTRAINT [DF_ProductImages_CreateDate] DEFAULT (GETDATE()),
    [ModifyUserID]      INT                 NULL,
    [ModifyDate]        DATETIME            NULL,

    CONSTRAINT [PK_ProductImages] 
        PRIMARY KEY CLUSTERED ([ID] ASC)
        WITH (FILLFACTOR = 70),

    CONSTRAINT [FK_ProductImages_Products] 
        FOREIGN KEY ([ProductID]) REFERENCES [dbo].[Products] ([ID]),

    CONSTRAINT [FK_ProductImages_CreateUserID_Users] 
        FOREIGN KEY ([CreateUserID]) REFERENCES [dbo].[Users] ([ID]),

    CONSTRAINT [FK_ProductImages_ModifyUserID_Users] 
        FOREIGN KEY ([ModifyUserID]) REFERENCES [dbo].[Users] ([ID])
);
GO

