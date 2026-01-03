
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

[Category Performance](images/Query1.png)



---

## 2. Price and Customer Perception

**Business Question:**  
Does a higher price correlate with higher customer ratings?

**SQL Insight:**  
Analysis shows that higher-priced products do not consistently receive better ratings. Several mid- and low-priced products achieve comparable or higher customer satisfaction.

**Why it matters:**  
A pricing strategy should be aligned with the perceived value, rather than assuming a premium positioning.

[Prise_and_Customer_perception](images/query.png)


---

## 3. Category-Level Risk Signals

**Business Question:**  
Are there categories with weak satisfaction and low engagement?

**SQL Insight:**  
Using category-level aggregation and benchmarking, a small subset of categories was flagged for monitoring due to lower-than-average ratings and review volumes.

**Why it matters:**  
Early identification allows targeted quality or supplier interventions before revenue impact escalates.

[Category Risk](docs/images/query3.png)

---

## Notes on Methodology

- SQL queries were executed in Google BigQuery.
- Advanced SQL techniques used include window functions, CTEs, and CASE-based classification.
- Full queries are available in:
  - `sql/findings.sql`
  - `sql/advanced_analysis.sql`
- Screenshots of queries are [here](images).
