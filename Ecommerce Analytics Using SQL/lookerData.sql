--SELECT  FROM `bigquery-public-data.thelook_ecommerce.distribution_centers` LIMIT 1000


--Get a Sample of Each Table

SELECT * FROM `bigquery-public-data.thelook_ecommerce.users` LIMIT 10;
SELECT * FROM `bigquery-public-data.thelook_ecommerce.orders` LIMIT 10;
SELECT * FROM `bigquery-public-data.thelook_ecommerce.order_items` LIMIT 10;
SELECT * FROM `bigquery-public-data.thelook_ecommerce.products` LIMIT 10;
SELECT * FROM `bigquery-public-data.thelook_ecommerce.inventory_items` LIMIT 10;
SELECT * FROM `bigquery-public-data.thelook_ecommerce.distribution_centers` LIMIT 10;
SELECT * FROM `bigquery-public-data.thelook_ecommerce.events` LIMIT 10;

--View All Tables in the Dataset

SELECT table_name 
FROM `bigquery-public-data.thelook_ecommerce.INFORMATION_SCHEMA.TABLES`;


--users and traffic source
select traffic_source,count(id) as Number_of_users
from `bigquery-public-data.thelook_ecommerce.users`
group by traffic_source
order by 2 desc

