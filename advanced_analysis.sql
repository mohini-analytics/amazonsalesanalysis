

-- =====================================================
-- Advanced SQL Analysis
-- Purpose:
-- Demonstrate business-driven analytical SQL used to
-- support category performance, pricing strategy,
-- and risk identification.
-- =====================================================




### Advanced SQL (Business-Driven)

Advanced SQL techniques were used to answer questions that cannot be solved using basic aggregation alone, including:
- Category-relative performance ranking
- Risk identification using multi-metric benchmarks
- Price perception analysis using peer comparison
- Structured analysis using CTEs and CASE logic



-- Business Question 1:
-- Is the dataset sufficiently complete to support reliable category and pricing analysis?

-- Why Advanced SQL:
-- Requires conditional aggregation to quantify missing critical fields in a single pass.

-- Output Use:
-- Validates data reliability before insights are surfaced to stakeholders.

SELECT
  COUNT(*) AS total_products,
  COUNTIF(price IS NULL) AS missing_price,
  COUNTIF(stars IS NULL) AS missing_rating,
  COUNTIF(reviews IS NULL) AS missing_reviews
FROM `fresh-thinker-451616-g2.amazonUK.amazon_data`;




-- Business Question 2:
-- Which products are underperforming relative to other products in the same category?

-- Why Advanced SQL:
-- Global ranking is misleading; peer-relative comparison requires window functions.

-- Output Use:
-- Supports category-level quality reviews, supplier evaluation, and delisting decisions.


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



-- Business Question 3:
-- Which categories show combined risk based on low customer satisfaction and weak engagement?

-- Why Advanced SQL:
-- Requires multi-step aggregation and benchmarking that cannot be expressed cleanly in a single query.

-- Output Use:
-- Feeds category risk dashboards used by operations and quality teams.


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



-- Business Question 4:
-- How does customer perception vary across different price segments?

-- Why Advanced SQL:
-- Requires business-driven segmentation of continuous price values.

-- Output Use:
-- Enables price-band analysis in dashboards and pricing strategy discussions.

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



-- Business Question 5:
-- Which products appear overpriced relative to similarly rated peers?

-- Why Advanced SQL:
-- Requires peer benchmarking using windowed averages across rating bands.

-- Output Use:
-- Identifies pricing misalignment and supports discount or repositioning decisions.


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


-- Business Question 6:
-- Are there categories with weak satisfaction and low engagement?

WITH category_metrics AS (
  SELECT
    categoryName,
    ROUND(AVG(stars), 2) AS avg_rating,
    SUM(reviews) AS total_reviews
  FROM `fresh-thinker-451616-g2.amazonUK.amazon_data`
  WHERE stars IS NOT NULL
    AND reviews IS NOT NULL
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
    THEN 'Monitor / Potential Risk'
    ELSE 'Healthy'
  END AS category_status
FROM category_metrics c
CROSS JOIN benchmarks b
ORDER BY category_status DESC, c.avg_rating;














