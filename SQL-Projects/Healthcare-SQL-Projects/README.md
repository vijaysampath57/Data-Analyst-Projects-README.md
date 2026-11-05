# 🏥 Hospital Patient Analytics & Operational Insights (SQL)

## 📌 Project Overview
This project leverages SQL to extract, clean, and analyze clinical and operational healthcare data across inpatient admissions, patient demographics, clinical departments, and billing records. The primary goal is to surface actionable metrics around **hospital capacity**, **length of stay (LOS)**, **30-day readmission rates**, and **cost optimization**.

---

## 🎯 Key Healthcare Questions Answered
- **Length of Stay (LOS) Analysis:** What is the average length of stay across different medical specialties, admission types (Emergency vs. Elective), and age groups?
- **30-Day Readmission Tracking:** Which diagnoses and departments exhibit the highest unplanned 30-day readmission rates?
- **Bed Utilization & Capacity:** What are the peak admission periods by day of week and month, and how does inpatient bed turnover vary across wards?
- **Financial & Insurance Performance:** What are the total billed charges, insurance claim payout ratios, and average patient out-of-pocket costs by primary diagnosis?

---

## 🗄️ Relational Schema Design
The project is built on a relational hospital database comprising four primary tables:

- **`patients`**: Demographics and historical data (`patient_id`, `gender`, `date_of_birth`, `city`, `insurance_type`).
- **`admissions`**: Inpatient visit records (`admission_id`, `patient_id`, `admission_date`, `discharge_date`, `admission_type`, `discharge_disposition`).
- **`diagnoses`**: Clinical coding details (`diagnosis_id`, `admission_id`, `icd10_code`, `diagnosis_description`, `department_name`).
- **`billing`**: Financial transactions (`billing_id`, `admission_id`, `room_charges`, `medication_charges`, `lab_charges`, `total_amount`, `insurance_covered`, `payment_status`).

---

## 🛠️ SQL Techniques & Functions Applied
- **Data Standardization & Hygiene:** Handled null discharge dates, computed age categories using `TIMESTAMPDIFF` / `DATEDIFF`, and normalized text values.
- **Relational Joins:** Linked multi-table relational dependencies (`INNER JOIN`, `LEFT JOIN`) across admissions, patients, diagnoses, and billings.
- **Window Functions:**
  - `LAG()` and `LEAD()` to detect consecutive admissions and identify unplanned 30-day readmissions.
  - `DENSE_RANK()` and `ROW_NUMBER()` to isolate top diagnoses and high-cost cases.
  - `AVG() OVER (PARTITION BY ...)` for department-level benchmark comparison.
- **Modular Data Pipelines:** Common Table Expressions (CTEs) to segment complex multi-step clinical cohort metrics.
- **Aggregations & Logic:** `CASE WHEN` conditional groupings, `COUNT(DISTINCT ...)`, and date-part extractions.

---

## 📁 Repository Structure
```text
├── data/
│   └── raw_healthcare_data.csv       # Sample anonymized hospital dataset
├── scripts/
│   ├── 01_schema_setup.sql           # Table DDL, primary/foreign keys, and indexes
│   ├── 02_data_cleaning.sql          # Anomaly resolution, null handling, type casting
├── docs/
│   └── healthcare_erd.png            # Entity Relationship Diagram (ERD)
└── README.md
