# 👥 Human Resources (HR) Workforce & Attrition Analytics

## 📌 Project Overview
This repository contains an end-to-end Human Resources (HR) Analytics solution designed to track workforce composition, diagnose employee turnover, and uncover key drivers behind voluntary attrition. Using **Excel**, **SQL**, and **Power BI**, this project analyzes demographic, operational, and sentiment metrics across departments to provide People Operations teams with proactive, data-driven retention strategies.

---

## 🎯 Business Problems & Key Questions Answered
- **Workforce Turnover:** What is the overall attrition rate, and how does it compare across departments (R&D, Sales, HR)?
- **Tenure & Experience Risk:** At what tenure milestones (e.g., Year 1, Year 3–5) are employees most vulnerable to leaving?
- **Compensation & Role Parity:** Does salary distribution (monthly income vs. job level) correlate with attrition within specific job roles?
- **Work-Life Balance & Overtime:** How significantly does frequent overtime and travel frequency elevate turnover risk?
- **Sentiment & Engagement:** What is the relationship between environment satisfaction, work-life balance scores, and employee exit rates?

---

## 🗄️ Dataset Schema
The dataset consists of employee records with demographic, job-related, and survey-based attributes:

| Column Name | Description |
| :--- | :--- |
| `EmployeeID` | Unique employee identifier |
| `Attrition` | Employment status (`Yes` = Terminated/Left, `No` = Active) |
| `Department` | Functional area (`Sales`, `Research & Development`, `Human Resources`) |
| `JobRole` | Specific job title (e.g., `Sales Executive`, `Research Scientist`, `Manager`) |
| `Age` / `Gender` | Demographic attributes |
| `MonthlyIncome` | Gross monthly compensation |
| `YearsAtCompany` | Total duration of service at the firm |
| `YearsSinceLastPromotion` | Gap since last internal career advancement |
| `OverTime` | Overtime status (`Yes` / `No`) |
| `JobSatisfaction` | Rating scale (1 = `Low` to 4 = `Very High`) |
| `EnvironmentSatisfaction` | Workplace satisfaction rating (1 = `Low` to 4 = `Very High`) |

---

## 🛠️ Tech Stack & Workflow
- **Data Audit & Preprocessing:** Microsoft Excel / SQL
  - Converted text-based satisfaction levels into standardized ordinal buckets.
  - Resolved null records, duplicate employee numbers, and inconsistent salary formatting.
- **Relational Querying & Modeling:** SQL (MySQL / PostgreSQL)
  - Common Table Expressions (CTEs) and window functions (`DENSE_RANK`, `PERCENT_RANK`) to compute role-based salary tiers.
  - Aggregate grouping to benchmark department attrition vs. company baseline.
- **Business Intelligence & Reporting:** Microsoft Power BI
  - Star Schema architecture separating active employee fact records from demographic and departmental dimensions.
  - Interactive slicers (Department, Education Field, OverTime, Age Cohort).
  - Bookmark controls to toggle between **Executive Overview**, **Attrition Deep Dive**, and **Demographics & Sentiment**.

---
<img width="1307" height="741" alt="image" src="https://github.com/user-attachments/assets/e46d7c1d-21ba-40b4-9e8c-48cc37e88054" />
