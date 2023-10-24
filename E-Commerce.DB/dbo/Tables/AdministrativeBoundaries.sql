CREATE TABLE [dbo].[AdministrativeBoundaries] (
    [ID]                    INT             NOT NULL        IDENTITY(1, 1),
    [Name]                  VARCHAR(64)     NOT NULL,
    [Level]                 TINYINT         NOT NULL,
    [ParentID]              INT             NULL,
    [IsActive]              BIT             NOT NULL        CONSTRAINT [DF_AdministrativeBoundaries_IsActive] DEFAULT ((1)),
    [IsDeleted]             BIT             NOT NULL        CONSTRAINT [DF_AdministrativeBoundaries_IsDeleted] DEFAULT ((0)),
    [CreateUserID]          INT             NOT NULL,
    [CreateDate]            DATETIME        NOT NULL        CONSTRAINT [DF_AdministrativeBoundaries_CreateDate] DEFAULT (GETDATE()),
    [ModifyUserID]          INT             NULL,
    [ModifyDate]            DATETIME        NULL,

    CONSTRAINT [PK_AdministrativeBoundaries] 
        PRIMARY KEY CLUSTERED ([ID] ASC)
        WITH (FILLFACTOR = 70),

    CONSTRAINT [FK_AdministrativeBoundaries_AdministrativeBoundaries] 
        FOREIGN KEY ([ParentID]) REFERENCES [dbo].[AdministrativeBoundaries] ([ID]),

    CONSTRAINT [FK_AdministrativeBoundaries_CreateUserID_Users] 
        FOREIGN KEY ([CreateUserID]) REFERENCES [dbo].[Users] ([ID]),

    CONSTRAINT [FK_AdministrativeBoundaries_CreateUserID_Users] 
        FOREIGN KEY ([ModifyUserID]) REFERENCES [dbo].[Users] ([ID])
);


GO

