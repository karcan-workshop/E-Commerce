/*
    Created Date    :   2023-10-22
    Object          :   Scalar-valued Function
    Author          :   Ozbal, Karcan
    Description     :   this function checks the discount is duplicate or not and returns bit.
*/
CREATE FUNCTION [dbo].[Fn_CheckIfDiscountIsDuplicate] (
    @pID            INT,
    @pCategoryID    INT         = NULL,
    @pModelID       INT         = NULL,
    @pProductID     INT         = NULL,
    @pStartDate     DATETIME,
    @pEndDate       DATETIME
)
RETURNS BIT
AS
BEGIN
    IF EXISTS (
        SELECT NULL
        FROM dbo.Discounts AS d
        WHERE 
            (
                @pStartDate BETWEEN d.StartDate AND d.EndDate
                OR @pEndDate BETWEEN d.StartDate AND d.EndDate
            )
            AND ((@pCategoryID IS NULL AND CategoryID IS NULL) OR d.CategoryID = @pCategoryID)
            AND ((@pModelID IS NULL AND ModelID IS NULL) OR d.ModelID = @pModelID)
            AND ((@pProductID IS NULL AND ProductID IS NULL) OR d.ProductID = @pProductID)
            AND d.ID != @pID
    )
        RETURN 1;
    RETURN 0;
END