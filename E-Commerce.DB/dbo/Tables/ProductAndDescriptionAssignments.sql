CREATE TABLE [dbo].[ProductAndDescriptionAssignments] (
    [ProductID]         INT             NULL,
    [DescriptionID]     INT             NULL,
    [IsActive]          BIT             NOT NULL        CONSTRAINT [DF_ProductAndDescriptionAssignments_IsActive] DEFAULT ((1)),
    [IsDeleted]         BIT             NOT NULL        CONSTRAINT [DF_ProductAndDescriptionAssignments_IsDeleted] DEFAULT ((0)),
    [CreateUserID]      INT             NOT NULL,
    [CreateDate]        DATETIME        NOT NULL        CONSTRAINT [DF_ProductAndDescriptionAssignments_CreateDate] DEFAULT (GETDATE()),
    [ModifyUserID]      INT             NULL,
    [ModifyDate]        DATETIME        NULL,

    CONSTRAINT [PK_ProductAndCategoryAssignments]
        PRIMARY KEY CLUSTERED ([ProductID] ASC, [DescriptionID] ASC)
        WITH (FILLFACTOR = 70),

    CONSTRAINT [FK_ProductAndDescriptionAssignments_Descriptions] 
        FOREIGN KEY ([DescriptionID]) REFERENCES [dbo].[Descriptions] ([ID]),

    CONSTRAINT [FK_ProductAndDescriptionAssignments_Products] 
        FOREIGN KEY ([ProductID]) REFERENCES [dbo].[Products] ([ID]),

    CONSTRAINT [FK_ProductAndDescriptionAssignments_CreateUserID_Users] 
        FOREIGN KEY ([CreateUserID]) REFERENCES [dbo].[Users] ([ID]),

    CONSTRAINT [FK_ProductAndDescriptionAssignments_CreateUserID_Users] 
        FOREIGN KEY ([ModifyUserID]) REFERENCES [dbo].[Users] ([ID])
);


GO

