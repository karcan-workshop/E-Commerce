CREATE TABLE [dbo].[Discounts] (
    [ID]                INT                 NOT NULL        IDENTITY(1, 1),
    [CategoryID]        INT                 NULL,
    [BrandID]           INT                 NULL,
    [ProductID]         INT                 NULL,
    [DiscountPercent]   DECIMAL(4, 2)       NOT NULL        CONSTRAINT [DF_Discounts_DiscountPercent] DEFAULT ((0)),
    [StartDate]         DATETIME2(7)        NOT NULL,
    [EndDate]           DATETIME2(7)        NULL,
    [IsActive]          BIT                 NOT NULL        CONSTRAINT [DF_Discounts_IsActive] DEFAULT ((1)),
    [IsDeleted]         BIT                 NOT NULL        CONSTRAINT [DF_Discounts_IsDeleted] DEFAULT ((0)),
    [CreateUserID]      INT                 NOT NULL,
    [CreateDate]        DATETIME            NOT NULL        CONSTRAINT [DF_Discounts_CreateDate] DEFAULT (GETDATE()),
    [ModifyUserID]      INT                 NULL,
    [ModifyDate]        DATETIME            NULL,

    CONSTRAINT [PK_Discounts]
        PRIMARY KEY CLUSTERED ([ID] ASC)
        WITH (FILLFACTOR = 70, PAD_INDEX = ON),
    
    CONSTRAINT [FK_Discounts_Categories] 
        FOREIGN KEY ([CategoryID]) REFERENCES [dbo].[Categories] ([ID]),
    
    CONSTRAINT [FK_Discounts_Brands] 
        FOREIGN KEY ([BrandID]) REFERENCES [dbo].[Brands] ([ID]),
    
    CONSTRAINT [FK_Discounts_Products] 
        FOREIGN KEY ([ProductID]) REFERENCES [dbo].[Products] ([ID]),
    
    CONSTRAINT [FK_Discounts_CreateUserID_Users] 
        FOREIGN KEY ([CreateUserID]) REFERENCES [dbo].[Users] ([ID]),

    CONSTRAINT [FK_Discounts_ModifyUserID_Users] 
        FOREIGN KEY ([ModifyUserID]) REFERENCES [dbo].[Users] ([ID]),

    CONSTRAINT [DF_Discounts_IsDuplicate] 
        CHECK (dbo.Fn_CheckIfDiscountIsDuplicate(ID, CategoryID, BrandID, ProductID, StartDate, EndDate) = 0)
);


GO

