-- Lab Experiment 03: Implementation of different types of SQL functions.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: NIthin Ravi
-- USN: 1RUA24BCA0063
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command
root@localhost	RVU-PC-025	8.4.6	2025-09-08 11:29:51


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- PreCoded Relational Schema and Instance.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- 1. create a table named Employee with EmpID ,FirstName,LastName Salary BirthDate HireDate 

-- 2. Insert 10 records to employee;
-- 3. create a table named Orders with OrderID , OrderDate, totalAmount, EmpID(foreign key)  

-- 4. Insert 10 records to Orders


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Print the Information of the Employee and Order Table. [ Hint: SELECT * FROM TABLENAME ]
-- Write the SQL Query below this line.
create database Employee;
use Employee;

create table Employee (
EmpID varchar(20) PRIMARY KEY,
FirstName varchar(20),
LastName varchar(20),
Salary decimal(8, 2),
Birthdate datetime,
Hiredate date
);

select * from  Employee

INSERT INTO Employee(EmpID, FirstName, LastName, Salary, Birthdate, Hiredate)
VALUES
(101, 'Amit', 'Sharma', 55000, '1990-03-15', '2015-06-01'),
(102, 'Priya', 'Verma', 62000, '1988-07-22', '2016-09-15'),
(103, 'Rahul', 'Mehta', 48000, '1992-11-05', '2018-01-10'),
(104, 'Sneha', 'Patel', 73000, '1985-02-28', '2012-04-20'),
(105, 'Vikram', 'Singh', 51000, '1993-06-17', '2019-07-01'),
(106, 'Neha', 'Reddy', 59000, '1991-09-30', '2017-03-12'),
(107, 'Karan', 'Joshi', 67000, '1987-12-11', '2014-08-25'),
(108, 'Divya', 'Kapoor', 61000, '1990-05-19', '2016-11-30'),
(109, 'Arjun', 'Nair', 54000, '1994-01-08', '2020-02-18'),
(110, 'Meera', 'Desai', 58000, '1989-10-03', '2013-05-14');

create table Orders (
OrderId Varchar(20) PRIMARY KEY,
Orderdate date,
TotalAmount decimal(8,2),
EmpID varchar(20),
FOREIGN KEY (EmpID) REFERENCES Employee(EmpID)
);

INSERT INTO Orders(OrderId, OrderDate, TotalAmount, EmpID)
VALUES
('ORD001', '2025-09-01', 1500.50, 101),
('ORD002', '2025-09-02', 2450.00, 102),
('ORD003', '2025-09-03', 980.75, 103),
('ORD004', '2025-09-04', 3200.00, 104),
('ORD005', '2025-09-05', 1750.25, 105),
('ORD006', '2025-09-06', 2890.90, 106),
('ORD007', '2025-09-07', 1340.60, 107),
('ORD008', '2025-09-08', 1999.99, 108),
('ORD009', '2025-09-08', 870.00, 109),
('ORD010', '2025-09-08', 3050.45, 110);

select * from Orders




-- Output: 
101	Amit	Sharma	55000.00	1990-03-15 00:00:00	2015-06-01
102	Priya	Verma	62000.00	1988-07-22 00:00:00	2016-09-15
103	Rahul	Mehta	48000.00	1992-11-05 00:00:00	2018-01-10
104	Sneha	Patel	73000.00	1985-02-28 00:00:00	2012-04-20
105	Vikram	Singh	51000.00	1993-06-17 00:00:00	2019-07-01
106	Neha	Reddy	59000.00	1991-09-30 00:00:00	2017-03-12
107	Karan	Joshi	67000.00	1987-12-11 00:00:00	2014-08-25
108	Divya	Kapoor	61000.00	1990-05-19 00:00:00	2016-11-30
109	Arjun	Nair	54000.00	1994-01-08 00:00:00	2020-02-18
110	Meera	Desai	58000.00	1989-10-03 00:00:00	2013-05-14
					
                    



-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Number Functions Section
-- ------------------------------------------------------------
/* a. Round Salaries: Round employee salaries to nearest integer */
select EmpID, FirstName, LastName, Salary, ROUND(Salary) as RoundedSalary
FROM Employee;


-- Output: 
101	Amit	Sharma	55000.00	55000
102	Priya	Verma	62000.00	62000
103	Rahul	Mehta	48000.00	48000
104	Sneha	Patel	73000.00	73000
105	Vikram	Singh	51000.00	51000
106	Neha	Reddy	59000.00	59000
107	Karan	Joshi	67000.00	67000
108	Divya	Kapoor	61000.00	61000
109	Arjun	Nair	54000.00	54000
110	Meera	Desai	58000.00	58000

/* b. Absolute Values: Show absolute values of salaries */
select EmpID,FirstName,LastName,Salary,ABS(Salary) as AbsoluteSalary
FROM Employee;
-- Output: 
101	Amit	Sharma	55000.00	55000.00
102	Priya	Verma	62000.00	62000.00
103	Rahul	Mehta	48000.00	48000.00
104	Sneha	Patel	73000.00	73000.00
105	Vikram	Singh	51000.00	51000.00
106	Neha	Reddy	59000.00	59000.00
107	Karan	Joshi	67000.00	67000.00
108	Divya	Kapoor	61000.00	61000.00
109	Arjun	Nair	54000.00	54000.00
110	Meera	Desai	58000.00	58000.00

/* c. Ceiling Values: Get ceiling values of order amounts */
select OrderID,EmpID,TotalAmount, CEIL(TotalAmount) as ceilingAmount
FROM Orders;


-- Output: 
ORD001	101	1500.50	1501
ORD002	102	2450.00	2450
ORD003	103	980.75	981
ORD004	104	3200.00	3200
ORD005	105	1750.25	1751
ORD006	106	2890.90	2891
ORD007	107	1340.60	1341
ORD008	108	1999.99	2000
ORD009	109	870.00	870
ORD010	110	3050.45	3051

-- ------------------------------------------------------------
-- Aggregate Functions Section
-- ------------------------------------------------------------
/* a. Count of Employees: Find total number of employees */
SELECT COUNT(*) AS TotalEmployees FROM Employee;


-- Output: 10

/* b. Sum of Salaries: Calculate total salary expense */
SELECT SUM(salary) AS TotalSalaryExpense FROM Employee;

-- Output: 588000.00
select floor(12.6);
select ceil(12.6);
/* c. Average Order Amount: Find average order value */
SELECT AVG(TotalAmount) as TotalAmount FROM Orders;

-- Output: 2003.344000

/* d. Max/Min Salary: Find highest and lowest salaries */
SELECT MAX(Salary)as HIghestSalary,MIN(Salary) as LowestSalary FROM Employee;

-- Output: 73000.00,48000.00

-- ------------------------------------------------------------
-- Character Functions Section
-- ------------------------------------------------------------
/* a. Case Conversion: Show names in uppercase and lowercase */
SELECT
	UPPER(FirstName) as UpperName,
    LOWER(FirstName) as LowerName
FROM Employee;

-- Output: 
AMIT	amit
ARJUN	arjun
DIVYA	divya
KARAN	karan
MEERA	meera
NEHA	neha
PRIYA	priya
RAHUL	rahul
SNEHA	sneha
VIKRAM	vikram

/* b. Concatenate Names: Create full names */
SELECT CONCAT(FirstName, ' ',LastName) AS FullName
FROM Employee;

-- Output: 
Amit Sharma
Priya Verma
Rahul Mehta
Sneha Patel
Vikram Singh
Neha Reddy
Karan Joshi
Divya Kapoor
Arjun Nair
Meera Desai

/* c. Extract Substring: Get first 3 characters of first names */
SELECT SUBSTRING(FirstName, 1, 3) as ShortName
FROM Employee;
-- Output: 
Ami
Pri
Rah
Sne
Vik
Neh
Kar
Div
Arj
Mee

-- ------------------------------------------------------------
-- Conversion Functions Section
-- ------------------------------------------------------------
/* Convert String to Date: Convert text to DATE type */
SELECT STR_TO_DATE('2025-09-08', '%Y-%m-%d') AS ConvertedDate;

-- Output: 2025-09-08

-- ------------------------------------------------------------
-- Date Functions Section
-- ------------------------------------------------------------
/* a. Current Date/Time: Get current timestamp */
SELECT NOW() AS CurrentTimestamp;
-- Output: 2025-09-08 12:39:23

/* b. Extract Year: Get year from order dates */
SELECT YEAR(OrderDate) FROM Orders;
-- Output: 2025
2025
2025
2025
2025
2025
2025
2025
2025
2025

/* c. Add Months: Add 3 months to order dates */
SELECT OrderDate, DATE_ADD(OrderDate, INTERVAL 3 MONTH) AS NewOrderDate
FROM orders;



-- Output: 
2025-09-01	2025-12-01
2025-09-02	2025-12-02
2025-09-03	2025-12-03
2025-09-04	2025-12-04
2025-09-05	2025-12-05
2025-09-06	2025-12-06
2025-09-07	2025-12-07
2025-09-08	2025-12-08
2025-09-08	2025-12-08
2025-09-08	2025-12-08

/* d. Days Since Order: Calculate days between order date and now */
SELECT OrderDate, DATEDIFF(CURDATE(), OrderDate) AS DaysSinceOrder
FROM orders;
-- Output: 
2025-09-01	7
2025-09-02	6
2025-09-03	5
2025-09-04	4
2025-09-05	3
2025-09-06	2
2025-09-07	1
2025-09-08	0
2025-09-08	0
2025-09-08	0

-- END of the Task -- 