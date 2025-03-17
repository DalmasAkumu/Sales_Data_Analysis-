-- Create database named Clipboard 
CREATE DATABASE Clipboard;

-- Use the database
USE Clipboard;

-- Create table called Sales 
CREATE TABLE IF NOT EXISTS sales(
sales_id INT AUTO_INCREMENT PRIMARY KEY, 
customer_id INT NOT NULL, 
product_id INT NOT NULL, 
sale_date DATE NOT NULL, 
quantity INT NOT NULL, 
total_amount DECIMAL (10, 2) NOT NULL
);

-- Create table called Customers 
CREATE TABLE IF NOT EXISTS customers(
customer_id INT AUTO_INCREMENT PRIMARY KEY, 
customer_name VARCHAR (100) NOT NULL, 
sales_region VARCHAR (50) NOT NULL, 
sign_up_date DATE NOT NULL
);

-- Create table called Products
CREATE TABLE IF NOT EXISTS products(
product_id INT AUTO_INCREMENT PRIMARY KEY, 
product_name VARCHAR (50) NOT NULL, 
category VARCHAR (50) NOT NULL, 
price DECIMAL (10, 2) NOT NULL
);

-- Question One 
SELECT 
    c.customer_name,
    p.product_name,
    s.total_amount
FROM Clipboard.sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
WHERE s.sale_date >= NOW() - INTERVAL 30 DAY
ORDER BY s.sale_date DESC;

-- Question Two 
SELECT 
    p.category AS product_category,
    SUM(s.total_amount) AS total_revenue 
FROM Clipboard.sales s
JOIN Clipboard.products p ON s.product_id = p.product_id
WHERE s.sale_date >= NOW() - INTERVAL 1 YEAR
GROUP BY p.category
ORDER BY total_revenue DESC;

-- Question Three 
SELECT DISTINCT c.customer_id, c.customer_name, sales_region
FROM Clipboard.customers c
JOIN Clipboard.sales s ON c.customer_id = s.customer_id
WHERE YEAR(s.sale_date) = 2023 AND sales_region = 'West';

-- Question Four 
SELECT c.customer_id, c.customer_name,
    COUNT(s.sales_id) AS total_sales,
    SUM(s.quantity) AS total_quantity_sold,
    SUM(s.total_amount) AS total_revenue
FROM Clipboard.customers c
JOIN Clipboard.sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_revenue DESC;

-- Question Five 
SELECT c.customer_id, c.customer_name,
	SUM(s.total_amount) AS total_revenue
FROM Clipboard.customers c
JOIN Clipboard.sales s ON c.customer_id = s.customer_id
WHERE 
    YEAR(s.sale_date) = 2023
GROUP BY c.customer_id, c.customer_name
ORDER BY total_revenue DESC
LIMIT 3;

-- Question Six 
SELECT p.product_id, p.product_name,
    SUM(s.quantity) AS total_quantity_sold,
    RANK() OVER (ORDER BY SUM(s.quantity) DESC) AS sales_rank
FROM Clipboard.products p
JOIN Clipboard.sales s ON p.product_id = s.product_id
WHERE 
    YEAR(s.sale_date) = 2023
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_sold DESC;

-- Question Seven 
SELECT customer_id, customer_name, sign_up_date,
    CASE 
        WHEN sign_up_date >= NOW() - INTERVAL 6 MONTH THEN 'New'
        ELSE 'Existing'
    END AS customer_category
FROM 
    Clipboard.customers;
    
-- Question Eight 
SELECT 
    DATE_FORMAT(s.sale_date, '%Y-%m') AS month_year,
    SUM(s.total_amount) AS total_revenue
FROM Clipboard.sales s
WHERE s.sale_date >= NOW() - INTERVAL 12 MONTH
GROUP BY DATE_FORMAT(s.sale_date, '%Y-%m')
ORDER BY month_year;

-- Question Nine 
SELECT 
    p.category AS product_category,
	SUM(s.total_amount) AS total_revenue
FROM Clipboard.sales s
JOIN Clipboard.products p ON s.product_id = p.product_id
WHERE s.sale_date >= NOW() - INTERVAL 6 MONTH
GROUP BY p.category
HAVING total_revenue > 50000
ORDER BY total_revenue DESC;

-- Question Ten 
SELECT 
    s.sales_id,
    c.customer_name,
    p.product_name,
    s.quantity,
    p.price,
    s.total_amount,
    (s.quantity * p.price) AS expected_amount
FROM Clipboard.sales s
JOIN Clipboard.products p ON s.product_id = p.product_id
JOIN Clipboard.customers c ON s.customer_id = c.customer_id
WHERE s.total_amount <> (s.quantity * p.price);