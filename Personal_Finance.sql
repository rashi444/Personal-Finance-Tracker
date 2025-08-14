-- =============================
-- Personal Finance Expense Tracker
-- =============================

-- Step 0: Create and use schema
DROP DATABASE IF EXISTS personal_finance_tracker;
CREATE DATABASE personal_finance_tracker;
USE personal_finance_tracker;

-- Step 1: Create Tables

-- Accounts table
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    account_name VARCHAR(50) NOT NULL,
    account_type VARCHAR(20),
    balance DECIMAL(12,2) NOT NULL
);

-- Budgets table
CREATE TABLE Budgets (
    budget_id INT PRIMARY KEY AUTO_INCREMENT,
    category VARCHAR(50) NOT NULL,
    monthly_limit DECIMAL(12,2) NOT NULL
);

-- Transactions table
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT NOT NULL,
    trans_date DATE NOT NULL,
    category VARCHAR(50) NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    payment_mode VARCHAR(20),
    transaction_type VARCHAR(10),
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id) ON DELETE CASCADE
);

-- Step 2: Insert Sample Data

-- Accounts
INSERT INTO Accounts (account_name, account_type, balance)
VALUES 
('HDFC Savings', 'Savings', 50000),
('SBI Credit Card', 'Credit', 20000),
('Paytm Wallet', 'Wallet', 10000);

-- Budgets
INSERT INTO Budgets (category, monthly_limit)
VALUES 
('Food', 8000),
('Travel', 5000),
('Utilities', 3000),
('Shopping', 7000);

-- Transactions
INSERT INTO Transactions (account_id, trans_date, category, amount, payment_mode, transaction_type)
VALUES
(1, '2025-08-01', 'Food', 500, 'Card', 'Debit'),
(1, '2025-08-03', 'Utilities', 1200, 'UPI', 'Debit'),
(2, '2025-08-05', 'Shopping', 3000, 'Credit', 'Debit'),
(3, '2025-08-07', 'Travel', 1500, 'Wallet', 'Debit'),
(1, '2025-08-10', 'Food', 600, 'Cash', 'Debit'),
(2, '2025-08-12', 'Shopping', 2000, 'Credit', 'Debit'),
(3, '2025-08-15', 'Travel', 2000, 'Wallet', 'Debit'),
(1, '2025-08-20', 'Food', 700, 'Card', 'Debit'),
(1, '2025-08-25', 'Utilities', 1500, 'UPI', 'Debit'),
(2, '2025-08-28', 'Shopping', 2500, 'Credit', 'Debit');

-- Step 3: Queries for Insights

-- 3.1 Monthly spend per category + comparison to budget
SELECT 
    t.category AS category,
    SUM(t.amount) AS total_spent,
    b.monthly_limit AS budget_limit,
    SUM(t.amount) - b.monthly_limit AS over_budget
FROM Transactions t
JOIN Budgets b ON t.category = b.category
WHERE MONTH(t.trans_date) = 8 AND YEAR(t.trans_date) = 2025
GROUP BY t.category, b.monthly_limit;

-- 3.2 Top 3 expense categories in a month
SELECT t.category AS category, SUM(t.amount) AS total_spent
FROM Transactions t
WHERE MONTH(t.trans_date) = 8 AND YEAR(t.trans_date) = 2025
GROUP BY t.category
ORDER BY total_spent DESC
LIMIT 3;

-- 3.3 Total debit vs credit balance per account
SELECT 
    a.account_name AS account,
    SUM(CASE WHEN t.transaction_type = 'Debit' THEN t.amount ELSE 0 END) AS total_debit,
    SUM(CASE WHEN t.transaction_type = 'Credit' THEN t.amount ELSE 0 END) AS total_credit
FROM Accounts a
LEFT JOIN Transactions t ON a.account_id = t.account_id
GROUP BY a.account_name;

-- 3.4 Months where total expenses exceeded budget
SELECT 
    MONTH(t.trans_date) AS month,
    t.category AS category,
    SUM(t.amount) AS total_spent,
    b.monthly_limit AS budget_limit
FROM Transactions t
JOIN Budgets b ON t.category = b.category
GROUP BY MONTH(t.trans_date), t.category, b.monthly_limit
HAVING SUM(t.amount) > b.monthly_limit;

-- 3.5 Verify inserted data
SELECT * FROM Accounts;
SELECT * FROM Budgets;
SELECT * FROM Transactions;
