-- Business Questions:

-- 1) How many total products are listed?

SELECT categoryName, COUNT(*) AS total_products
FROM `fresh-thinker-451616-g2.amazonUK.amazon_data` 
LIMIT 1000

-- How many categories are represented?

SELECT categoryName, COUNT(DISTINCT categoryName) AS unique_categories
FROM `fresh-thinker-451616-g2.amazonUK.amazon_data` 
