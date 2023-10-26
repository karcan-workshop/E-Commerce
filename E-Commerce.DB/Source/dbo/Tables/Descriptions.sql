CREATE TABLE [dbo].[Descriptions] (
    [ID]            INT                 NOT NULL       IDENTITY(1, 1),
    [Title]         NVARCHAR(256)       NOT NULL,
    [Data]          NVARCHAR(MAX)       NOT NULL,
    [IsActive]      BIT                 NOT NULL        CONSTRAINT [DF_Descriptions_IsActive] DEFAULT ((1)),
    [IsDeleted]     BIT                 NOT NULL        CONSTRAINT [DF_Descriptions_IsDeleted] DEFAULT ((0)),
    [CreateUserID]  INT                 NOT NULL,
    [CreateDate]    DATETIME            NOT NULL        CONSTRAINT [DF_Descriptions_CreateDate] DEFAULT (GETDATE()),
    [ModifyUserID]  INT                 NULL,
    [ModifyDate]    DATETIME            NULL,

    CONSTRAINT [PK_Descriptions] 
        PRIMARY KEY CLUSTERED ([ID] ASC)
        WITH (FILLFACTOR = 70, PAD_INDEX = ON),

    CONSTRAINT [FK_Descriptions_CreateUserID_Users] 
        FOREIGN KEY ([CreateUserID]) REFERENCES [dbo].[Users] ([ID]),

    CONSTRAINT [FK_Descriptions_ModifyUserID_Users] 
        FOREIGN KEY ([ModifyUserID]) REFERENCES [dbo].[Users] ([ID])
);
GO

