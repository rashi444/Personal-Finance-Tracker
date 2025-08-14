\# Personal Finance Expense Tracker



\## Overview

This project is a \*\*Personal Finance Expense Tracker\*\* built using \*\*MySQL\*\*.  

It allows tracking of transactions, accounts, and budgets, and provides insights into spending habits.  

Designed to mimic a \*\*mini real-world product\*\*, making it relevant to \*\*BFSI (Banking, Financial Services, Insurance)\*\* analytics — perfect for demonstrating SQL and data analysis skills.



\## Features

\- Track multiple accounts (bank, credit card, wallet)

\- Categorize expenses and credits

\- Set monthly budgets per category

\- Generate insights like:

&nbsp; - Monthly spend per category vs budget

&nbsp; - Top 3 expense categories

&nbsp; - Total debit vs credit per account

&nbsp; - Months where spending exceeded budget



\## Database Schema

1\. \*\*Accounts\*\*

&nbsp;  - `account\_id` (Primary Key)  

&nbsp;  - `account\_name`  

&nbsp;  - `account\_type`  

&nbsp;  - `balance`  



2\. \*\*Budgets\*\*

&nbsp;  - `budget\_id` (Primary Key)  

&nbsp;  - `category`  

&nbsp;  - `monthly\_limit`  



3\. \*\*Transactions\*\*

&nbsp;  - `transaction\_id` (Primary Key)  

&nbsp;  - `account\_id` (Foreign Key → Accounts)  

&nbsp;  - `trans\_date`  

&nbsp;  - `category`  

&nbsp;  - `amount`  

&nbsp;  - `payment\_mode`  

&nbsp;  - `transaction\_type` (Debit/Credit)  



\## Setup

1\. Run `finance\_tracker.sql` in \*\*MySQL Workbench\*\*.  

2\. The script will:

&nbsp;  - Create the schema `personal\_finance\_tracker`

&nbsp;  - Create tables and insert sample data

&nbsp;  - Run insightful queries



\## Queries / Insights

\- Monthly spend per category vs budget  

\- Top 3 expense categories  

\- Total debit vs credit per account  

\- Months where total expenses exceeded budget  



\## Screenshots

!\[Monthly Spend](screenshots/monthly\_spend.png)  

!\[Top 3 Categories](screenshots/top3\_categories.png)  

!\[Debit vs Credit](screenshots/debit\_vs\_credit.png)  

!\[Over Budget](screenshots/over\_budget.png)



\## Tech Stack

\- MySQL / MySQL Workbench



\## Why This Project Stands Out

\- Realistic \*\*BFSI relevance\*\* for fintech and banking analytics  

\- Demonstrates strong \*\*SQL skills\*\*: joins, aggregates, CASE statements, and insights  

\- Fully functional \*\*mini-product\*\* ready to showcase



