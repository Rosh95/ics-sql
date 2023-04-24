CREATE PROCEDURE dbo.usp_MakeFamilyPurchase
    @FamilySurName VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @FamilyID INT;
    
    SELECT @FamilyID = ID
    FROM dbo.Family
    WHERE SurName = @FamilySurName;
    
    IF @FamilyID IS NULL
        THROW 50001, 'Family does not exist', 1;
    
    UPDATE dbo.Family
    SET BudgetValue = BudgetValue - (SELECT SUM(Value) FROM dbo.Basket WHERE ID_Family = @FamilyID)
    WHERE ID = @FamilyID;
END
