CREATE TABLE [dbo].[CurrencySymbols](
    [Symbol]      VARCHAR(3)    NOT NULL,

    CONSTRAINT [PK_CurrencySymbols]
      PRIMARY KEY CLUSTERED ([Symbol] ASC)
      WITH (FILLFACTOR = 70, PAD_INDEX = ON)
)
