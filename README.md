# Data Analytics Level III - Institutional Competency Assessment
## Candidate: JOLI AREL SANTOS
## Date of Submission: May 30, 2026

---

### 📋 Project Overview
This repository contains the end-to-end data analytics capstone project for **Bahaghari Retail Co.**, a convenience store chain operating multiple retail branches across the Luzon, Visayas, and Mindanao regions in the Philippines. Management provided one year of raw, unstructured, and "messy" transaction logs, product lists, and store metadata to uncover foundational business trends, operational discrepancies, and strategic optimization opportunities. 

Through systematic database engineering, statistical profiling, and business intelligence reporting, this project cleanses data anomalies, structures a robust star-schema relational model, and translates raw retail metrics into highly interactive, evidence-based executive dashboards designed to drive regional growth and improve corporate data governance.

---

### 📂 Repository Folder Structure & Contents
This repository is organized strictly in compliance with the TESDA Institutional Competency Assessment guidelines to ensure smooth navigation and reproducibility:

* **`01_statistics/`**
    * `IA_Statistics_SANTOSJA.xlsx`: Foundation workbook utilizing the Excel *Data Analysis ToolPak*. Contains descriptive statistical analysis (mean, median, mode, range, variance, standard deviation, quartiles Q1–Q3) computed for `total_amount` and `units`, a configured frequency histogram, and a professional interpretation of distribution centers and variance spreads.
* **`02_data_preparation/`**
    * `IA_Preparation_SANTOSJA.sql`: A production-ready SQL script designed for SQLite/VS Code environment. Implements full ETL logic including data type correction, duplicate row deduplication, leading/trailing space trimming (`TRIM`), category string case standardization, and localized text handling for missing values (unassigned regions/blank units).
    * `IA_PreparedWorkbook_SANTOSJA.xlsx`: The fully cleaned, filtered (most recent full fiscal year), and joined denormalized master analysis-ready dataset extracted post-ETL processing
* **`03_visualization/`**
    * `IA_Dashboard_SANTOSJA.pbix`: The core Microsoft Power BI Desktop model featuring a star-schema architecture (Fact table linked to structured Dimension tables), customized advanced DAX measures, 
* **`04_executive_summary/`**
    * `IA_Executive Summary_SANTOSJA.pdf`: A professional, 1-page business report addressing executive leadership Synthesizes 3+ data-validated operational insights—such as structural category over-dependencies, data integration anomalies, regional performance gaps—and strategic corporate action items

---

---

### 🛠️ Analytics Tech Stack & Setup Environment
To execute the scripts or inspect the data models locally, ensure the following configurations are established:
1.  **Microsoft Excel:** Version 365 or 2021 with the **Data Analysis ToolPak** add-in active (`File` -> `Options` -> `Add-ins`)
2.  **SQL Environment:** 
3.  **Microsoft Power BI Desktop:** Free desktop edition (Optimized for May 2026 build or newer). Ensure data source settings point correctly to the local directory path of `IA_PreparedWorkbook_SANTOSJA.xlsx` if refreshing data connectivity links

---
