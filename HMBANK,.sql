CREATE DATABASE HMBANK
USE HMBANK
--Tasks 1: Database Design: 

--1. Create the database named "HMBank
--2. Define the schema for the Customers, Accounts, and Transactions tables based on the provided schema
--5. Create appropriate Primary Key and Foreign Key constraints for referential integrity.
--6. Write SQL scripts to create the mentioned tables with appropriate data types, constraints, and relationship
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
	dob DATE,
    Address VARCHAR(100),
	City VARCHAR(50),
    Email VARCHAR(100),
    Phone INT
);
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    customerID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(15, 2),
	AccountDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionType VARCHAR(20),
    Amount DECIMAL(15, 2),
    TransactionDate DATE,
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);
--Tasks 2: Select, Where, Between, AND, LIKE:
--1. Insert at least 10 sample records into each of the following tables. 

-- Insert sample records into Customers table

INSERT INTO Customers (CustomerID, FirstName, LastName,dob, Address,City, Email, Phone)
VALUES
(1, 'Akash', 'Doe', '2001-08-01','123 Main St','chennai', 'john.doe@gmail.com', 1234567890),
(2, 'Ramesh', 'Smith','1995-09-08', '456 Elm St','chennai', 'jane.smith@gmail.com', 987-654-3210),
(3, 'Suresh', 'Kumar','1982-07-05' ,'234 nelli road','coimbatore', 'suresh@gmail.com', 123-098-9990),
(4, 'Ram', 'Raj' ,'1984-01-01', '444 st.high ','madurai', 'ram@gmail.com',222-220-3455),
(5,'Clara', ' Sighn','1983-05-11','565 roadway','chennai' , 'clara@gmail.com',980-098-6754),
(6, 'Shelby', ' Clay' ,'1998-03-07', '221 park st','salem' ,'shelby@gmail.com',676-898-000),
(7,' Aishu', 'Shetty','1990-02-12','673 ganda st','salem','aishu@gmail.com',890-445-1234),
(8,'Mouine','Roy','1999-05-10','555 nikle road','theni', 'mouine@gmail.com',980-527-8976),
(9,'Lakshay','Shree','1991-03-02','011 Vigle nagar','chennai','lakshay@gmail.com',999-000-8888),
(10,'Bava','Ghav','1992-07-06','543 Fisby street','madurai','bava@gmail.com',723-897-0987)
INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance , Accountdate)
VALUES
(101, 1, 'Savings', 5000.00,'2000-09-02'),
(102, 2, 'Checking', 2500.00,'1999-09-07'),
(103, 3, 'Checking', 3500.00,'2001-07-04'),
(104, 4, 'Checking', 3000.00,'2018-04-06'),
(105, 5, 'Savings', 2500.00,'2020-08-09'),
(106, 6, 'Checking', 5678.00,'2018-03-03'),
(107, 7, 'Savings', 1230.00,'2005-07-01'),
(108, 8, 'Savings', 7890.00,'2015-11-03'),
(109, 9, 'Checking', 1000.00,'2016-12-12'),
(110, 10, 'Checking', 6700.00,'1998-09-04')


INSERT INTO Transactions (TransactionID, AccountID, TransactionType, Amount, TransactionDate)
VALUES
(1001, 101, 'Deposit', 1000.00, '2024-04-25'),
(1002, 102, 'Withdrawal', 500.00, '2024-04-26'),
(1003, 103, 'Withdrawal', 500.00, '2024-04-27'),
(1004, 104, 'Withdrawal', 500.00, '2024-04-28'),
(1005, 105, 'Withdrawal', 500.00, '2024-04-29'),
(1006, 106, 'Deposit', 500.00, '2024-04-01'),
(1007, 107, 'Deposit', 500.00, '2024-04-02'),
(1008, 108, 'Deposit', 500.00, '2024-04-06'),
(1009, 109, 'Withdrawal', 500.00, '2024-04-08'),
(1010, 110, 'Withdrawal', 500.00, '2024-04-09')

--2. Write SQL queries for the following tasks:
--1. Write a SQL query to retrieve the name, account type and email of all customers. 
SELECT FirstName, LastName, AccountType, Email
FROM Customers
JOIN Accounts ON Customers.CustomerID = Accounts.CustomerID;

--2. Write a SQL query to list all transaction corresponding customer
SELECT c.FirstName, c.LastName, t.TransactionType, t.Amount, t.TransactionDate
FROM Customers c
JOIN Accounts a ON c.CustomerID = a.CustomerID
JOIN Transactions t ON a.AccountID = t.AccountID;

--3. Write a SQL query to increase the balance of a specific account by a certain amount.
UPDATE Accounts
SET Balance = Balance + 1000.00
WHERE AccountID = 103;

--4. Write a SQL query to Combine first and last names of customers as a full_name.
SELECT CONCAT(FirstName, ' ', LastName) AS full_name
FROM Customers;

--5. Write a SQL query to remove accounts with a balance of zero where the account type is savings
DELETE FROM Accounts
WHERE Balance = 0 AND AccountType = 'Savings';

--6. Write a SQL query to Find customers living in a specific city
SELECT FirstName, LastName, Address
FROM Customers
WHERE City = 'chennai';

--7. Write a SQL query to Get the account balance for a specific account
SELECT AccountID,Balance
FROM Accounts
WHERE AccountID = 102;

--8. Write a SQL query to List all current accounts with a balance greater than $1,000
SELECT *
FROM Accounts
WHERE  Balance > $1000.00;

--9. Write a SQL query to Retrieve all transactions for a specific account.
SELECT *
FROM Transactions
WHERE AccountID = 101;

--10. Write a SQL query to Calculate the interest accrued on savings accounts based on a given interest rate
SELECT AccountID, Balance * 0.2 AS InterestAccrued
FROM Accounts
WHERE AccountType = 'Savings';

--11. Write a SQL query to Identify accounts where the balance is less than a specified overdraft limit
SELECT AccountID, Balance
FROM Accounts
WHERE Balance < 3000.00;

--12. Write a SQL query to Find customers not living in a specific city
SELECT FirstName, LastName, Address , City
FROM Customers
WHERE City NOT LIKE 'salem';

--Tasks 3: Aggregate functions, Having, Order By, GroupBy and Joins:
--1. Write a SQL query to Find the average account balance for all customers
SELECT AVG(Balance) AS AverageBalance
FROM Accounts;

--2. Write a SQL query to Retrieve the top 10 highest account balances.
SELECT *
FROM Accounts
ORDER BY Balance DESC 

--3. Write a SQL query to Calculate Total Deposits for All Customers in specific date.
SELECT SUM(Amount) AS TotalDeposits
FROM Transactions
WHERE TransactionType = 'Deposit' AND TransactionDate = '2024-04-25'; 

--4. Write a SQL query to Find the Oldest and Newest Customers.
-- Oldest Customer
SELECT TOP 1 CustomerID, MIN(AccountDate) AS OldestAccountDate
FROM Accounts
GROUP BY CustomerID
ORDER BY OldestAccountDate asc


-- Newest Customer
SELECT TOP 1 CustomerID, MIN(AccountDate) AS NewestAccountDate
FROM Accounts
GROUP BY CustomerID
ORDER BY NewestAccountDate desc


--5. Write a SQL query to Retrieve transaction details along with the account type.
SELECT t.*, a.AccountType
FROM Transactions t
JOIN Accounts a ON t.AccountID = a.AccountID;

--6. Write a SQL query to Get a list of customers along with their account details.
SELECT FirstName , LastName , AccountID, AccountType , Balance
FROM Customers
JOIN Accounts ON Customers.CustomerID = Accounts.CustomerID;

--7. Write a SQL query to Retrieve transaction details along with customer information for a specific account
SELECT c.FirstName, c.LastName, t.*
FROM Customers c
JOIN Accounts a ON c.CustomerID = a.CustomerID
JOIN Transactions t ON a.AccountID = t.AccountID
WHERE a.AccountID = 108;

--8. Write a SQL query to Identify customers who have more than one account.

SELECT  COUNT(*) AS NumAccounts
FROM Customers c
JOIN Accounts a ON c.CustomerID = a.CustomerID
GROUP BY c.CustomerID
HAVING COUNT(*) > 1;

--9. Write a SQL query to Calculate the difference in transaction amounts between deposits and withdrawals
SELECT AccountID, SUM(CASE WHEN TransactionType = 'Deposit' THEN Amount ELSE -Amount END) AS Difference
FROM Transactions
GROUP BY AccountID;

--10. Write a SQL query to Calculate the average daily balance for each account over a specified period
SELECT a.AccountID , b.TransactionDate , AVG(Balance) AS AverageDailyBalance
FROM Accounts a
JOIN Transactions b ON a.AccountID=b.AccountID
WHERE b.TransactionDate BETWEEN '2024-04-01' AND '2024-04-30'
GROUP BY a.AccountID , b.TransactionDate;

--11. Calculate the total balance for each account type.
SELECT AccountType, SUM(Balance) AS TotalBalance
FROM Accounts
GROUP BY AccountType;

--12. Identify accounts with the highest number of transactions order by descending order.
SELECT AccountID, COUNT(*) AS NumTransactions
FROM Transactions
GROUP BY AccountID
ORDER BY NumTransactions DESC;

SELECT a.AccountID, COUNT(*) AS NumAccounts
FROM Transactions c
JOIN Accounts a ON c.AccountID = a.AccountID
GROUP BY a.AccountID 
HAVING COUNT(*) > 1;

--13. List customers with high aggregate account balances, along with their account types.
SELECT c.CustomerID, c.FirstName, a.accounttype, SUM(a.balance) AS total_balance
FROM customers c
JOIN accounts a ON c.CustomerID = a.customerID
GROUP BY c.customerid, c.FirstName, a.accounttype
HAVING SUM(a.balance) > 5000
ORDER BY total_balance DESC;

--14. Identify and list duplicate transactions based on transaction amount, date, and account.
SELECT TransactionID, Amount, TransactionDate, AccountID, COUNT(*) AS DuplicateCount
FROM Transactions
GROUP BY Amount, TransactionDate, AccountID, TransactionID
HAVING COUNT(*) > 1;

--Tasks 4: Subquery and its type:
--1. Retrieve the customer(s) with the highest account balance
SELECT CustomerID, FirstName
FROM customers
WHERE CustomerID IN (
    SELECT CustomerID 
    FROM accounts
    WHERE balance = (SELECT MAX(balance) FROM accounts)
);

--2. Calculate the average account balance for customers who have more than one account
SELECT AVG(balance) AS average_balance
FROM accounts a
WHERE (SELECT COUNT(*) FROM accounts WHERE customerid = a.customerid) > 1;

--3. Retrieve accounts with transactions whose amounts exceed the average transaction amount.
SELECT AccountID, AccountType , Balance
FROM accounts 
WHERE balance > (SELECT AVG(amount) FROM transactions);

--4. Identify customers who have no recorded transactions
SELECT CustomerID, FirstName
FROM customers c
WHERE NOT EXISTS (SELECT 1 FROM transactions WHERE CustomerID = c.CustomerID);

--5. Calculate the total balance of accounts with no recorded transactions.
SELECT AccountID, AccountType, 
       (SELECT COALESCE(SUM(balance), 0) FROM accounts WHERE AccountID = a.AccountID) AS total_balance
FROM accounts a
WHERE NOT EXISTS (SELECT 1 FROM transactions WHERE AccountID = a.AccountID);

--6. Retrieve transactions for accounts with the lowest balance.
SELECT 
    t.TransactionID,
    t.AccountId,
    t.TransactionType,
    t.Amount,
    t.TransactionDate,
    a.AccountId
FROM 
    transactions t
JOIN 
    Accounts a ON a.accountId = t.accountId 
WHERE 
    a.balance in (SELECT MIN(balance) FROM Accounts);

--7. Identify customers who have accounts of multiple types.
SELECT 
    CustomerID,
    FirstName,
    LastName
FROM 
    Customers
WHERE 
    CustomerID IN (
        SELECT 
            CustomerID
        FROM 
            Accounts
        GROUP BY 
            CustomerID
        HAVING 
            COUNT(DISTINCT accounttype) > 1
    );

--8. Calculate the percentage of each account type out of the total number of accounts.
SELECT 
    AccountType,
    COUNT(AccountType) AS num_accounts,
    (COUNT(AccountType) * 100.0 / (SELECT COUNT(*) FROM Accounts)) AS percentage
FROM 
    Accounts
GROUP BY 
    AccountType;

--9. Retrieve all transactions for a customer with a given customer_id.
SELECT 
    t.TransactionID,
    t.AccountID,
    t.TransactionType,
    t.amount,
    t.TransactionDate
FROM 
    Transactions t
JOIN 
    (SELECT AccountID FROM Accounts WHERE customerID = 2) AS a_subquery 
ON 
    t.AccountID = a_subquery.AccountID;

--10. Calculate the total balance for each account type, including a subquery within the SELECT clause
SELECT 
    AccountType,
    (
        SELECT 
            SUM(balance) 
        FROM 
            Accounts a_sub
        WHERE 
            a_sub.AccountType = a.AccountType
    ) AS total_balance
FROM 
    Accounts a
GROUP BY 
    AccountType;

