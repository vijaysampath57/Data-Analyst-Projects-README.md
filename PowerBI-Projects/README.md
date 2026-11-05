# 📊 Business Intelligence & Performance Dashboard (Power BI)

## 📌 Project Overview
This repository contains an end-to-end Business Intelligence solution built using **Microsoft Power BI**. The project transforms raw transactional data into actionable executive insights through robust Power Query ETL processes, a normalized Star Schema data model, advanced DAX measures, and an interactive multi-page dashboard.

---

## 🎯 Business Objectives & Key Questions
- **Executive Summary:** What are the current Total Revenue, Total Profit, Gross Margin %, and Year-over-Year (YoY) growth trends?
- **Product & Category Analysis:** Which product lines and categories deliver the highest profit margins versus sales volume?
- **Regional & Customer Insights:** What is the geographic distribution of orders across territories and customer segments?
- **Time Intelligence:** How do current monthly numbers compare against prior periods (MTD, QTD, YTD, and YoY)?

---

## 🏗️ Data Architecture & Modeling

### 1. Data Ingestion & Transformation (Power Query)
- Extracted raw source files (CSV / Excel / SQL database).
- Removed duplicates, handled blank/null values, and enforced strict column data typing.
- Unpivoted historical attribute columns to maintain normalized tabular structures.
- Created a dynamic **Date Table** using M-code/DAX to support calendar and fiscal time-intelligence reporting.

### 2. Data Model (Star Schema)
The data model is structured around a centralized fact table connected via one-to-many (`1:*`) relationships with single-direction cross-filtering:

- **Fact Table:** `Fact_Sales` / `Fact_Transactions`
- **Dimension Tables:** `Dim_Date`, `Dim_Product`, `Dim_Customer`, `Dim_Geography`

---

## 📐 Key DAX Measures

### 1. Dynamic Total Revenue & Margin
```dax
Total Revenue = 
SUMX(Fact_Sales, Fact_Sales[Quantity] * Fact_Sales[Unit Price])
