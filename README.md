# Pharma Sales Force Effectiveness Analytics

## Project Overview

This project analyzes pharmaceutical sales performance to evaluate the effectiveness of sales representatives, physician engagement, product performance, territory performance, and marketing investments.

The objective is to provide actionable business insights that help management optimize sales strategies, improve physician targeting, maximize revenue, and enhance return on marketing spend.

The project was developed using SQL, Python (Pandas), and Tableau following a complete Business Analyst project lifecycle including BRD, FRD, data analysis, and dashboard development.

---

## Business Problem

Pharmaceutical companies invest heavily in sales representatives and marketing activities to increase physician prescriptions and product sales. However, management often faces challenges in identifying:

* Which regions generate the highest revenue?
* Which products contribute most to sales?
* Which physicians drive prescription growth?
* How effective are sales representatives?
* Is marketing spend generating adequate returns?
* Are sales teams achieving their targets?

This project addresses these challenges through data-driven analysis and visualization.

---

## Business Objectives

* Evaluate sales force effectiveness.
* Identify high-performing and low-performing regions.
* Measure product-wise revenue contribution.
* Analyze physician prescription behavior.
* Assess marketing investment efficiency using ROI.
* Track sales achievement against targets.
* Enable data-driven decision making through interactive dashboards.

---

## Dataset Description

The dataset contains pharmaceutical sales and physician engagement information.

### Key Fields

| Column Name     | Description                            |
| --------------- | -------------------------------------- |
| Sales_ID        | Unique sales transaction identifier    |
| Doctor_ID       | Unique physician identifier            |
| Doctor_Name     | Physician name                         |
| Sales_Rep_ID    | Unique sales representative identifier |
| Sales_Rep_Name  | Sales representative name              |
| Region          | Sales territory/region                 |
| Specialty       | Doctor specialty                       |
| Medicine_Name   | Product name                           |
| Visit_Date      | Sales visit date                       |
| Prescriptions   | Number of prescriptions generated      |
| Units_Sold      | Number of units sold                   |
| Revenue         | Revenue generated                      |
| Marketing_Spend | Marketing investment                   |
| Target          | Assigned sales target                  |
| Achieved_Pct    | Percentage target achieved             |
| ROI             | Return on Investment                   |

---

## KPI Metrics

### Total Revenue

Measures overall revenue generated.

```sql
SUM(Revenue)
```

---

### Total Prescriptions

Measures total prescriptions generated.

```sql
SUM(Prescriptions)
```

---

### Average Achievement %

Measures sales target achievement.

```sql
AVG(Achieved_Pct)
```

---

### Average ROI

Measures marketing effectiveness.

```sql
AVG(ROI)
```

---

## Tools & Technologies

* SQL (SQLite)
* Python
* Pandas
* NumPy
* Jupyter Notebook
* Tableau Public
* Excel

---

## SQL Analysis

Business-focused SQL queries were created to analyze:

### Regional Performance

* Revenue by region
* ROI by region
* Achievement % by region

### Product Performance

* Product revenue contribution
* Top performing medicines
* Product-wise prescriptions

### Physician Analysis

* Top physicians by prescriptions
* Physician contribution analysis

### Sales Representative Analysis

* Top sales representatives
* Achievement analysis
* Revenue contribution

### Marketing Analysis

* Revenue vs Marketing Spend
* ROI analysis

---

## Python & Pandas Analysis

The Python notebook was used for:

* Data exploration
* KPI calculation
* Aggregation analysis
* Business insight generation
* Recommendation creation

Key libraries used:

```python
import pandas as pd
import numpy as np
```

---

## Tableau Dashboard

### Dashboard Features

#### KPI Cards

* Total Revenue
* Total Prescriptions
* Average Achievement %
* Average ROI

#### Visualizations

1. Revenue by Region
2. Sales Representative Performance
3. Revenue vs Marketing Spend
4. Product Revenue Contribution
5. Top 5 Physicians

#### Interactive Filters

* Region
* Medicine Name

---

## Key Business Insights

### Territory Performance

South region generated the highest revenue, indicating strong market penetration and sales effectiveness.

### Marketing Efficiency

North region achieved the highest ROI, demonstrating efficient utilization of marketing investments.

### Product Performance

HeartSafe emerged as the highest revenue-generating product, contributing significantly to overall sales.

### Physician Performance

Roy Newman recorded the highest prescription volume, making him a key physician for engagement strategies.

### Sales Effectiveness

Sales teams consistently exceeded assigned targets, reflecting strong field force performance.

---

## Recommendations

### Optimize Resource Allocation

Allocate additional sales resources and marketing support to high-performing regions to maximize revenue growth.

### Strengthen Physician Engagement

Increase engagement frequency with top prescribing physicians to sustain prescription growth.

### Improve Low ROI Areas

Review marketing strategies in lower ROI regions and reallocate budgets more effectively.

### Product Expansion

Leverage successful products such as HeartSafe for further market expansion initiatives.

### Performance Monitoring

Continuously monitor sales representative performance using KPI dashboards and achievement metrics.

---

## Project Architecture

```text
Business Problem
        │
        ▼
     BRD
        │
        ▼
     FRD
        │
        ▼
Data Understanding
        │
        ▼
SQL Analysis
        │
        ▼
Python/Pandas Analysis
        │
        ▼
Business Insights
        │
        ▼
Tableau Dashboard
        │
        ▼
Business Recommendations
```

---

## Project Structure

```text
pharma-sales-force-effectiveness-analytics/
│
├── data/
│   └── pharma_sales_data.csv
│
├── sql/
│   └── business_queries.sql
│
├── notebook/
│   └── analysis.ipynb
│
├── documentation/
│   ├── BRD.pdf
│   ├── FRD.pdf
│   └── Data_Dictionary.pdf
│
├── dashboard/
│   └── dashboard.png
│
└── README.md
```

---

## Dashboard Preview

Add your Tableau Dashboard screenshot here after uploading the project to GitHub.

```text
/dashboard/dashboard.png
```

---

## Author

**Saurabh**

Business Analytics Project – Pharma Sales Force Effectiveness Analytics

Tech Stack: SQL | Python | Pandas | Tableau | Business Analysis | Data Visualization

---

### Project Outcome

Successfully developed an end-to-end Pharma Sales Force Effectiveness Analytics solution that transformed raw sales data into actionable business insights through SQL analysis, Python analytics, and an interactive Tableau dashboard, enabling better territory management, physician targeting, product strategy, and marketing investment decisions.
