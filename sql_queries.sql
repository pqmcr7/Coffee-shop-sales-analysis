USE coffee_shop_project;

-- 1. Check total rows
SELECT COUNT(*) AS total_rows
FROM coffee_sales;

-- 2. KPI summary
SELECT 
    COUNT(DISTINCT transaction_id) AS total_transactions,
    SUM(transaction_qty) AS total_quantity_sold,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    ROUND(SUM(Revenue) / COUNT(DISTINCT transaction_id), 2) AS average_order_value
FROM coffee_sales;

-- 3. Monthly revenue
SELECT 
    MONTH(transaction_date) AS month_number,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    COUNT(DISTINCT transaction_id) AS total_transactions,
    SUM(transaction_qty) AS total_quantity_sold
FROM coffee_sales
GROUP BY MONTH(transaction_date)
ORDER BY month_number;

-- 4. Store performance
SELECT 
    store_location,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    COUNT(DISTINCT transaction_id) AS total_transactions,
    SUM(transaction_qty) AS total_quantity_sold
FROM coffee_sales
GROUP BY store_location
ORDER BY total_revenue DESC;

-- 5. Product category performance
SELECT 
    product_category,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    SUM(transaction_qty) AS total_quantity_sold
FROM coffee_sales
GROUP BY product_category
ORDER BY total_revenue DESC;

-- 6. Top 10 products by revenue
SELECT 
    product_detail,
    product_category,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    SUM(transaction_qty) AS total_quantity_sold
FROM coffee_sales
GROUP BY product_detail, product_category
ORDER BY total_revenue DESC
LIMIT 10;

-- 7. Top 10 products by quantity sold
SELECT 
    product_detail,
    product_category,
    SUM(transaction_qty) AS total_quantity_sold,
    ROUND(SUM(Revenue), 2) AS total_revenue
FROM coffee_sales
GROUP BY product_detail, product_category
ORDER BY total_quantity_sold DESC
LIMIT 10;

-- 8. Revenue by hour
SELECT 
    Hour,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    COUNT(DISTINCT transaction_id) AS total_transactions,
    SUM(transaction_qty) AS total_quantity_sold
FROM coffee_sales
GROUP BY Hour
ORDER BY Hour;

-- 9. Revenue by day of week
SELECT 
    Day_Name,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    COUNT(DISTINCT transaction_id) AS total_transactions,
    SUM(transaction_qty) AS total_quantity_sold
FROM coffee_sales
GROUP BY Day_Name
ORDER BY total_revenue DESC;

-- 10. Revenue by product type
SELECT 
    product_type,
    product_category,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    SUM(transaction_qty) AS total_quantity_sold
FROM coffee_sales
GROUP BY product_type, product_category
ORDER BY total_revenue DESC;
