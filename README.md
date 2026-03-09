
# Kobo Fintech API Testing & SQL Analysis

## Overview

This project analyses a simulated fintech system used by **Kobo Financial Services**. The objective was to identify design flaws, security concerns, and data inconsistencies while demonstrating SQL querying, API testing, and basic reconciliation techniques.

The project focuses on:

* API testing using Postman
* SQL analysis and reconciliation queries
* Identification of fintech system defects
* Basic financial data auditing

---

## Project Objectives

1. Analyse API behaviour and identify design issues.
2. Detect database design flaws that could impact financial accuracy.
3. Write SQL queries to audit financial transactions.
4. Demonstrate reconciliation techniques used in fintech systems.

---

## Technologies Used

* SQL Server
* Postman
* REST APIs
* Git & GitHub

---

## Key Tasks

### 1. Revenue Analysis

SQL queries were written to calculate total transaction values for different user tiers.

### 2. Reconciliation Query

A query was created to identify ledger entries that failed to generate corresponding voucher records.

### 3. Financial Audit

SQL analysis was used to detect transactions where the ledger amount does not match the product face value.

### 4. API Testing

Postman collections were created to test system endpoints and simulate financial transactions.

---

## Example Reconciliation Query

```sql
SELECT *
FROM TransactionLedger
LEFT JOIN DigitalVouchers
ON TransactionLedger.EntryID = DigitalVouchers.EntryID
WHERE DigitalVouchers.EntryID IS NULL;
```

This query helps detect ledger entries that did not produce a corresponding voucher record.

---

## Identified System Issues

Some issues discovered during analysis include:

* Exposure of internal database identifiers in API requests
* Weak validation for financial values
* Potential mismatches between ledger transactions and product values

These flaws could lead to reconciliation problems or financial inconsistencies.

---

## Learning Outcomes

Through this project the following skills were demonstrated:

* SQL querying and joins
* Financial data auditing
* API testing with Postman
* Understanding fintech system design risks

---

## Author

Jason Barron

---

## Notes

This project was completed as part of a **software testing / quality engineering assignment** focused on analysing fintech system reliability and data integrity.
