CREATE TABLE [dbo].[CustomerSessionHistory] (
    [ID]                BIGINT              NOT NULL        IDENTITY(1, 1),
    [CustomerID]        INT                 NOT NULL,
    [Token]             UNIQUEIDENTIFIER    NOT NULL,
    [IPAddress]         VARCHAR(15)         NULL,
    [UserAgent]         VARCHAR(MAX)        NULL,
    [IsLoggedIn]        BIT                 NOT NULL,

    CONSTRAINT [PK_CustomerSessionHistory] 
        PRIMARY KEY CLUSTERED ([ID] ASC)
        WITH (FILLFACTOR = 70, PAD_INDEX = ON),

    CONSTRAINT [FK_CustomerSessionHistory_CustomerID_Customers] 
        FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customers] ([ID])
);


GO

