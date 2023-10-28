 use [Joceline Department store]

SELECT * FROM [Joceline department_store_dataset2]

sp_rename [Joceline department_store_dataset2], Joceline_department_store;

SELECT * FROM Joceline_department_store;

-- Total Revenue per each Year.
SELECT DISTINCT(YEAR (DATE)) AS YEAR, CAST(SUM(Revenue) AS DECIMAL(10)) AS TOTAL_REVENUE_PER_YEAR
FROM Joceline_department_store
GROUP BY YEAR(DATE)
ORDER BY YEAR DESC;

-- AVG Revenue per each Year.
SELECT DISTINCT(YEAR (DATE)) AS YEAR, CAST(SUM(Revenue) as DECIMAL(10, 2)) / (365) AS AVG_REVENUE_PER_YEAR
FROM Joceline_department_store
GROUP BY YEAR(DATE)
ORDER BY YEAR DESC;

-- Total Revenue Goal per each year
SELECT DISTINCT(YEAR (DATE)) AS YEAR, CAST(SUM(Revenue_Goal) AS DECIMAL(10, 2)) AS Total_Revenue_Goal 
FROM Joceline_department_store
GROUP BY YEAR(DATE)
ORDER BY YEAR(DATE) DESC;

-- Avg Total Revenue Goal per each Year
SELECT DISTINCT(YEAR (DATE)) AS YEAR, CAST(SUM(Revenue_Goal) AS DECIMAL(10, 2)) / (365) AS AVG_TOTAL_REVENUE_GOAL
FROM Joceline_department_store
GROUP BY YEAR(DATE)
ORDER BY YEAR(DATE) DESC;


-- TOTAL SALES PER EACH YEAR
SELECT DISTINCT(YEAR(DATE)) AS YEAR, CAST(SUM(Sales_Quantity) AS DECIMAL(10, 2)) AS TOTAL_SALES
FROM Joceline_department_store
GROUP BY YEAR(DATE)
ORDER BY YEAR(DATE) DESC;



-- TOTAL STAFF AND DEPARTMENT CATEGORY
SELECT DISTINCT Seller, Department
FROM Joceline_department_store

SELECT * FROM Joceline_department_store

SELECT DISTINCT (YEAR(DATE)), SUM(sales_Quantity)
from Joceline_department_store
GROUP BY YEAR(DATE)

-- Daily/weekly item_sold
SELECT 
		DISTINCT DATE AS DATE,
		DATENAME(DW, Sales_Quantity) AS Day_week, 
		SUM(Sales_Quantity) AS Item_sold
FROM Joceline_department_store
GROUP BY DATE, DATENAME(DW, Sales_Quantity)		
ORDER BY DATE, DATENAME(DW, Sales_Quantity) DESC


SELECT * FROM Joceline_department_store

SELECT *
FROM Joceline_department_store
WHERE Date > DATEADD(MONTH, 36, GETDATE())

-- Monthly item sold
SELECT 
		DISTINCT DATENAME(MONTH, Sales_Quantity) AS Month_Name,
		Date AS DATE,
		SUM(Sales_Quantity)AS ITEM_SOLD
FROM Joceline_department_store
GROUP BY DATE, DATENAME(MONTH, Sales_Quantity)					
ORDER BY DATE, DATENAME(MONTH, Sales_Quantity) DESC;   


ALTER TABLE Joceline_department_store
ADD Unit_price int;

SET ARITHABORT OFF
SET ANSI_WARNINGS OFF
UPDATE Joceline_department_store
SET Unit_price = Revenue / Sales_Quantity
WHERE Department = 'Electronics'


SET ARITHABORT OFF
SET ANSI_WARNINGS OFF
UPDATE Joceline_department_store
SET Unit_price = Revenue / Sales_Quantity 
WHERE Department = 'Sports'


SET ARITHABORT OFF
SET ANSI_WARNINGS OFF
Update Joceline_department_store
set Unit_price = Revenue / Sales_Quantity
WHERE Department = 'Stationery'


SET ARITHABORT OFF
SET ANSI_WARNINGS OFF
update Joceline_department_store
set Unit_price = Revenue / Sales_Quantity
WHERE Department = 'Toy'


SET ARITHABORT OFF
SET ANSI_WARNINGS OFF
update Joceline_department_store
set Unit_price = Revenue / Sales_Quantity
WHERE Department = 'House'

SET ARITHABORT OFF
SET ANSI_WARNINGS OFF
update Joceline_department_store
set Unit_price = Revenue / Sales_Quantity
Where Department = 'Accessories'


SET ARITHABORT OFF
SET ANSI_WARNINGS OFF
update Joceline_department_store
set Unit_price = Revenue / Sales_Quantity
Where Department = 'Wardrobe'

SELECT * FROM Joceline_department_store


-- Revenue percentage growth
SET ARITHABORT OFF
SET ANSI_WARNINGS OFF
SELECT 
		DISTINCT Date --AS YEAR,
		Seller,
		Department,
		Revenue,
		Revenue - LAG(Revenue) OVER (ORDER BY Date) as revenue_growth,
		Revenue - LAG(Revenue) OVER (ORDER BY Date) / LAG(Revenue) OVER(ORDER BY Date) * 100 as revenue_perccentage_growth
FROM Joceline_department_store

-- CHECK UNIT PRICE OF ITEMS PER DAY, MONTH, YEAR.
SELECT 
		DISTINCT [Department], Date,
		Seller,
		Unit_price
FROM Joceline_department_store
GROUP BY Department, Date
ORDER BY Department, Date DESC


SELECT  
		Date,
		Department,
		Sales_Quantity,
		Unit_price
FROM Joceline_department_store
WHERE Seller = 'Thiago Barbosa'


SELECT  
		Date,
		Department,
		Sales_Quantity,
		Unit_price
FROM Joceline_department_store
WHERE Seller = 'Let icia Nascimento'


SELECT  
		Date,
		Department,
		Sales_Quantity,
		Unit_price
FROM Joceline_department_store
WHERE Seller = 'Ana Sousa'


SELECT  
		Date,
		Department,
		Sales_Quantity,
		Unit_price
FROM Joceline_department_store
WHERE Seller = 'Gustavo Martins'


SELECT  
		Date,
		Department,
		Sales_Quantity,
		Unit_price
FROM Joceline_department_store
WHERE Seller = 'Beatriz Santos'


SELECT  
		Date,
		Department,
		Sales_Quantity,
		Unit_price
FROM Joceline_department_store
WHERE Seller = 'Camila Lima'


SELECT  
		Date,
		Department,
		Sales_Quantity,
		Unit_price
FROM Joceline_department_store
WHERE Seller = 'Enzo Nascimento'


SELECT  
		Date,
		Department,
		Sales_Quantity,
		Unit_price
FROM Joceline_department_store
WHERE Seller = 'Guilheme Santos'


SELECT  
		Date,
		Department,
		Sales_Quantity,
		Unit_price
FROM Joceline_department_store
WHERE Seller = 'Vitoria Ribeiro'


SELECT  
		Date,
		Department,
		Sales_Quantity,
		Unit_price
FROM Joceline_department_store
WHERE Seller = 'Julia Araujo'




--(Revenue - LAG(Revenue) OVER (ORDER BY YEAR(Date))) / LAG (Revenue) OVER(ORDER BY YEAR(Date)) * 100 AS REVENUE_PERCENTAGE_GROWTH
