# ☕ Coffee Sales Data Analysis (SQL Project)

## 📌 Project Overview

This project analyzes a **Coffee Sales dataset** using SQL to extract business insights related to customers, orders, and products. The goal of this analysis is to practice **real-world SQL queries used by Data Analysts** and answer business questions using structured data.

The analysis includes **data exploration, aggregation, joins, window functions, and trend analysis**.

---

# 📂 Dataset Tables

The project uses three main tables:

### 1. Customers

Contains customer information such as:

* Customer_ID
* Customer_Name
* Country

### 2. Orders

Contains order-related information:

* Order_ID
* Customer_ID
* Product_ID
* Order_Date

### 3. Products

Contains product details:

* Product_ID
* Coffee_Type
* Unit_Price
* Profit

---

# 🧠 SQL Concepts Used

## 1. Aggregate Functions

Used to perform calculations on multiple rows and return a single value.

* COUNT()
* SUM()
* AVG()
* MAX()

---

## 2. Date Functions

Used to extract or format date values.

* EXTRACT()
* FORMAT_DATE()

---

## 3. Mathematical Functions

Used for numeric calculations and rounding values.

* ROUND()

---

## 4. String Functions

Used to manipulate or combine text values.

* CONCAT()

---

## 5. Window Functions

Used to perform calculations across rows without grouping them.

* ROW_NUMBER()
* RANK()
* LAG()
* SUM() OVER()

---

## 6. Filtering Clauses

* WHERE
* HAVING
* QUALIFY
* BETWEEN

---

## 7. Join Operations

* INNER JOIN

Used to combine data from multiple tables such as **customers, orders, and products**.

---

## 8. Query Structuring

* WITH (Common Table Expression – CTE)

Used to simplify complex SQL queries.

---

## 9. Sorting and Limiting

* ORDER BY
* LIMIT
* OFFSET

---

## 10. Set Operations

* DISTINCT

Used to remove duplicate values.

---

# 📊 Business Questions Solved

A total of **29 analytical SQL questions** were solved in this project.

1. Retrieve all records from the customers table
2. Display Customer Name and Country
3. Find all orders placed in 2021
4. Find total number of orders placed in 2021
5. Find year-wise total number of orders
6. Get unique coffee types
7. Find total number of customers
8. Find average unit price of products
9. Show total number of orders per customer
10. Find top 5 most expensive products
11. Find the 5th highest price product
12. Get customer name and their orders
13. Find product details for each order
14. Get customer name, product type, and order date
15. Find total sales per coffee type
16. Find total orders per country
17. Find top 3 customers with highest orders
18. Find customers who never placed an order
19. Find the most profitable product
20. Find top 5 customers by total profit
21. Monthly sales trend with percentage change
22. Find most popular coffee type
23. Customer lifetime value
24. Customers who purchased more than 3 products
25. Rank products by profit
26. Find repeat customers
27. Find country with highest sales
28. Running total sales
29. Most profitable coffee type per country

---

# 📈 Key Insights

* Identified the **most profitable coffee products**
* Found **top customers based on total profit**
* Analyzed **monthly sales trends and growth percentage**
* Calculated **customer lifetime value**
* Identified **repeat customers and high-value customers**
* Ranked products based on profitability

---

# 🛠 Tools Used

* SQL
* BigQuery
* Data Analysis Techniques

---

⭐ If you found this project helpful, feel free to **star the repository**!
