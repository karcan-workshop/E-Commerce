CREATE FUNCTION [dbo].[Fn_GetCategoryParentList]
(
	@pChildCategoryID		INT
)
RETURNS TABLE
AS
RETURN
WITH CTE_Recursive AS (
	SELECT
			child.ID
		,	child.Name
		,	child.ParentCategoryID
		,	Level	 = 1
	FROM
		dbo.Categories AS child
	WHERE
		child.ID = @pChildCategoryID
		AND child.IsActive = 1
		AND child.IsDeleted = 0
	UNION ALL
	SELECT
			parent.ID
		,	parent.Name
		,	parent.ParentCategoryID
		,	Level	= Level + 1
	FROM
		dbo.Categories AS parent
		INNER JOIN CTE_Recursive AS cte_r ON cte_r.ParentCategoryID = parent.ID
	WHERE
		parent.IsActive = 1
		AND parent.IsDeleted = 0
)
SELECT 
		ID
	,	Name
	,	ParentCategoryID
	,	IsSelected			= CAST(IIF(ID = @pChildCategoryID, 1 , 0) AS BIT)
	,	Level				= ABS(Level - (MAX(Level) OVER() + 1))
FROM 
	CTE_Recursive