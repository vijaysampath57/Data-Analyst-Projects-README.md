# SQL Data Analysis & Business Intelligence Project

## 📌 Project Overview
This repository contains an end-to-end data analysis project executed using SQL. The objective is to extract, clean, transform, and analyze relational data to uncover actionable business insights regarding sales performance, customer behavior, and operational trends.

---

## 🎯 Business Problems & Questions Answered
- **Revenue Performance:** What are the top-performing product categories, stores, and regions by total revenue and profit margin?
- **Customer Segmentation:** Who are the high-value customers (RFM/repeat buyers), and what is the customer retention rate?
- **Trend Analysis:** What are the month-over-month (MoM) and year-over-year (YoY) revenue growth rates?
- **Operational Efficiency:** What are the average fulfillment times, order volumes, and return rates across delivery channels?

---

## 🗄️ Database Schema & Data Architecture
The relational database follows a normalized schema (or Star Schema) containing the following core tables:

- **`fact_sales` / `orders`**: Transactional records containing `order_id`, `customer_id`, `product_id`, `order_date`, `quantity`, and `total_amount`.
- **`dim_customers`**: Demographics and customer profile data (`customer_id`, `city`, `signup_date`).
- **`dim_products`**: Product hierarchy (`product_id`, `product_name`, `category`, `unit_cost`, `unit_price`).
- **`dim_stores` / `dim_dates`**: Geographic and calendar dimension tables.

---

## 🛠️ SQL Techniques & Concepts Applied
- **Data Definition & Manipulation:** `CREATE TABLE`, `ALTER TABLE`, primary/foreign keys, `INSERT`, `UPDATE`.
- **Data Cleaning & Handling Nulls:** `COALESCE`, `NULLIF`, `CASE WHEN`, `TRIM`, `LOWER`/`UPPER`, date conversions (`STR_TO_DATE`, `DATE_FORMAT`).
- **Relational Joins:** `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, self-joins.
- **Aggregations & Filtering:** `GROUP BY`, `HAVING`, multi-condition filtering with `WHERE`.
- **Advanced Analytics:**
  - **Window Functions:** `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, `LEAD()`, `LAG()`, running totals via `SUM() OVER(PARTITION BY ...)`.
  - **Modular Queries:** Common Table Expressions (CTEs - `WITH ... AS`) and Subqueries for readable, maintainable logic.
  - **Performance Optimization:** Indexing on foreign keys and date columns.

---

## 📁 Repository Structure
```text
├── data/
│   └── raw_data.csv               # Raw source datasets
├── scripts/
│   ├── 01_schema_setup.sql        # Table definitions, constraints, and indexes
│   ├──
