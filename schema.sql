-- Create Dim Date --
CREATE OR REPLACE TABLE `digital-finance-analysis.cofinfad.dim_date`AS (
SELECT DISTINCT
    FORMAT_DATE('%Y%m%d', date) AS date_key,
    date AS transaction_date
FROM `digital-finance-analysis.cofinfad.transactions_data`);

-- Create FactTransactions
CREATE OR REPLACE TABLE `digital-finance-analysis.cofinfad.fact_transactions`AS (
SELECT customer_id, FORMAT_DATE('%Y%m%d', date) AS date_key, amount, type
FROM `digital-finance-analysis.cofinfad.transactions_data`);

-- Create Dim Customer
CREATE OR REPLACE TABLE `digital-finance-analysis.cofinfad.dim_customer` AS

SELECT
    customer_id, 
    age,
    gender,
    location,
    income_bracket,
    occupation,
    education_level,
    marital_status,
    household_size,

    acquisition_channel,
    customer_segment,

    savings_account,
    credit_card,
    personal_loan,
    investment_account,
    insurance_product,

    app_logins_frequency,
    feature_usage_diversity,
    auto_savings_enabled,
    failed_transactions,
    product_satisfaction,
    satisfaction_score,
    nps_score,
    support_tickets_count,
    resolved_tickets_ratio,
    app_store_rating,
    feedback_sentiment,
    feature_requests,
    complaint_topics

FROM `digital-finance-analysis.cofinfad.customer_data`;
