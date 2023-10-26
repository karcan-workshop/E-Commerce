CREATE TABLE [dbo].[ProductAndCategoryAssignments] (
    [ProductID]         INT             NOT NULL,
    [CategoryID]        INT             NOT NULL,
    [IsActive]          BIT             NOT NULL        CONSTRAINT [DF_ProductAndCategoryAssignments_IsActive] DEFAULT ((1)),
    [IsDeleted]         BIT             NOT NULL        CONSTRAINT [DF_ProductAndCategoryAssignments_IsDeleted] DEFAULT ((0)),
    [CreateUserID]      INT             NOT NULL,
    [CreateDate]        DATETIME        NOT NULL        CONSTRAINT [DF_ProductAndCategoryAssignments_CreateDate] DEFAULT (GETDATE()),
    [ModifyUserID]      INT             NULL,
    [ModifyDate]        DATETIME        NULL,

    CONSTRAINT [PK_ProductAndCategoryAssignments] 
        PRIMARY KEY CLUSTERED ([ProductID] ASC, [CategoryID] ASC)
        WITH (FILLFACTOR = 70, PAD_INDEX = ON),

    CONSTRAINT [FK_ProductAndCategoryAssignments_Categories] 
        FOREIGN KEY ([CategoryID]) REFERENCES [dbo].[Categories] ([ID]),

    CONSTRAINT [FK_ProductAndCategoryAssignments_Products] 
        FOREIGN KEY ([ProductID]) REFERENCES [dbo].[Products] ([ID]),
    
    CONSTRAINT [FK_ProductAndCategoryAssignments_CreateUserID_Users] 
        FOREIGN KEY ([CreateUserID]) REFERENCES [dbo].[Users] ([ID]),

    CONSTRAINT [FK_ProductAndCategoryAssignments_ModifyUserID_Users] 
        FOREIGN KEY ([ModifyUserID]) REFERENCES [dbo].[Users] ([ID])
);


GO

