CREATE TABLE [dbo].[CustomerSessions] (
    [ID]            BIGINT              NOT NULL        IDENTITY(1, 1),
    [CustomerID]    INT                 NOT NULL,
    [Token]         UNIQUEIDENTIFIER    NOT NULL,
    [CreateDate]    DATETIME            NOT NULL        CONSTRAINT [DF_CustomerSessions_CreateDate] DEFAULT (GETDATE()),
    [ModifyDate]    DATETIME            NULL,

    CONSTRAINT [PK_CustomerSessions] 
        PRIMARY KEY CLUSTERED ([ID] ASC)
        WITH (FILLFACTOR = 70, PAD_INDEX = ON),

    CONSTRAINT [FK_CustomerSessions_CustomerID_Customers] 
        FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customers] ([ID])
);


GO

