-- Write your own SQL object definition here, and it'll be included in your package.
INSERT INTO dbo.Products (CategoryID, ModelID, Name, CreateUserID)
SELECT 
        c1.ID
    ,   m.ID
    ,   CONCAT(c1.Name, N' - ', FORMAT(v.[value], '000000'))
    ,   1
FROM 
    dbo.Categories AS c1
    CROSS APPLY generate_series(1, 100000, 1) AS v
    OUTER APPLY (SELECT TOP(1) ID FROM dbo.Models AS m ORDER BY NEWID(), CHECKSUM(v.[value])) AS m
WHERE
    NOT EXISTS (SELECT NULL FROM dbo.Categories AS c2 WHERE c2.ParentCategoryID = c1.ID)