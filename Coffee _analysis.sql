SELECT * FROM `project-1-473206.Coffee_analisys.customers` LIMIT 5
SELECT * FROM `project-1-473206.Coffee_analisys.orders` LIMIT 5
SELECT * FROM `project-1-473206.Coffee_analisys.products` LIMIT 5

-- Retrieve all records from the customers table.
SELECT * from `project-1-473206.Coffee_analisys.Customers`

-- Display Customer Name and Country from the customers table.
SELECT customer_name, Country from `project-1-473206.Coffee_analisys.customers`

-- Find all orders placed in 2021.
SELECT *
FROM `project-1-473206.Coffee_analisys.orders`
WHERE EXTRACT(YEAR FROM order_Date) = 2021;

SELECT *
FROM `project-1-473206.Coffee_analisys.orders`
WHERE order_Date BETWEEN '2021-01-01' AND '2021-12-31';

-- Find total number of orders placed in 2021.
select count(*) 
        from `project-1-473206.Coffee_analisys.orders`
where extract(year from order_date) = 2021

-- Find Year wise total number of orders placed.
SELECT EXTRACT(YEAR FROM order_date) AS order_year,
       COUNT(*) AS total_orders
FROM `project-1-473206.Coffee_analisys.orders`
GROUP BY order_year
ORDER BY order_year;

-- Get the unique coffee types
select distinct(coffee_type) as unique_coffee
from `project-1-473206.Coffee_analisys.products`

-- Find the total number of customers.
select count(*) as total_customer from `project-1-473206.Coffee_analisys.customers`

-- Find the average unit price of products.
select round(avg(Unit_Price),2) as avg_price from `project-1-473206.Coffee_analisys.products`

-- Show the total number of orders per customer.
select customer_id, count(*) as total_order from `project-1-473206.Coffee_analisys.orders`
group by Customer_id
order by total_order desc

-- Find top 5 most expensive products.
select Product_ID, (Unit_Price) from `project-1-473206.Coffee_analisys.products`
order by Unit_Price desc
limit 5

SELECT Product_ID, Unit_Price
FROM `project-1-473206.Coffee_analisys.products`
QUALIFY ROW_NUMBER() OVER (ORDER BY Unit_Price DESC) <= 5;

-- Find the 5th highest price product.
SELECT Product_ID, Unit_Price
FROM `project-1-473206.Coffee_analisys.products`
ORDER BY Unit_Price DESC
LIMIT 1 OFFSET 4;

-- Get customer name and their orders.
SELECT c.Customer_name, o.Order_ID
FROM `project-1-473206.Coffee_analisys.customers` AS c
JOIN `project-1-473206.Coffee_analisys.orders` AS o
ON c.Customer_ID = o.Customer_ID
order by c.Customer_id;

-- Find product details for each order.
select o.order_id, p.product_id, p.Unit_Price
from `project-1-473206.Coffee_analisys.orders` as o 
join `project-1-473206.Coffee_analisys.products` as p
on o.Product_ID = p.Product_ID

-- Get customer name, product type, and order date.
select c.Customer_name, o.Order_Date, p.Coffee_Type from `project-1-473206.Coffee_analisys.customers` as c    
join `project-1-473206.Coffee_analisys.orders` o   
on c.Customer_id = o.Customer_ID
join `project-1-473206.Coffee_analisys.products` as p    
on p.Product_ID = o.Product_ID

-- Find total sales per coffee type.
select Coffee_Type, round(sum(Unit_Price),2) from `project-1-473206.Coffee_analisys.products`
group by Coffee_Type

-- Find total orders per country.
select c.Country, count(o.Order_ID) as total_order from `project-1-473206.Coffee_analisys.customers` as c   
join `project-1-473206.Coffee_analisys.orders` as o    
on c.Customer_id = o.Customer_ID
group by c.Country

-- Find the top 3 customers with the highest number of orders.
select c.Customer_name, count(o.Order_ID) as total_order from `project-1-473206.Coffee_analisys.customers` as c   
join `project-1-473206.Coffee_analisys.orders` as o   
on c.Customer_id = o.Customer_ID
group by c.Customer_name
order by total_order desc
limit 3

-- Find customers who never placed an order.
select c.Customer_name from `project-1-473206.Coffee_analisys.customers` as c   
join `project-1-473206.Coffee_analisys.orders` as o   
on c.Customer_id = o.Customer_ID
where o.Order_ID is null

-- Find the most profitable product.
SELECT Product_ID,
MAX(Profit) AS Max_Profit
FROM `project-1-473206.Coffee_analisys.products`
GROUP BY Product_ID
ORDER BY Max_Profit DESC
limit 1;

SELECT Product_ID, Profit
FROM `project-1-473206.Coffee_analisys.products`
ORDER BY Profit desc
limit 1;

SELECT Product_ID,
SUM(Profit) AS Total_Profit
FROM `project-1-473206.Coffee_analisys.products`
GROUP BY Product_ID
ORDER BY Total_Profit desc
limit 1;

-- Find Top 5 Customers by Total Profit
select c.Customer_ID, c.Customer_name, round(sum(p.Profit),2) as total_profit  from `project-1-473206.Coffee_analisys.customers` as c   
join `project-1-473206.Coffee_analisys.orders` as o   
on c.Customer_id = o.Customer_ID
join `project-1-473206.Coffee_analisys.products` as p    
on o.Product_ID = p.Product_ID 
group by Customer_id, c.Customer_name
order by total_profit desc
limit 5

-- Monthly Sales Trend
WITH monthly_sales AS (
SELECT
FORMAT_DATE('%Y-%b', o.Order_Date) AS Month,
ROUND(SUM(p.Unit_Price),2) AS Total_Sales
FROM `project-1-473206.Coffee_analisys.orders` o
JOIN `project-1-473206.Coffee_analisys.products` p
ON o.Product_ID = p.Product_ID
GROUP BY Month
)

SELECT
Month,
Total_Sales,
CONCAT(
ROUND(
((Total_Sales - LAG(Total_Sales) OVER (ORDER BY Month)) /
LAG(Total_Sales) OVER (ORDER BY Month)) * 100,2
),'%'
) AS Percent_Change
FROM monthly_sales
ORDER BY Month;

-- Find the Most Popular Coffee Type
SELECT
p.Coffee_Type,
COUNT(o.Order_ID) AS Total_Orders
FROM `project-1-473206.Coffee_analisys.orders` o
JOIN `project-1-473206.Coffee_analisys.products` p
ON o.Product_ID = p.Product_ID
GROUP BY p.Coffee_Type
ORDER BY Total_Orders DESC
LIMIT 1;

-- Customer Lifetime Value
SELECT
c.Customer_Name,
round(SUM(p.Unit_Price),2) AS Lifetime_Value
FROM `project-1-473206.Coffee_analisys.orders` o
JOIN `project-1-473206.Coffee_analisys.customers` c
ON o.Customer_ID = c.Customer_ID
JOIN `project-1-473206.Coffee_analisys.products` p
ON o.Product_ID = p.Product_ID
GROUP BY c.Customer_Name
ORDER BY Lifetime_Value DESC;

-- Find Customers Who Purchased More Than 3 Products
SELECT
Customer_ID,
COUNT(Product_ID) AS Total_Products
FROM `project-1-473206.Coffee_analisys.orders`
GROUP BY Customer_ID
HAVING COUNT(Product_ID) > 3;

-- Rank Products by Profit
select Product_ID,
SUM(Profit) AS Total_Profit,
RANK() OVER(ORDER BY SUM(Profit) DESC) AS Profit_Rank
FROM `project-1-473206.Coffee_analisys.products`
GROUP BY Product_ID;

-- Find Repeat Customers
SELECT
Customer_ID,
COUNT(Order_ID) AS Order_Count
FROM `project-1-473206.Coffee_analisys.orders`
GROUP BY Customer_ID
HAVING COUNT(Order_ID) > 1;

-- Find Country with Highest Sales
SELECT
c.Country,
round(SUM(p.Unit_Price),2) AS Total_Sales
FROM `project-1-473206.Coffee_analisys.orders` o
JOIN `project-1-473206.Coffee_analisys.customers` c
ON o.Customer_ID = c.Customer_ID
JOIN `project-1-473206.Coffee_analisys.products` p
ON o.Product_ID = p.Product_ID
GROUP BY c.Country
ORDER BY Total_Sales DESC
LIMIT 1;

-- Running Total Sales (Window Function)
SELECT
Order_Date,
round(SUM(p.Unit_Price),2) AS Daily_Sales,
round(SUM(SUM(p.Unit_Price)) OVER(ORDER BY Order_Date),2) AS Running_Total
FROM `project-1-473206.Coffee_analisys.orders` o
JOIN `project-1-473206.Coffee_analisys.products` p
ON o.Product_ID = p.Product_ID
GROUP BY Order_Date
ORDER BY Order_Date;

-- Find the Most Profitable Coffee Type per Country
SELECT
c.Country,
p.Coffee_Type,
ROUND(SUM(p.Profit),2) AS Total_Profit
FROM `project-1-473206.Coffee_analisys.orders` o
JOIN `project-1-473206.Coffee_analisys.customers` c
ON o.Customer_ID = c.Customer_ID
JOIN `project-1-473206.Coffee_analisys.products` p
ON o.Product_ID = p.Product_ID
GROUP BY c.Country, p.Coffee_Type
QUALIFY ROW_NUMBER() OVER (
PARTITION BY c.Country
ORDER BY SUM(p.Profit) DESC
) = 1
ORDER BY Total_Profit DESC;
