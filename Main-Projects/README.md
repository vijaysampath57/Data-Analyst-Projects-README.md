# 📊 End-to-End Retail Sales Analytics: Excel to Power BI

## 📌 Project Overview
This repository contains an end-to-end data analytics project tracking the full lifecycle of retail transactional data. The project bridges the gap between spreadsheet data management and enterprise business intelligence—taking raw sales records through rigorous data cleaning and validation in **Microsoft Excel**, relational modeling and querying in **SQL**, exploratory analysis and transformation via **Python**, and delivering final executive dashboards with advanced DAX in **Microsoft Power BI**.

---

## 🎯 Analytical Objectives & Business Problem
- **Revenue & Profitability:** Identify key sales drivers, monitor net profit margins, and track Year-over-Year (YoY) revenue trajectories across multi-region distribution networks.
- **Product & Category Performance:** Pinpoint high-volume vs. high-margin product hierarchies to optimize catalog merchandising and reduce dead stock.
- **Customer Segmentation:** Classify repeat versus one-time buyers, analyze average order value (AOV), and evaluate discount impacts on overall revenue leakage.
- **Executive Decision-Making:** Deliver dynamic, self-service KPI dashboards with intuitive filter contexts and drill-through paths for regional and departmental leads.

---

## 🛠️ Complete Multi-Tool Workflow

```text
[ Raw Transactional Data ]
            │
            ▼
┌──────────────────────────────────────┐
│  1. Microsoft Excel                  │
│  - Data validation & missing values  │
│  - Structural cleanups & lookups     │
│  - Quick sanity checks via pivots    │
└──────────────────┬───────────────────┘
                   │
                   ▼
┌──────────────────────────────────────┐
│  2. SQL (MySQL / PostgreSQL)         │
│  - Relational schema ingestion       │
│  - Primary/Foreign key constraints   │
│  - Joins, CTEs, & Window Functions   │
└──────────────────┬───────────────────┘
                   │
                   ▼
┌──────────────────────────────────────┐
│  3. Python (pandas / seaborn)        │
│  - Anomaly & outlier detection       │
│  - Complex data type standardization │
│  - Exploratory statistical analysis  │
└──────────────────┬───────────────────┘
                   │
                   ▼
┌──────────────────────────────────────┐
│  4. Microsoft Power BI               │
│  - Power Query ETL pipelines         │
│  - Star Schema data modeling         │
│  - Advanced DAX measures             │
│  - Interactive executive dashboard   │
└──────────────────────────────────────┘

<img width="1165" height="672" alt="image" src="https://github.com/user-attachments/assets/037b6242-0a7a-48fa-89fa-0431f72c691f" />
