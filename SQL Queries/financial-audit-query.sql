-- Financial Audit Query
-- This query identifies transactions where the amount recorded in the ledger
-- does not match the product's listed value (FaceValue)

-- Select the transaction ID, the amount recorded in the ledger,
-- and the expected value of the product
SELECT TransactionLedger.EntryID, TransactionLedger.Amount, Products.FaceValue
FROM TransactionLedger

-- Join the TransactionLedger table with the Products table
-- using ProductID so we can compare the transaction amount with the product value
LEFT JOIN Products
ON TransactionLedger.ProductID = Products.ProductID

-- Filter results to show only transactions where the ledger amount
-- does not equal the product's FaceValue
WHERE TransactionLedger.Amount <> Products.FaceValue;