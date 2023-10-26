CREATE TABLE [dbo].[ProductFeatures] (
    [ProductID]             INT             NOT NULL        IDENTITY(1, 1),
    [CategoryFeatureID]     INT             NOT NULL,
    [Value]                 VARCHAR(128)    NULL,
    [IsActive]              BIT             NOT NULL        CONSTRAINT [DF_ProductFeatures_IsActive] DEFAULT ((1)),
    [IsDeleted]             BIT             NOT NULL        CONSTRAINT [DF_ProductFeatures_IsDeleted] DEFAULT ((0)),
    [CreateUserID]          INT             NOT NULL,
    [CreateDate]            DATETIME        NOT NULL        CONSTRAINT [DF_ProductFeatures_CreateDate] DEFAULT (GETDATE()),
    [ModifyUserID]          INT             NULL,
    [ModifyDate]            DATETIME        NULL,

    CONSTRAINT [PK_ProductFeatures] 
        PRIMARY KEY CLUSTERED ([ProductID] ASC, [CategoryFeatureID] ASC)
        WITH (FILLFACTOR = 70, PAD_INDEX = ON),

    CONSTRAINT [FK_ProductFeatures_CategoryFeatures] 
        FOREIGN KEY ([CategoryFeatureID]) REFERENCES [dbo].[CategoryFeatures] ([ID]),

    CONSTRAINT [FK_ProductFeatures_Products] 
        FOREIGN KEY ([ProductID]) REFERENCES [dbo].[Products] ([ID]),

    CONSTRAINT [FK_ProductFeatures_CreateUserID_Users] 
        FOREIGN KEY ([CreateUserID]) REFERENCES [dbo].[Users] ([ID]),

    CONSTRAINT [FK_ProductFeatures_ModifyUserID_Users] 
        FOREIGN KEY ([ModifyUserID]) REFERENCES [dbo].[Users] ([ID])
);
GO

