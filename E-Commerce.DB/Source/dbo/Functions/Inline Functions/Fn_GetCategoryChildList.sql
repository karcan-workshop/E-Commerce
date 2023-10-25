CREATE FUNCTION [dbo].[Fn_GetCategoryChildList]
(
	@pParentCategoryID		INT
)
RETURNS TABLE
AS
RETURN
WITH CTE_Recursive AS (
	SELECT
			parent.ID
		,	parent.Name
		,	parent.ParentCategoryID
	FROM
		dbo.Categories AS parent
	WHERE
		parent.ID = @pParentCategoryID
		AND parent.IsActive = 1
		AND parent.IsDeleted = 0
	UNION ALL
	SELECT
			child.ID
		,	child.Name
		,	child.ParentCategoryID
	FROM
		dbo.Categories AS child
		INNER JOIN CTE_Recursive AS cte_r ON cte_r.ID = child.ParentCategoryID
	WHERE
		child.IsActive = 1
		AND child.IsDeleted = 0
)
SELECT 
		ID
	,	Name
	,	ParentCategoryID
FROM 
	CTE_Recursive