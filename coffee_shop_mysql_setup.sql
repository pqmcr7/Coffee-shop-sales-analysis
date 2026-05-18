CREATE DATABASE IF NOT EXISTS coffee_shop_project;
USE coffee_shop_project;

DROP TABLE IF EXISTS coffee_sales;
CREATE TABLE coffee_sales (
    transaction_id INT,
    transaction_date DATE,
    transaction_time TIME,
    transaction_qty INT,
    store_id INT,
    store_location VARCHAR(100),
    product_id INT,
    unit_price DECIMAL(10,2),
    product_category VARCHAR(100),
    product_type VARCHAR(100),
    product_detail VARCHAR(255),
    Revenue DECIMAL(10,2),
    Month INT,
    Day_Name VARCHAR(20),
    Hour INT
);

-- After importing the CSV, check:
-- SELECT COUNT(*) AS total_rows FROM coffee_sales;
-- Expected result: 149116
