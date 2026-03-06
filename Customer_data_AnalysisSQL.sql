USE project_customer_segmentation;
SHOW TABLES;

SELECT * FROM customer LIMIT 100;

#Checking null values there or not
SELECT
    SUM(CASE WHEN invoice_no IS NULL THEN 1 ELSE 0 END) AS invoice_no_nulls,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS customer_id_nulls,
    SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS gender_nulls,
    SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS age_nulls,
    SUM(CASE WHEN category IS NULL THEN 1 ELSE 0 END) AS category_nulls,
    SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) AS quantity_nulls,
    SUM(CASE WHEN price IS NULL THEN 1 ELSE 0 END) AS price_nulls,
    SUM(CASE WHEN payment_method IS NULL THEN 1 ELSE 0 END) AS payment_method_nulls,
    SUM(CASE WHEN invoice_date IS NULL THEN 1 ELSE 0 END) AS invoice_date_nulls,
    SUM(CASE WHEN shopping_mall IS NULL THEN 1 ELSE 0 END) AS shopping_mall_nulls
FROM customer;

#Toatl Customers 
SELECT COUNT(*) AS total_rows FROM customer;

#Total Revenue
SELECT SUM(quantity * price) AS total_revenue FROM customer;


#1 Shopping distribution according to gender
SELECT 
    gender,
    COUNT(*) AS total_transactions
FROM customer
GROUP BY gender;

#2 Which gender did we sell more products to?
SELECT 
    gender,
    SUM(quantity) AS total_products_sold
FROM customer
GROUP BY gender
ORDER BY total_products_sold DESC;

#3 Which gender generated more revenue?
SELECT 
    gender,
    SUM(quantity * price) AS total_revenue
FROM customer
GROUP BY gender
ORDER BY total_revenue DESC;

#4️ Distribution of purchase categories relative to other columns (Gender vs Category)
SELECT 
    category,
    gender,
    SUM(quantity * price) AS total_revenue,
    sum(quantity) As total_quantity
FROM customer
GROUP BY category, gender
ORDER BY total_revenue DESC;

#5 Shopping distribution according to age
SELECT
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 55 THEN '46-55'
        When age BETWEEN 56 AND 65 THEN '56-65'
        ELSE '65+'
    END AS age_group,
    count(quantity) AS Total_Transation
FROM customer
GROUP BY age_group
ORDER BY Total_Transation desc;

#6 Which age category did we sell more products to?
SELECT
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 55 THEN '46-55'
        When age BETWEEN 56 AND 65 THEN '56-65'
        ELSE '65+'
    END AS age_group,
    SUM(quantity) AS total_products_sold
FROM customer
GROUP BY age_group
ORDER BY total_products_sold desc limit 1;

#7 Which age category generated more revenue?
SELECT
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 55 THEN '46-55'
        When age BETWEEN 56 AND 65 THEN '56-65'
        ELSE '65+'
    END AS age_group,
    SUM(quantity * price) AS total_revenue
FROM customer
GROUP BY age_group
ORDER BY total_revenue DESC limit 1;

#8 Distribution of purchase categories relative to Age
SELECT
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 55 THEN '46-55'
        When age BETWEEN 56 AND 65 THEN '56-65'
        ELSE '65+'
    END AS age_group,
    category,
    SUM(quantity * price) AS revenue
FROM customer
GROUP BY age_group, category
ORDER BY revenue DESC;

#9 Does payment method have relation with other columns (Gender + Payment)
SELECT
    payment_method,
    gender,category,
    SUM(quantity * price) AS Total_revenue
FROM customer
GROUP BY payment_method,gender,category
ORDER BY Total_revenue DESC;

#10 Distribution of payment method
SELECT
    payment_method,
    COUNT(invoice_no) AS total_transactions,
    SUM(quantity * price) AS total_revenue
FROM customer
GROUP BY payment_method
ORDER BY total_transactions DESC;












