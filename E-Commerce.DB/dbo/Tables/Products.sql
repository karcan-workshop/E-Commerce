CREATE TABLE [dbo].[Products] (
    [ID]                        INT             NOT NULL        IDENTITY(1, 1),
    [CategoryID]                INT             NOT NULL,
    [ModelID]                   INT             NOT NULL,
    [Name]                      VARCHAR(256)    NOT NULL,
    [DefaultProductImageID]     BIGINT          NULL,
    [IsActive]                  BIT             NOT NULL        CONSTRAINT [DF_Products_IsActive] DEFAULT ((1)),
    [IsDeleted]                 BIT             NOT NULL        CONSTRAINT [DF_Products_IsDeleted] DEFAULT ((0)),
    [CreateUserID]              INT             NOT NULL,
    [CreateDate]                DATETIME        NOT NULL        CONSTRAINT [DF_Products_CreateDate] DEFAULT (GETDATE()),
    [ModifyUserID]              INT             NULL,
    [ModifyDate]                DATETIME        NULL,

    CONSTRAINT [PK_Products] 
        PRIMARY KEY CLUSTERED ([ID] ASC)
        WITH (FILLFACTOR = 70),

    CONSTRAINT [FK_Products_ModelID_Models] 
        FOREIGN KEY ([ModelID]) REFERENCES [dbo].[Models] ([ID]),

    CONSTRAINT [FK_Products_ProductImages] 
        FOREIGN KEY ([DefaultProductImageID]) REFERENCES [dbo].[ProductImages] ([ID]),

    CONSTRAINT [FK_Products_CreateUserID_Users] 
        FOREIGN KEY ([CreateUserID]) REFERENCES [dbo].[Users] ([ID]),

    CONSTRAINT [FK_Products_ModifyUserID_Users] 
        FOREIGN KEY ([ModifyUserID]) REFERENCES [dbo].[Users] ([ID])
);
GO

CREATE UNIQUE NONCLUSTERED INDEX [UX_Products_ModelID_Name]
ON [dbo].[Products] ([ModelID] ASC, [Name] ASC)
WHERE ([IsDeleted] = 0 AND [IsActive] = 1)
WITH (FILLFACTOR = 70)
GO

