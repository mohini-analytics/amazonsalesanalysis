-- Business Questions:

-- 1) How many total products are listed?
SELECT categoryName, COUNT(categoryName) AS product_count
FROM `fresh-thinker-451616-g2.amazonUK.amazon_data` 
WHERE categoryName is NOT NULL
GROUP BY categoryName
ORDER BY product_count DESC
LIMIT 10
