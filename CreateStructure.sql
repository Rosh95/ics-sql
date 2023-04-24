CREATE TABLE dbo.SKU (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Code AS ('s' + CAST(ID AS VARCHAR(50))) UNIQUE,
    Name VARCHAR(100)
);

CREATE TABLE dbo.Family (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    SurName VARCHAR(255),
    BudgetValue DECIMAL(18,2)
);

CREATE TABLE dbo.Basket (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    ID_SKU INT,
    ID_Family INT,
    Quantity INT DEFAULT 0 CHECK (Quantity >= 0),
    Value DECIMAL(18,2) DEFAULT 0.00 CHECK (Value >= 0),
    PurchaseDate DATE DEFAULT GETDATE(),
    DiscountValue DECIMAL(18,2) DEFAULT 0.00,
    FOREIGN KEY (ID_SKU) REFERENCES dbo.SKU(ID),
    FOREIGN KEY (ID_Family) REFERENCES dbo.Family(ID)
);
