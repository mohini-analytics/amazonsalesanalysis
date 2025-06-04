-- Business Questions:

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

-- 5) Top 10 categories have the most average price?

