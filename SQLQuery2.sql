------------------------------------------------------------------------------------
-- SQL Script for Customer Churn Analysis (Updated for SQL Server)
-- This script performs various analyses on a customer_data table to understand
-- and identify factors contributing to customer churn.
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
-- 1. Basic Descriptive Statistics
------------------------------------------------------------------------------------

-- 1.1. Total Number of Customers
-- Purpose: Calculate the total number of customers in the dataset.
-- Insight: Provides a baseline understanding of the size of the customer base.
SELECT COUNT(*) AS total_customers
FROM customer_data;

-- 1.2. Number of Churned Customers
-- Purpose: Calculate the number of customers who have churned (churned = 1).
-- Insight: Shows the absolute number of customers lost to churn.
SELECT COUNT(*) AS churned_customers
FROM customer_data
WHERE churned = 1;

-- 1.3. Overall Churn Rate
-- Purpose: Calculate the overall churn rate as a percentage of total customers.
-- Insight: Provides a key performance indicator (KPI) representing the overall
--          churn problem. High churn rates indicate a need for improvement
--          in customer retention strategies.
SELECT CAST(SUM(CAST(churned AS INT)) AS FLOAT) / COUNT(*) AS overall_churn_rate
FROM customer_data;

------------------------------------------------------------------------------------
-- 2. Analysis by Demographics
------------------------------------------------------------------------------------

-- 2.1. Churn Rate by Gender
-- Purpose: Calculate the churn rate for each gender.
-- Insight: Identifies if churn is disproportionately higher for one gender
--          than another, suggesting potential targeting issues.
SELECT
    gender,
    CAST(SUM(CAST(churned AS INT)) AS FLOAT) / COUNT(*) AS churn_rate
FROM
    customer_data
GROUP BY
    gender;

-- 2.2. Average Age of Churned vs. Non-Churned Customers
-- Purpose: Calculate the average age of customers who churned compared to those who didn't.
-- Insight: Reveals if churn is correlated with age. If churned customers are significantly
--          younger or older, it could indicate that the service is not well-suited
--          for certain age groups.
SELECT
    churned,
    AVG(age) AS average_age
FROM
    customer_data
GROUP BY
    churned;

------------------------------------------------------------------------------------
-- 3. Analysis by Usage and Engagement
------------------------------------------------------------------------------------

-- There is no subscription_type in engagement

-- 3.1. Average Monthly Charges for Churned vs. Non-Churned Customers
-- Purpose: Calculate the average monthly charges paid by customers who churned
--          compared to those who didn't.
-- Insight: May indicate pricing issues. If churned customers paid higher monthly
--          charges, it could suggest price sensitivity or a perception that the
--          service wasn't worth the cost.
SELECT
    churned,
    AVG(monthly_charges) AS average_monthly_charges
FROM
    customer_data
GROUP BY
    churned;

-- No Data about GB data
-- No Data about tickets
-- No data about ratings
-- 3.6. Average Days Since Last Interaction for Churned vs. Non-Churned Customers
-- Purpose: Calculate the average number of days since the last interaction for customers
--          who churned compared to those who didn't.
-- Insight: Longer time since last interaction for churned customers may indicate
--          disengagement or neglect.
-- No Data

------------------------------------------------------------------------------------
-- 4. Advanced Analysis (Requires Subqueries)
------------------------------------------------------------------------------------

--No Data
-- 4.3. Customers Who Claimed Few Promotions and Churned
-- Purpose: Identify customers who churned and did not engage with promotions
-- Insight: May indicate a disconnect between the marketing efforts and the customer base.
-- 4.3. Customers Who Claimed Few Promotions and Churned
-- Purpose: Identify customers who churned and did not engage with promotions
-- Insight: May indicate a disconnect between the marketing efforts and the customer base.
SELECT customer_id
FROM customer_data
WHERE churned = 1; -- there no conditions for what you said