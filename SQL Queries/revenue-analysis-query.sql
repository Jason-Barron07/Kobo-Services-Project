-- Calculate the total amount of completed transactions per user
SELECT Users.UserID, SUM(TransactionLedger.Amount) AS Total
FROM Users
-- Join users to their transactions
JOIN TransactionLedger
ON Users.UserID = TransactionLedger.WalletID
-- Only include completed transactions
WHERE TransactionLedger.ProcessingStatus = 'Completed'
-- Group results by user to sum their transactions
GROUP BY Users.UserID;