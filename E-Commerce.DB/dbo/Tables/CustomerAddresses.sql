CREATE TABLE [dbo].[CustomerAddresses] (
    [ID]                        BIGINT              NOT NULL        IDENTITY(1, 1),
    [CustomerID]                INT                 NOT NULL,
    [AdministrativeBoundaryID]  INT                 NOT NULL,
    [Street]                    VARCHAR(64)         NOT NULL,
    [ApartmentNo]               VARCHAR(16)         NOT NULL,
    [BuildingNo]                VARCHAR(16)         NOT NULL,
    [PostCode]                  VARCHAR(10)         NOT NULL,
    [Location]                  [sys].[geography]   NULL,
    [Title]                     NVARCHAR(64)        NULL,
    [Description]               VARCHAR(128)        NULL,
    [IsActive]                  BIT                 NOT NULL        CONSTRAINT [DF_CustomerAddresses_IsActive] DEFAULT ((1)),
    [IsDeleted]                 BIT                 NOT NULL        CONSTRAINT [DF_CustomerAddresses_IsDeleted] DEFAULT ((0)),
    [CreateDate]                DATETIME            NOT NULL        CONSTRAINT [DF_CustomerAddresses_CreateDate] DEFAULT (GETDATE()),
    [ModifyDate]                DATETIME            NULL,

    CONSTRAINT [PK_CustomerAddresses] 
        PRIMARY KEY CLUSTERED ([ID] ASC)
        WITH (FILLFACTOR = 70),

    CONSTRAINT [FK_CustomerAddresses_AdministrativeBoundaries] 
        FOREIGN KEY ([AdministrativeBoundaryID]) REFERENCES [dbo].[AdministrativeBoundaries] ([ID]),

    CONSTRAINT [FK_CustomerAddresses_CustomerID_Customers] 
        FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customers] ([ID])
);


GO

