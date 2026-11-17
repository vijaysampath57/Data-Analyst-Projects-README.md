# 🎬 Netflix Content Strategy & Catalog Analysis (Tableau)

An interactive business intelligence dashboard built in **Tableau** exploring Netflix’s global streaming library of **8,807 titles** (6,131 Movies and 2,676 TV Shows). This project uncovers catalog distribution, year-over-year expansion, regional production dominance, and target audience demographics.

![Netflix Tableau Dashboard Preview]<img width="1606" height="857" alt="Screenshot 2026-11-17 225730" src="https://github.com/user-attachments/assets/1b6d7468-57c3-496a-8b92-95dbe09361b8" />

---

## 📊 Key Insights & Findings
* **Catalog Composition:** Movies account for **69.62% (6,131 titles)** of the library, while TV Shows make up **30.38% (2,676 titles)**.
* **Rapid Expansion (2015–2020):** Content additions accelerated sharply after 2015 as Netflix scaled its original programming and global licensing, peaking around 2019–2020.
* **Target Demographics:** Mature and young-adult ratings (**TV-MA** and **TV-14**) dominate the catalog, signaling a strategic focus on adult and teen viewership over children's programming.
* **Global Production Hubs:** While the **United States** leads in overall content volume, **India, the United Kingdom, Japan, and South Korea** represent major production hubs driving international growth.
* **Top Genres:** *International Movies*, *Dramas*, and *Comedies* rank as the highest-volume categories across the platform.

---

## 🛠️ Tools & Methodology
* **Data Source:** Kaggle Netflix Movies and TV Shows Dataset (`netflix_titles.csv` — 8,807 records, 12 attributes).
* **Data Preparation:**
  * Standardized `date_added` formats to extract addition years and monthly trends.
  * Handled missing values in `country`, `director`, and `cast` fields.
  * Used `COUNTD([show_id])` and conditional `IF` / `IIF` calculated fields to prevent double-counting across multi-genre titles.
* **Visualization & UX:**
  * Styled using Netflix’s brand palette (`#141414` dark background, `#221F1F` cards, `#E50914` Netflix Red highlights).
  * Built custom KPI cards, dual-series area charts, choropleth geographic maps, and interactive cross-filtering actions.

---

## 📁 Repository Structure
```text
├── Netflix_Content_Analysis.twbx   # Packaged Tableau Workbook (includes data extract)
├── dashboard_preview.png           # High-resolution export of the final dashboard
├── data/
│   └── netflix_titles.csv          # Source dataset
└── README.md                       # Project documentation and insights
