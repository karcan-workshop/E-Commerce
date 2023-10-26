CREATE FUNCTION [dbo].[Fn_GetDiscount]
(
	@pCategoryID		INT,
	@pBrandID			INT,
	@pProductID			INT,
	@pDate				DATETIME
)
RETURNS TABLE
AS
RETURN (
	SELECT
		TOP(1)
		*
	FROM
		dbo.Discounts AS d
	WHERE
		d.IsActive = 1
		AND d.IsDeleted = 0
		AND @pDate >= d.StartDate AND @pDate <= d.EndDate
		AND (d.CategoryID = @pCategoryID	OR d.CategoryID IS NULL)
		AND (d.BrandID = @pBrandID			OR d.BrandID IS NULL)
		AND (d.ProductID = @pProductID		OR d.ProductID IS NULL)
	ORDER BY
			IIF(d.ProductID IS NULL, 1, 0) ASC
		,	IIF(d.BrandID IS NULL, 1, 0) ASC
		,	IIF(d.CategoryID IS NULL, 1, 0) ASC
		,	d.EndDate ASC
)