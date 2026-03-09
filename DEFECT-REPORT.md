# Kobo-Services-Project

## Kobo Fintech – Defect Report

This report documents the defects identified in the Kobo Fintech system after reviewing the database schema, stored procedure logic, and API request/response behaviour.

The system contains **six major defects**:

- **3 Procedural defects** (SQL logic)

- **3 Structural defects** (Database/API design)

## Procedural Defects

### DEF-001: Missing Transaction Handling

**Severity:** Critical  

**Component:** Stored Procedure (`usp_IssueDigitalVoucher`)

### Description

The stored procedure performs multiple dependent database operations:

1. Deducting the wallet balance  

2. Inserting a transaction into the ledger  

3. Generating a digital voucher  

However, the procedure does not use transaction control such as `BEGIN TRANSACTION`, `COMMIT`, or `ROLLBACK`.

### Impact

If the system crashes during execution, the wallet balance may be deducted while the voucher is never generated. This creates inconsistent financial records and could result in users being charged without receiving a voucher.

## DEF-002: No Wallet Balance Validation

**Severity:** Critical  

**Component:** Stored Procedure Logic

### Description 02

The stored procedure deducts the product value from the wallet without verifying whether the wallet contains sufficient funds.

### Impact 02

Users can purchase vouchers even when their wallet balance is insufficient, potentially creating negative balances and financial inconsistencies.

---

## DEF-003: Concurrency Risk (Race Condition)

**Severity:** High  

**Component:** Stored Procedure / Wallet Updates

### Description 03

The procedure updates the wallet balance without implementing any concurrency control or row locking.

### Impact 03

If multiple purchase requests are executed simultaneously, the same wallet balance could be deducted multiple times, allowing multiple vouchers to be issued for the same funds.

---

## Structural Defects

## DEF-004: Use of FLOAT for Financial Data

**Severity:** High  

**Component:** Database Schema

### Description 04

Financial values such as wallet balances, transaction amounts, and product prices are stored using the `FLOAT` data type.

### Impact 05

`FLOAT` stores approximate numeric values and can introduce rounding errors. This can lead to inaccurate financial calculations and reconciliation problems.

---

## DEF-005: Voucher PIN Exposed in API Response

**Severity:** High  

**Component:** API Response

### Description 05

The API returns the voucher PIN directly in the purchase response.

Example:

``json

{

  "status": "SUCCESS",

  "pin": "1809628860",

  "traceId": "e7d66f2b-1eed-4330-9efc-7d0145027aff"

}

## DEF-006: Internal Database IDs Exposed Through API

**Severity:** Medium  

**Component:** API Request Design  

### Description 06

The API requires internal database identifiers such as `walletId` and `productId`.
