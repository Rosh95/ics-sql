CREATE FUNCTION dbo.udf_GetSKUPrice (@ID_SKU INT)
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @Price DECIMAL(18,2);
    DECLARE @Quantity INT;
    
    SELECT @Price = SUM(Value), @Quantity = SUM(Quantity)
    FROM dbo.Basket
    WHERE ID_SKU = @ID_SKU;
    
    IF @Quantity = 0
        RETURN 0.00;
    
    RETURN @Price / @Quantity;
