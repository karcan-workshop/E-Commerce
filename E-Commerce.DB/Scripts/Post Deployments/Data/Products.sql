--SET QUOTED_IDENTIFIER ON;
--GO

;WITH CTE AS (
	SELECT
		Value = 1
	UNION ALL
	SELECT
		Value = Value + 1
	FROM
		CTE
	WHERE
		Value < 1000000
)
INSERT INTO dbo.Products (CategoryID, BrandID, Name, CreateUserID)
SELECT 
        c1.ID
    ,   b.ID
    ,   CONCAT(c1.Name, N' - ', FORMAT(v.[value], '0000000'))
    ,   1
FROM 
    [dbo].[Categories] AS c1
    CROSS APPLY CTE AS v
    OUTER APPLY (SELECT TOP(1) ID FROM [dbo].[Brands] AS b ORDER BY NEWID(), CHECKSUM(v.[value])) AS b
WHERE
    NOT EXISTS (SELECT NULL FROM [dbo].[Categories] AS c2 WHERE c2.ParentCategoryID = c1.ID)
OPTION(MAXRECURSION 0);