-- Potential Business Questions:

-- 1) How many total products are listed?

SELECT categoryName, COUNT(*) AS total_products
FROM `fresh-thinker-451616-g2.amazonUK.amazon_data` 
LIMIT 1000

-- 2) How many categories are represented?

SELECT categoryName, COUNT(DISTINCT categoryName) AS unique_categories
FROM `fresh-thinker-451616-g2.amazonUK.amazon_data` 

-- 3) How many products are missing price or rating infomation (stars)?

SELECT 
COUNT IF (price IS NULL) AS missing_prise,
COUNT IF (stars IS NULL) AS missing_rating
FROM `fresh-thinker-451616-g2.amazonUK.amazon_data` 

-- 4) What are the top 10 most common categories?

SELECT categoryName, COUNT(categoryName) AS product_count
FROM `fresh-thinker-451616-g2.amazonUK.amazon_data` 
WHERE categoryName is NOT NULL
GROUP BY categoryName
ORDER BY product_count DESC
LIMIT 10

-- 5) Top 10 categories have the highest average price?

SELECT categoryName, ROUND(AVG(price), 2) AS avg_price, COUNT(*) AS total_products
FROM `fresh-thinker-451616-g2.amazonUK.amazon_data` 
WHERE price IS NOT NULL AND categoryName IS NOT NULL
GROUP BY categoryName
ORDER BY avg_price DESC
LIMIT 10;

-- 6) Top 10 categories have the highest average price?

SELECT categoryName, ROUND(AVG(price), 2) AS avg_price, COUNT(*) AS total_products
FROM `fresh-thinker-451616-g2.amazonUK.amazon_data` 
WHERE price IS NOT NULL AND categoryName IS NOT NULL
GROUP BY categoryName
ORDER BY avg_price 
LIMIT 10;

-- 7) Which categories have the most products with ratings?

SELECT categoryName, COUNT(*) AS rated_products
FROM `fresh-thinker-451616-g2.amazonUK.amazon_data`
WHERE stars IS NOT NULL
GROUP BY categoryName
ORDER BY rated_products DESC
LIMIT 10;

-- 8) How many products are missing price or rating information?

SELECT 
  COUNTIF(price IS NULL) AS missing_price,
  COUNTIF(stars IS NULL) AS missing_rating,
  COUNTIF(reviews IS NULL) AS missing_reviews
FROM `fresh-thinker-451616-g2.amazonUK.amazon_data`

-- 9) What is the average, min, and max price across all products?

SELECT 
  ROUND(AVG(price), 2) AS avg_price,
  MIN(price) AS min_price,
  MAX(price) AS max_price
FROM `fresh-thinker-451616-g2.amazonUK.amazon_data`
WHERE price IS NOT NULL;

-- 10) Is there a relationship between price and rating?

SELECT 
  ROUND(CORR(price, stars), 3) AS price_rating_correlation
FROM `fresh-thinker-451616-g2.amazonUK.amazon_data`
WHERE price IS NOT NULL AND stars IS NOT NULL;

-- 11(A) Does correlation differs by product category??
SELECT 
  categoryName,
  COUNT(*) AS num_products,
  ROUND(CORR(price, stars), 3) AS price_rating_correlation
FROM `fresh-thinker-451616-g2.amazonUK.amazon_data`
WHERE price IS NOT NULL AND stars IS NOT NULL
GROUP BY categoryName
ORDER BY price_rating_correlation 

-- 11(B) Does correlation differs by product category?

SELECT 
  categoryName,
  COUNT(*) AS num_products,
  ROUND(CORR(price, stars), 3) AS price_rating_correlation
FROM `fresh-thinker-451616-g2.amazonUK.amazon_data`
WHERE price IS NOT NULL AND stars IS NOT NULL
GROUP BY categoryName
ORDER BY price_rating_correlation DESC















