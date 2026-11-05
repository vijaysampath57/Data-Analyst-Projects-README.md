# 🎬 Netflix Catalog Analytics & Content Distribution Dashboard (Power BI)

## 📌 Project Overview
This repository contains an end-to-end business intelligence project analyzing the **Netflix global content catalog** using **Microsoft Power BI**. The dashboard explores content library growth over time, distribution between Movies and TV Shows, target audience ratings, genre preferences, and production output across top countries.

---

## 🎯 Key Questions & Analytical Objectives
- **Catalog Composition:** What is the historical and current split between Movies vs. TV Shows?
- **Release & Addition Trends:** How has Netflix's content acquisition strategy accelerated by year and month?
- **Content Ratings & Target Audience:** Which age rating categories (e.g., TV-MA, TV-14, PG-13) dominate the library?
- **Global Footprint:** Which countries are the largest content producers, and how does localization vary by region?
- **Genre & Duration Insights:** What are the most common genres, and how does the average runtime of movies compare against the season counts of TV shows?

---

## 🛠️ Data Pipeline & Transformation (Power Query)
1. **Data Source:** Netflix Movies and TV Shows dataset (Kaggle).
2. **Missing Value Treatment:**
   - Replaced blank values in `director` and `cast` with `"Unknown"`.
   - Handled missing values in `country` by assigning `"Not Specified"`.
3. **Data Splitting & Normalization:**
   - **Country Splitting:** Split comma-separated values in `country` into clean tabular rows to allow accurate country-level aggregation.
   - **Genre Normalization:** Split multi-genre entries in `listed_in` to enable individual genre filtering.
   - **Duration Separation:** Extracted numeric values from strings (e.g., separated `"90 min"` into `90` [Integer] and `"2 Seasons"` into `2` [Integer]).
4. **Date Parsing:** Converted text field `date_added` into standard `Date` format to build a dynamic calendar table for time intelligence.

---
<img width="1172" height="742" alt="image" src="https://github.com/user-attachments/assets/aa415e3d-bba6-463b-a5db-25d99ba246e7" />


