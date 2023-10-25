DECLARE @vCategories TABLE (
	ID					INT, 
	Name				NVARCHAR(128), 
	ParentCategoryID	INT,

	PRIMARY KEY CLUSTERED ([ID])
);

INSERT INTO @vCategories (ID, Name, ParentCategoryID)
VALUES	(100000, N'Elektronik', NULL),
			(110000, N'Bilgisayar/Tablet', 100000),
				(111000, N'Dizüstü Bilgisayar', 110000),
					(111100, N'Notebook', 111000),
					(111200, N'Oyun Bilgisayarları', 111000),
					(111300, N'İkisi Bir Arada', 111000),
				(112000, N'Tablet', 110000),
					(112100, N'Apple', 112000),
					(112200, N'Samsung', 112000),
					(112300, N'Lenovo', 112000),
				(113000, N'Masaüstü Bilgisayar', 110000),
					(113100, N'All-in-One', 113000),
					(113200, N'Masaüstü', 113000),
					(113300, N'Mini Masaüstü', 113000),
				(114000, N'Oyuncu Özel', 110000),
					(114100, N'Klavye', 114000),
					(114200, N'Mouse', 114000),
					(114300, N'Kulaklık', 114000);

ALTER TABLE dbo.Categories
DROP CONSTRAINT IF EXISTS [FK_Categories_ParentCategoryID_Categories];

SET IDENTITY_INSERT dbo.Categories ON;

MERGE dbo.Categories AS c
USING @vCategories AS vc ON vc.ID = c.ID
WHEN MATCHED THEN
	UPDATE
	SET
			Name				= vc.Name
		,	ParentCategoryID	= vc.ParentCategoryID
		,	ModifyUserID		= 1
		,	ModifyDate			= GETDATE()
WHEN NOT MATCHED THEN
	INSERT (ID, Name, ParentCategoryID, CreateUserID)
	VALUES (vc.ID, vc.Name, vc.ParentCategoryID, 1);
SET IDENTITY_INSERT dbo.Categories OFF;

ALTER TABLE dbo.Categories
ADD CONSTRAINT [FK_Categories_ParentCategoryID_Categories] 
FOREIGN KEY ([ParentCategoryID]) REFERENCES [dbo].[Categories] ([ID])