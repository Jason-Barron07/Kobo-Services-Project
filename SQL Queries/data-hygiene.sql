-- Select mobile numbers from the Users table
SELECT MSISDN
FROM Users WHERE 
-- MSISDN is not exactly 11 digits
LEN(MSISDN) <> 11  OR    
-- MSISDN contains characters other than numbers
MSISDN LIKE '%[^0-9]%';