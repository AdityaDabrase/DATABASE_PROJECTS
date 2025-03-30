-- 1️⃣ **Customer Insights**  
-- Who are the top customers based on lifetime revenue?
SELECT 
    u.user_id, 
    u.name, 
    SUM(o.sale_price) AS lifetime_revenue
FROM 
    `bigquery-public-data.thelook_ecommerce.users` u
JOIN 
    `bigquery-public-data.thelook_ecommerce.orders` o
    ON u.user_id = o.user_id
GROUP BY 
    u.user_id, u.name
ORDER BY 
    lifetime_revenue DESC
LIMIT 10;

-- What are the characteristics of new vs. returning users?
SELECT 
    CASE 
        WHEN EXTRACT(YEAR FROM o.order_date) = EXTRACT(YEAR FROM CURRENT_DATE()) THEN 'New'
        ELSE 'Returning'
    END AS user_type,
    COUNT(DISTINCT u.user_id) AS user_count
FROM 
    `bigquery-public-data.thelook_ecommerce.users` u
JOIN 
    `bigquery-public-data.thelook_ecommerce.orders` o
    ON u.user_id = o.user_id
GROUP BY 
    user_type;

-- 2️⃣ **Sales Trends and Revenue Analysis**  
-- What are the revenue trends by month and year?
SELECT 
    EXTRACT(YEAR FROM o.order_date) AS year,
    EXTRACT(MONTH FROM o.order_date) AS month,
    SUM(o.sale_price) AS total_revenue
FROM 
    `bigquery-public-data.thelook_ecommerce.orders` o
GROUP BY 
    year, month
ORDER BY 
    year DESC, month DESC;

-- What are the top-selling products?
SELECT 
    p.product_id, 
    p.product_name, 
    COUNT(o.order_id) AS total_sales
FROM 
    `bigquery-public-data.thelook_ecommerce.products` p
JOIN 
    `bigquery-public-data.thelook_ecommerce.orders` o
    ON p.product_id = o.product_id
GROUP BY 
    p.product_id, p.product_name
ORDER BY 
    total_sales DESC
LIMIT 10;

-- How do seasonal factors affect sales?
SELECT 
    EXTRACT(MONTH FROM o.order_date) AS month,
    SUM(o.sale_price) AS total_sales
FROM 
    `bigquery-public-data.thelook_ecommerce.orders` o
GROUP BY 
    month
ORDER BY 
    month;

-- 3️⃣ **Marketing and Conversion Analysis**  
-- Which traffic sources bring in the most revenue?
SELECT 
    m.source, 
    SUM(o.sale_price) AS total_revenue
FROM 
    `bigquery-public-data.thelook_ecommerce.orders` o
JOIN 
    `bigquery-public-data.thelook_ecommerce.marketing_campaigns` m
    ON o.campaign_id = m.campaign_id
GROUP BY 
    m.source
ORDER BY 
    total_revenue DESC;

-- How does offering discounts impact conversion rates?
SELECT 
    CASE 
        WHEN o.discount > 0 THEN 'Discounted'
        ELSE 'Full Price'
    END AS pricing_type,
    COUNT(o.order_id) AS total_orders,
    SUM(o.sale_price) AS total_revenue
FROM 
    `bigquery-public-data.thelook_ecommerce.orders` o
GROUP BY 
    pricing_type;

-- 4️⃣ **Operational Efficiency and Product Management**  
-- What is the average fulfillment time for orders?
SELECT 
    AVG(TIMESTAMP_DIFF(o.fulfillment_date, o.order_date, DAY)) AS avg_fulfillment_time
FROM 
    `bigquery-public-data.thelook_ecommerce.orders` o
WHERE 
    o.fulfillment_date IS NOT NULL;

-- How often do certain products run out of stock?
SELECT 
    p.product_id,
    p.product_name,
    COUNT(i.inventory_id) AS out_of_stock_occurrences
FROM 
    `bigquery-public-data.thelook_ecommerce.products` p
JOIN 
    `bigquery-public-data.thelook_ecommerce.inventory_items` i
    ON p.product_id = i.product_id
WHERE 
    i.stock_level = 0
GROUP BY 
    p.product_id, p.product_name
ORDER BY 
    out_of_stock_occurrences DESC
LIMIT 10;

-- 5️⃣ **Risk and Refund Management**  
-- Which users have the highest refund rates?
SELECT 
    u.user_id, 
    u.name, 
    COUNT(r.refund_id) AS total_refunds,
    COUNT(o.order_id) AS total_orders,
    (COUNT(r.refund_id) / COUNT(o.order_id)) AS refund_rate
FROM 
    `bigquery-public-data.thelook_ecommerce.users` u
JOIN 
    `bigquery-public-data.thelook_ecommerce.orders` o
    ON u.user_id = o.user_id
LEFT JOIN 
    `bigquery-public-data.thelook_ecommerce.refunds` r
    ON o.order_id = r.order_id
GROUP BY 
    u.user_id, u.name
HAVING 
    refund_rate > 0.1  -- Adjust threshold as needed
ORDER BY 
    refund_rate DESC
LIMIT 10;

-- How can we detect high-risk transactions?
SELECT 
    o.order_id,
    o.user_id,
    o.sale_price,
    o.order_date,
    CASE 
        WHEN o.sale_price > 1000 THEN 'High Risk' 
        ELSE 'Normal'
    END AS risk_level
FROM 
    `bigquery-public-data.thelook_ecommerce.orders` o
ORDER BY 
    risk_level DESC;
