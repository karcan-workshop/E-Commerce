CREATE TABLE [dbo].[Customers] (
    [ID]                INT             NOT NULL        IDENTITY(1, 1),
    [IsActive]          BIT             NOT NULL        CONSTRAINT [DF_Customers_IsActive] DEFAULT ((1)),
    [IsDeleted]         BIT             NOT NULL        CONSTRAINT [DF_Customers_IsDeleted] DEFAULT ((0)),
    [CreateDate]        DATETIME        NOT NULL        CONSTRAINT [DF_Customers_CreateDate] DEFAULT (GETDATE()),
    [ModifyDate]        DATETIME        NULL,

    CONSTRAINT [PK_Customers] 
        PRIMARY KEY CLUSTERED ([ID] ASC)
        WITH (FILLFACTOR = 70)
);


GO

