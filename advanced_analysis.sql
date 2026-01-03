

### Advanced SQL (Business-Driven)

Advanced SQL techniques were used to answer questions that cannot be solved using basic aggregation alone, including:
- Category-relative performance ranking
- Risk identification using multi-metric benchmarks
- Price perception analysis using peer comparison
- Structured analysis using CTEs and CASE logic


--Business Question 1: “Is this dataset reliable enough to support category-level and pricing analysis?”

-- Why basic SQL is NOT enough: Simple SELECT * WHERE price IS NULL doesn’t give a holistic view of data health. Hence, Advanced SQL is used.
-- Data Quality Check: Missing critical fields

SELECT
  COUNT(*) AS total_products,
  COUNTIF(price IS NULL) AS missing_price,
  COUNTIF(stars IS NULL) AS missing_rating,
  COUNTIF(reviews IS NULL) AS missing_reviews
FROM `fresh-thinker-451616-g2.amazonUK.amazon_data`;

--Why this SQL was used: 
--Aggregates multiple data quality checks in one scan
--Quantifies reliability instead of anecdotal checks



--Business Question 2: Which products are underperforming compared to other products in the same category?

--Why basic SQL fails: ORDER BY stars ASC. This gives a global ranking, which is unfair and unusable. Hence, advanced SQL is used.
-- Identify underperforming products within each category

SELECT
  categoryName, title,
  stars AS average_rating,
  reviews AS total_reviews,
  RANK() OVER (
    PARTITION BY categoryName
    ORDER BY stars ASC
  ) AS rating_rank_within_category
FROM `fresh-thinker-451616-g2.amazonUK.amazon_data`
WHERE stars IS NOT NULL
  AND reviews IS NOT NULL;

-- Why this SQL was used:
-- PARTITION BY categoryName ensures fair peer comparison
-- Window function allows relative performance analysis
-- This query directly supports quality interventions & delisting decisions


--Business Question 3: Which categories combine low customer satisfaction and weak engagement?

--Why basic SQL fails: Requires multi-step logic, Requires benchmarking against overall norms, One query would become unreadable without structure, so Advanced SQL is Used.

-- Category-level risk analysis using CTE


WITH category_metrics AS (
  SELECT
    categoryName,
    AVG(stars) AS avg_rating,
    SUM(reviews) AS total_reviews
  FROM `fresh-thinker-451616-g2.amazonUK.amazon_data`
  WHERE stars IS NOT NULL
  GROUP BY categoryName
),
benchmarks AS (
  SELECT
    AVG(avg_rating) AS overall_avg_rating,
    AVG(total_reviews) AS overall_avg_reviews
  FROM category_metrics
)
SELECT
  c.categoryName,
  c.avg_rating,
  c.total_reviews,
  CASE
    WHEN c.avg_rating < b.overall_avg_rating
     AND c.total_reviews < b.overall_avg_reviews
    THEN 'High Risk'
    ELSE 'Monitor'
  END AS category_risk_status
FROM category_metrics c
CROSS JOIN benchmarks b;

-- Why this SQL was used
--CTEs improve readability & auditability
--Separates metrics from benchmarks
--CASE logic translates numbers → business decision labels



--Business Question  4: How does customer perception differ across price ranges?

--Why basic SQL fails: Raw price values don’t support segment-based comparison. Hence, Advanced SQL Used

-- Price band segmentation
SELECT
  categoryName,
  price,
  CASE
    WHEN price < 20 THEN 'Low'
    WHEN price BETWEEN 20 AND 50 THEN 'Medium'
    ELSE 'High'
  END AS price_band,
  stars,
  reviews
FROM  `fresh-thinker-451616-g2.amazonUK.amazon_data`
WHERE price IS NOT NULL;

--Why this SQL was used :
--Converts continuous data into business segments
--Enables dashboards & filters
--Aligns directly with pricing strategy discussions


--Business Question 5: Which products are overpriced relative to similarly rated products?

-- Why basic SQL fails
--You need: peer benchmarking, rating-based grouping, row-level comparison against group average. Hence, Advanced SQL is Used.

-- Price benchmarking by rating band

SELECT
  title,
  stars,
  price,
  AVG(price) OVER (
    PARTITION BY ROUND(stars)
  ) AS avg_price_for_rating_band
FROM `project.dataset.amazon_uk_products`
WHERE price IS NOT NULL
  AND stars IS NOT NULL;

--Why this SQL was used: 
--Benchmarks each product against peer expectations
--Identifies pricing anomalies
--Supports pricing optimisation & discount strategies

































