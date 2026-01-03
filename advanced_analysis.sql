

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
