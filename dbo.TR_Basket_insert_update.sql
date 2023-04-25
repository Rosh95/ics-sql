CREATE TRIGGER dbo.TR_Basket_insert_update
ON dbo.Basket
AFTER INSERT, UPDATE
AS
BEGIN
    IF (NOT EXISTS(SELECT ID_SKU FROM inserted GROUP BY ID_SKU HAVING COUNT(*) >= 2))
    BEGIN
        UPDATE dbo.Basket
        SET DiscountValue = 0
        WHERE ID IN (SELECT ID FROM inserted);
    END
    ELSE
    BEGIN
        UPDATE dbo.Basket
        SET DiscountValue = Value * 0.05
        WHERE ID IN (SELECT ID FROM inserted);
    END
END;