CREATE TABLE [dbo].[ProductPrices] (
    [ProductID]         INT             NOT NULL,
    [Date]              DATETIME        NOT NULL,
    [CurrencySymbol]    VARCHAR(3)      NOT NULL, 
    [Price]             DECIMAL(9, 2)   NOT NULL, 

    CONSTRAINT [PK_ProductPrices] 
        PRIMARY KEY CLUSTERED ([ProductID] ASC, [Date] ASC)
        WITH (FILLFACTOR = 70),

    CONSTRAINT [FK_ProductPrices_Products] 
        FOREIGN KEY ([ProductID]) REFERENCES [dbo].[Products] ([ID]),

    CONSTRAINT [FK_ProductPrices_CurrencySymbol]
        FOREIGN KEY ([CurrencySymbol]) REFERENCES [dbo].[CurrencySymbols] ([Symbol])
);
GO

