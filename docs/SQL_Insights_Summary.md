
# SQL Insights Summary

This document summarises the key insights derived from SQL analysis conducted on the Amazon UK product dataset. The aim is to present clear, business-relevant findings without requiring execution of the SQL queries.

---

## 1. Category Performance Overview

**Business Question:**  
Which product categories dominate the dataset and show strong engagement?

**SQL Insight:**  
A small number of categories account for a large proportion of listed products and customer reviews, indicating a concentration of demand.

**Why it matters:**  
Category managers can focus optimisation efforts on high-impact categories rather than spreading effort evenly.

![Category Distribution](screenshots/sql/category_distribution.png)



---

## 2. Price and Customer Perception

**Business Question:**  
Does a higher price correlate with higher customer ratings?

**SQL Insight:**  
Analysis shows that higher-priced products do not consistently receive better ratings. Several mid- and low-priced products achieve comparable or higher customer satisfaction.

**Why it matters:**  
Pricing strategy should be aligned with perceived value, not assumed premium positioning.

![Price vs Rating](screenshots/sql/prise_vs_rating.png)

---

## 3. Category-Level Risk Signals

**Business Question:**  
Are there categories with weak satisfaction and low engagement?

**SQL Insight:**  
Using category-level aggregation and benchmarking, a small subset of categories was flagged for monitoring due to lower-than-average ratings and review volumes.

**Why it matters:**  
Early identification allows targeted quality or supplier interventions before revenue impact escalates.

![Category Risk](screenshots/sql/category_risk.png)

---

## Notes on Methodology

- SQL queries were executed in Google BigQuery.
- Advanced SQL techniques used include window functions, CTEs, and CASE-based classification.
- Full queries are available in:
  - `sql/findings.sql`
  - `sql/advanced_analysis.sql`
