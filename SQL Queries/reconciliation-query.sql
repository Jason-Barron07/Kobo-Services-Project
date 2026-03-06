-- Reconciliation Query
-- This query finds ledger entries that failed to generate a corresponding voucher
SELECT *
FROM TransactionLedger
-- LEFT JOIN keeps all records from TransactionLedger
-- and attempts to match them with records in DigitalVouchers
LEFT JOIN DigitalVouchers
ON TransactionLedger.EntryID = DigitalVouchers.EntryID
-- If a voucher was not created, the DigitalVouchers fields will be NULL
-- This condition filters those unmatched records
WHERE DigitalVouchers.EntryID IS NULL;