# **COFINFAD Financial Analysis**

## **Overview**

The COFINFAD (Colombian Fintech Financial Analytics Dataset) contains behavioural and transactional data from 48,723 customers of a Colombian fintech company, collected over 12 months from 4 January 2023 to 29 December 2023. The dataset contains 3,159,157 transactions and covers customer demographics, transaction behaviour, product adoption, application usage and customer satisfaction. ([Mendeley Data](https://data.mendeley.com/datasets/mhb4zn3258/1 "COFINFAD: Colombian Fintech Financial Analytics Dataset - Mendeley Data")). This project uses the COFINFAD dataset to develop a decision-driven Power BI dashboard designed to support business performance monitoring and stakeholder decision-making.

## **Aim:**

To understand the overall health and performance of the business, identify areas requiring attention, and highlight opportunities across customer acquisition, product adoption and financial performance.

## **Stakeholders & Business Objectives**

**1. Marketing / Customer Acquisition**: Understand which acquisition channels and customer groups attract valuable customers.

**2. Product:** Understand and improve adoption of the organisation's financial products and digital services.

**3. Finance:** Understand transaction activity and customer financial behaviour to support financial performance monitoring.

**4. Executive Management:** Monitor overall business health and performance, identify areas requiring attention, and highlight potential opportunities across the organisation.

## **Core Business Questions**

The dashboard was designed to answer the following questions:

1. How is the overall customer base performing?
2. What is the overall transaction activity, and how is it changing over time?
3. What is the overall level of customer satisfaction?
4. How well are customers adopting financial products?
5. Which customer segments represent the strongest opportunities?
6. Which acquisition channels and customer groups attract the greatest customer and transaction value?
7. Which areas of the business require further investigation or present potential opportunities?

For this project, not all the source variables were included in the final analytical model. The variables included are those that can answer the core business questions and are relevant to the stakeholders identified above.

## **Data Modelling**

The source data was modelled to support analysis at both the customer and transaction levels. The analytical model was designed and prepared in **Google BigQuery**, with the final tables connected directly to Power BI for dashboard development.

The model consists primarily of:

* **Dim Customer** : customer demographics, acquisition, product adoption, digital engagement and customer satisfaction attributes.
* **Dim Date**: transaction dates used for time-based analysis.
* **Fact Transactions**: transaction date, customer, transaction amount and transaction type.

The transaction fact has a grain of **one transaction record per customer per date**.

![Power BI Data Model](<dashboard images/pg 0 - data model.PNG>)

## **Dashboard**

The final dashboard was developed in **Microsoft Power BI**, with the analytical data sourced directly from the **BigQuery model**.

The dashboard consists of three pages:

### **Executive Overview**

Provides a high-level view of overall business health, including customer performance, transaction activity, satisfaction, product adoption and key trends.

![Executive Overview](<dashboard images/pg1 - executive overview.PNG>)

### **Market Analysis**

Focuses on customer acquisition, customer segments, product adoption and digital engagement.

![Market Analysis](<dashboard images/pg 2 - market analysis.PNG>)

### **Financial Performance**

Focuses on transaction activity, transaction value, customer financial behaviour and high-value customer segments.

![Financial Performance](<dashboard images/pg 3 - financial performance.PNG>)

## **Key Findings**

COFINFAD’s transaction activity is concentrated around a small number of important customer and acquisition segments. Organic acquisition is the largest source of both customers and transaction value, while savings accounts and credit cards lead product adoption. Transfers dominate overall transaction activity, and power customers represent a very valuable segment, contributing around 31% of transaction value despite comprising only about 10% of the customer base.

1. Organic acquisition is the strongest source of customers and transaction value. It accounts for approximately 41% of the customer base and generates $5.3T (42.2%) of the total transaction value, the highest transaction value of any acquisition channel. This is followed by referrals which generate $3.8T (30.3%)

2. Product Adoption is strongest for savings accounts, with adoption generally higher among higher income customers. Savings accounts have an overall adoption of 79%, followed by 63% for credit cards.

| **Income Level** | **Savings Account** | **Credit Card** |
| ---------------- | ------------------: | --------------: |
| High             |                 96% |             81% |
| Low              |                 57% |             44% |
| Medium           |                 81% |             61% |
| Very High        |                100% |             98% |

3. Transfers dominate transaction activity and value. Among the transaction types, they account for approximately 1.43M transactions (46.7%) and $6.1T in transaction value (48.6%), making them the largest transaction type by both volume and value. The average value per transaction is approximately $4.36M.

| **Transaction Type** | **Transaction Value** | **Transaction Volume** | **Avg. Value per Transaction** |
| -------------------- | --------------------: | ---------------------: | -----------------------------: |
| Transfer             |                 $6.1T |                  1.43M |                        $4.36M |
| Payment              |                 $4.1T |                  1.00M |                        $4.10M |
| Withdrawal           |                 $1.3T |                  0.46M |                        $3.00M |
| Deposit              |                 $0.9T |                  0.30M |                        $3.00M |

4. Power customers (segment) are very valuable to the business. While they represent about 10% of customers, they account for approximately 31% of total transaction value. They have an average yearly transaction value per customer of $1.20B compared to $298.5M of regular customers. They also have the highest average transaction activity per customer, contributing disproportionately to overall financial performance.

Although the proportion of power customers is highest in the Very High income band (11.82%), power customers are present across all income groups (between 9% and 10%), indicating that high income alone does not define the segment.

| **Customer Segment** | **Avg. Transaction Value per Customer** | **Avg. Transaction Volume per Customer** |
| -------------------- | --------------------------------------: | ---------------------------------------: |
| Inactive             |                                $23.73M |                                    59.33 |
| Occasional           |                               $103.59M |                                    63.51 |
| Power                |                                 $1.20B |                                    86.84 |
| Regular              |                               $298.52M |                                    63.02 |

## Recommendations

1. Develop a loyalty strategy around power customers: Benefits can be designed around transaction activity and product engagement rather than income alone. This can include preferential benefits, incentives or targeted rewards to retain power customers and encourage potential customers from other segments to progress into the power segment. Loyalty programs need not be built around wealth alone, especially as there are power customers across various income groups.

2. Strengthen organic acquisition by investigating the factors contributing to its strong performance Customer ratings, app-store perception and customer feedback could be investigated as potential drivers of organic acquisition, alongside other acquisition factors.

3. Strengthen referral acquisition by testing targeted referral incentives and referral programmes. Referral is the second-largest acquisition channel by transaction value ($3.8Tr), suggesting an opportunity to investigate whether existing customers can be encouraged to acquire additional customers through structured referral initiatives.

4. Protect and strengthen transaction journeys customers already use. Results show that transfers dominate customer activity. Review support tickets, customer feedback for friction associated with other transaction methods. A/B testing of new methods and experiences could be used to evaluate opportunities to increase adoption of other transaction types. Additionally, research into how to make transfers even more seamless for customers.

5. Improve adoption of lower performing products. The savings product has a strong adoption at 79%, however the other products have considerably lower adoption. Invest barriers to adoption and improve customer experience around them. Customer feedback and support ticket data should be used to identify specific friction points before introducing new product features.

## **Tools Used:**

Big Query: Data Preparation, Transformation and Analytical Modelling

Power BI: Data visualisation and dashboard development

Figma: Dashboard wireframing

## **Repository Structure**


```text

cofinfad-financial-dashboard/
├── dashboard images/   # Final Power BI dashboard pages
├── measures.md         # DAX measures used in the analysis
├── schema.sql          # BigQuery analytical schema
└── cofinfad.pbix       # Power BI dashboard file
└── README.md           # Project overview, analysis and recommendations

```

## **Data Credits**

Muñoz Guerrero, Luis Eduardo; Ceballos, Yony Fernando; Trejos Rojas, Luis David (2025), “COFINFAD: Colombian Fintech Financial Analytics Dataset”, Mendeley Data, V1, doi: 10.17632/mhb4zn3258.1
