
# Amazon UK Sales Analysis – Statistical Validation (R)
# Purpose:
# Validate and support insights derived from SQL analysis
# using statistical techniques and visual exploration.


# Load required libraries
library(dplyr)
library(ggplot2)


# 1. Load data

# Data exported from Google BigQuery after SQL processing
amazon <- read.csv("amazon_uk_products.csv")


# 2. Data cleaning

amazon_clean <- amazon %>%
  filter(
    !is.na(price),
    !is.na(stars),
    !is.na(reviews)
  )

# Check cleaned dataset size
nrow(amazon_clean)


# 3. Descriptive statistics

summary(amazon_clean$price)
summary(amazon_clean$stars)
summary(amazon_clean$reviews)


# 4. Correlation analysis

# Examine relationships between price, ratings, and reviews

cor_price_rating <- cor(amazon_clean$price, amazon_clean$stars)
cor_price_reviews <- cor(amazon_clean$price, amazon_clean$reviews)

cor_price_rating
cor_price_reviews


# 5. Visual exploration


# Price vs Rating
ggplot(amazon_clean, aes(x = price, y = stars)) +
  geom_point(alpha = 0.2) +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(
    title = "Relationship Between Price and Customer Rating",
    x = "Price",
    y = "Average Rating"
  ) +
  theme_minimal()

# Price vs Review Volume
ggplot(amazon_clean, aes(x = price, y = reviews)) +
  geom_point(alpha = 0.2) +
  geom_smooth(method = "lm", se = FALSE, color = "darkgreen") +
  labs(
    title = "Relationship Between Price and Review Volume",
    x = "Price",
    y = "Total Reviews"
  ) +
  theme_minimal()

# 6. Key observations (to be reported, not coded)

# - Price shows weak correlation with customer ratings
# - Higher price does not guarantee higher satisfaction
# - Review volume varies widely across price levels
