CREATE TABLE [dbo].[AdministrativeBoundaryPolygons] (
    [ID]                        INT                 NOT NULL      IDENTITY(1, 1),
    [AdministrativeBoundaryID]  INT                 NOT NULL,
    [Shape]                     [sys].[geography]   NULL,
    [IsActive]                  BIT                 NOT NULL        CONSTRAINT [DF_AdministrativeBoundaryPolygons_IsActive] DEFAULT ((1)),
    [IsDeleted]                 BIT                 NOT NULL        CONSTRAINT [DF_AdministrativeBoundaryPolygons_IsDeleted] DEFAULT ((0)),
    [CreateUserID]              INT                 NOT NULL,
    [CreateDate]                DATETIME            NOT NULL        CONSTRAINT [DF_AdministrativeBoundaryPolygons_CreateDate] DEFAULT (GETDATE()),
    [ModifyUserID]              INT                 NULL,
    [ModifyDate]                DATETIME            NULL,

    CONSTRAINT [PK_AdministrativeBoundaryPolygons] 
        PRIMARY KEY CLUSTERED ([ID] ASC)
        WITH (FILLFACTOR = 70),

    CONSTRAINT [FK_AdministrativeBoundaryPolygons_AdministrativeBoundaries] 
        FOREIGN KEY ([AdministrativeBoundaryID]) REFERENCES [dbo].[AdministrativeBoundaries] ([ID]),

    CONSTRAINT [FK_AdministrativeBoundaryPolygons_CreateUserID_Users] 
        FOREIGN KEY ([CreateUserID]) REFERENCES [dbo].[Users] ([ID]),

    CONSTRAINT [FK_AdministrativeBoundaryPolygons_ModifyUserID_Users] 
        FOREIGN KEY ([ModifyUserID]) REFERENCES [dbo].[Users] ([ID])
);


GO

