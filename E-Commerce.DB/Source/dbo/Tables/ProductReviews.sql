CREATE TABLE [dbo].[ProductReviews] (
    [ProductID]         INT             NOT NULL,
    [CustomerID]        INT             NOT NULL,
    [Rate]              SMALLINT        NOT NULL        CONSTRAINT [CHK_ProductReviews_Rate] CHECK ([Rate] >= (1) AND [Rate] <= (5)),
    [Description]       NVARCHAR(512)   NULL,
    [AppliedUserID]     INT             NULL,
    [AppliedDate]       DATETIME        NULL,
    [IsActive]          BIT             NOT NULL        CONSTRAINT [DF_ProductReviews_IsActive] DEFAULT ((1)),
    [IsDeleted]         BIT             NOT NULL        CONSTRAINT [DF_ProductReviews_IsDeleted] DEFAULT ((0)),
    [CreateDate]        DATETIME        NOT NULL        CONSTRAINT [DF_ProductReviews_CreateDate] DEFAULT (GETDATE()),
    [ModifyDate]        DATETIME        NULL,

    CONSTRAINT [PK_ProductReviews] 
        PRIMARY KEY CLUSTERED ([ProductID] ASC, [CustomerID] ASC)
        WITH (FILLFACTOR = 70, PAD_INDEX = ON),

    CONSTRAINT [FK_ProductReviews_Customers] 
        FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customers] ([ID]),

    CONSTRAINT [FK_Users_AppliedUserID_Users] 
        FOREIGN KEY ([AppliedUserID]) REFERENCES [dbo].[Users] ([ID])
);
GO

