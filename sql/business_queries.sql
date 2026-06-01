SELECT
    region,
    SUM(revenue) AS total_revenue
FROM pharma_sales
GROUP BY region
ORDER BY total_revenue DESC;

SELECT
    medicine_name,
    SUM(revenue) AS total_revenue
FROM pharma_sales
GROUP BY medicine_name
ORDER BY total_revenue DESC;

SELECT
    sales_rep_name,
    SUM(revenue) AS total_revenue,
    SUM(prescriptions) AS total_prescriptions,
    AVG(achieved_pct) AS avg_achievement
FROM pharma_sales
GROUP BY sales_rep_name
ORDER BY total_revenue DESC;

SELECT
    doctor_name,
    SUM(prescriptions) AS total_prescriptions,

    CASE
        WHEN SUM(prescriptions) > 2500
            THEN 'High Value'

        WHEN SUM(prescriptions) > 1500
            THEN 'Medium Value'

        ELSE 'Low Value'
    END AS doctor_segment

FROM pharma_sales

GROUP BY doctor_name

ORDER BY total_prescriptions DESC;

SELECT
    region,
    SUM(revenue) AS revenue,
    SUM(marketing_spend) AS marketing_spend,

    ROUND(
        SUM(revenue) * 1.0 /
        SUM(marketing_spend),
        2
    ) AS roi

FROM pharma_sales

GROUP BY region

ORDER BY roi DESC;


-- SECTION 1: DATA QUALITY CHECKS

-- Query 1: Total Records

SELECT COUNT(*) AS total_records
FROM pharma_sales;

--Business Purpose: Understand dataset size.

--Query 2: Missing Value Check

SELECT
COUNT(*) - COUNT(region) AS missing_region,
COUNT(*) - COUNT(sales_rep_name) AS missing_rep,
COUNT(*) - COUNT(doctor_name) AS missing_doctor
FROM pharma_sales;

-- Business Purpose: Validate data quality.

--SECTION 2: REVENUE ANALYSIS

--Query 3: Total Revenue

SELECT SUM(revenue) AS total_revenue
FROM pharma_sales;

--Query 4: Revenue by Region

SELECT
region,
SUM(revenue) AS total_revenue
FROM pharma_sales
GROUP BY region
ORDER BY total_revenue DESC;

--Query 5: Monthly Revenue Trend

SELECT
strftime('%Y-%m', visit_date) AS month,
SUM(revenue) AS total_revenue
FROM pharma_sales
GROUP BY month
ORDER BY month;

--Query 6: Top 2 Revenue Generating Regions

SELECT
region,
SUM(revenue) AS total_revenue
FROM pharma_sales
GROUP BY region
ORDER BY total_revenue DESC
LIMIT 2;

-- SECTION 3: TERRITORY ANALYSIS

-- Query 7: Territory Performance Ranking

SELECT
region,
SUM(revenue) AS revenue,
RANK() OVER(
ORDER BY SUM(revenue) DESC
) AS territory_rank
FROM pharma_sales
GROUP BY region;

-- Query 8: Revenue Contribution % 
-- Business Insight: Which territory contributes most?

SELECT
region,
SUM(revenue) AS revenue,
ROUND(
100.0 * SUM(revenue) /
(SELECT SUM(revenue) FROM pharma_sales),
2
) AS contribution_pct
FROM pharma_sales
GROUP BY region;

-- SECTION 4: SALES REP EFFECTIVENESS

-- Query 9: Sales Rep Performance

SELECT
sales_rep_name,
SUM(revenue) AS revenue,
AVG(achieved_pct) AS avg_achievement
FROM pharma_sales
GROUP BY sales_rep_name
ORDER BY revenue DESC;

-- Query 10: Top Performing Reps

SELECT
sales_rep_name,
AVG(achieved_pct) AS achievement
FROM pharma_sales
GROUP BY sales_rep_name
ORDER BY achievement DESC
LIMIT 10;

-- Query 11: Underperforming Reps
-- Business Recommendation: Training intervention.

SELECT
sales_rep_name,
AVG(achieved_pct) AS achievement
FROM pharma_sales
GROUP BY sales_rep_name
HAVING achievement < 190;

-- SECTION 5: PHYSICIAN ANALYSIS

-- Query 12: High Value Physicians

SELECT
doctor_name,
SUM(prescriptions) AS total_prescriptions
FROM pharma_sales
GROUP BY doctor_name
ORDER BY total_prescriptions DESC;

-- Query 13: Physician Segmentation

SELECT
doctor_name,
SUM(prescriptions) AS total_prescriptions,

CASE
WHEN SUM(prescriptions) > 2500
THEN 'High Value'

WHEN SUM(prescriptions) > 1500
THEN 'Medium Value'

ELSE 'Low Value'
END AS doctor_segment

FROM pharma_sales
GROUP BY doctor_name;

-- Query 14: Specialty Analysis

SELECT
specialty,
SUM(revenue) AS revenue,
SUM(prescriptions) AS prescriptions
FROM pharma_sales
GROUP BY specialty
ORDER BY revenue DESC;

-- SECTION 6: PRODUCT ANALYSIS
-- Query 15: Revenue by Product

SELECT
medicine_name,
SUM(revenue) AS revenue
FROM pharma_sales
GROUP BY medicine_name
ORDER BY revenue DESC;

-- Query 16: Product Revenue Contribution

SELECT
medicine_name,
SUM(revenue) AS revenue,

ROUND(
100.0 * SUM(revenue) /
(SELECT SUM(revenue)
 FROM pharma_sales),
2
) AS contribution_pct

FROM pharma_sales
GROUP BY medicine_name;

-- SECTION 7: MARKETING ROI ANALYSIS
-- Query 17: ROI by Region

SELECT
    region,
    SUM(revenue) AS revenue,
    SUM(marketing_spend) AS spend,

    ROUND(
        SUM(revenue) * 1.0 /
        SUM(marketing_spend),
        2
    ) AS roi

FROM pharma_sales

GROUP BY region

ORDER BY roi DESC;

-- Query 18: Highest ROI Regions
SELECT
    region,
    ROUND(
        SUM(revenue) * 1.0 /
        SUM(marketing_spend),
        2
    ) AS roi
FROM pharma_sales
GROUP BY region
ORDER BY roi DESC;

-- SECTION 8: ADVANCED BUSINESS INSIGHTS

-- Query 19: High Achievement but Low Revenue Regions 
-- Business Question: Are reps meeting targets but still generating low revenue

SELECT
region,
AVG(achieved_pct) AS avg_achievement,
SUM(revenue) AS revenue
FROM pharma_sales
GROUP BY region
ORDER BY avg_achievement DESC;

-- Query 20: Top Doctor in Every Region

SELECT *
FROM (
SELECT
region,
doctor_name,
SUM(prescriptions) AS total_prescriptions,

RANK() OVER(
PARTITION BY region
ORDER BY SUM(prescriptions) DESC
) AS rnk

FROM pharma_sales
GROUP BY region, doctor_name
)
WHERE rnk = 1;

