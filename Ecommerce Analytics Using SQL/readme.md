
# 📊 Looker E-Commerce Data Analysis (BigQuery)

> **Analyzing user behavior, sales trends, and business insights using Google BigQuery's public dataset.**

## Project Overview  
This project uses the **Looker E-Commerce Dataset** available in BigQuery to uncover insights into customer behavior, sales trends, and operational efficiency for an e-commerce business. The analysis helps answer critical business questions and guides data-driven decisions.

---

## 📂 Dataset Used  
📌 **BigQuery Public Dataset:** `bigquery-public-data.thelook_ecommerce`  
 **Tables Included:**  
- `users` → Customer details (ID, name, gender, location)  
- `products` → Product catalog (category, brand, price)  
- `orders` → Purchase records (order_id, customer_id, sale_price)  
- `inventory_items` → Product stock levels  
- `distribution_centers` → Warehouse locations for shipping  

---

## 🔍 Business Questions Addressed  

### 1️**Customer Insights**  
**Business Question:**  
- **Who are the top customers based on lifetime revenue?**  
- **What are the characteristics of new vs. returning users?**  

**SQL Concepts:**  
- **Aggregation (`COUNT`, `SUM`, `AVG`)**  
- **Filtering (`WHERE`)**  
- **Date functions (`EXTRACT`, `DATE_DIFF`)**  

### 2️**Sales Trends and Revenue Analysis**  
**Business Question:**  
- **What are the revenue trends by month and year?**  
- **What are the top-selling products?**  
- **How do seasonal factors affect sales?**  

**SQL Concepts:**  
- **Group By (`GROUP BY`)**  
- **Date functions (`EXTRACT`, `TIMESTAMP_DIFF`)**  
- **Joins (`JOIN`)**  

### 3️**Marketing and Conversion Analysis**  
**Business Question:**  
- **Which traffic sources bring in the most revenue?**  
- **How does offering discounts impact conversion rates?**  

**SQL Concepts:**  
- **Aggregation and Grouping**  
- **Conditional Aggregation (`CASE WHEN`)**  
- **Subqueries**  

### 4 **Operational Efficiency and Product Management**  
**Business Question:**  
- **What is the average fulfillment time for orders?**  
- **How often do certain products run out of stock?**  

**SQL Concepts:**  
- **Window Functions (`OVER()`)**  
- **Join and Filter combinations**  
- **CASE Statements for conditional logic**  

### 5️**Risk and Refund Management**  
**Business Question:**  
- **Which users have the highest refund rates?**  
- **How can we detect high-risk transactions?**  

**SQL Concepts:**  
- **Aggregations with `HAVING`**  
- **String manipulation and regular expressions**  
- **Complex `WHERE` clauses**

---

## 🛠️ Tools & Technologies  
- **Google BigQuery** for SQL-based data analysis  
- **Looker Studio** (Google Data Studio) for dashboard visualization and reporting  
- **SQL** for querying large datasets, performing complex joins, aggregations, and window functions

---

## 📈 Key Insights from Analysis  
- **Sales Trends:** Identified peak sales periods in Q4 and seasonal dips in Q1.  
- **Customer Behavior:** Returned customers generate a significant portion of revenue.  
- **Marketing Impact:** Social media channels bring in the highest conversions.  
- **Inventory Efficiency:** Certain high-demand products frequently run out of stock.  
- **Refunds:** A small percentage of customers exhibit a high refund rate, potentially a risk factor.

---

## 🧑‍💻 Future Enhancements  
- **Looker Studio Dashboards**: Build interactive dashboards for dynamic reporting.  
- **Customer Churn Analysis**: Predict customers likely to stop purchasing based on past behavior.  
- **Product Recommendations**: Use machine learning models to recommend products based on user behavior.

---

## 👨‍💻 Author  
**[Aditya Dabrase]** – Data Analyst | SQL | BigQuery | Looker  
📧 Email: dabrase.a@gmail.com
🔗 [LinkedIn](https://www.linkedin.com/in/adityadabrase/) | [GitHub](https://github.com/AdityaDabrase)  
