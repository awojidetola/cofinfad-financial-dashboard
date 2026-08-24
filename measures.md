# DAX Measures

This file documents the DAX measures used in the COFINFAD Financial Analysis Power BI dashboard.

## Customer Metrics

### Number of Customers

Counts the customer records in the customer dimension.

```DAX
no_customers =
COUNT(dim_customer[customer_id])
```

### Transacting Customers

Counts distinct customers with transaction records.

```DAX
Transacting Customers =
DISTINCTCOUNT(fact_transactions[customer_id])
```

## Product Adoption

### Adopted Customers

Counts distinct customers who have adopted the selected product.

```DAX
Adopted Customers =
CALCULATE(
    DISTINCTCOUNT(customer_product[customer_id]),
    customer_product[adopted] = TRUE()
)
```

### Product Adoption Rate

Calculates product adoption as the number of adopted customers divided by the number of customers represented in the customer-product table.

```DAX
Product Adoption Rate =
DIVIDE(
    [Adopted Customers],
    DISTINCTCOUNT(customer_product[customer_id])
)
```

### Auto-Savings Enabled Rate

Calculates the proportion of customers with auto-savings enabled.

```DAX
Auto Savings Enabled Rate =
DIVIDE(
    CALCULATE(
        [no_customers],
        'dim_customer'[auto_savings_enabled] = TRUE()
    ),
    [no_customers],
    0
)
```

### Personal Loan Adoption Rate

Calculates the proportion of customers with a personal loan.

```DAX
Personal Loan Adoption Rate =
DIVIDE(
    CALCULATE(
        [no_customers],
        'dim_customer'[personal_loan] = TRUE()
    ),
    [no_customers],
    0
)
```

## Acquisition

### Organic Customers

Counts customers acquired through the organic acquisition channel.

```DAX
Organic Customers =
CALCULATE(
    [no_customers],
    'dim_customer'[acquisition_channel] = "organic"
)
```

## Transaction Metrics

### Number of Transactions

Counts transaction records in the transaction fact.

```DAX
no_transactions =
COUNT(fact_transactions[amount])
```

### Average Transaction Value

Calculates total transaction value divided by the number of customers.

```DAX
Avg. Transaction Value =
DIVIDE(
    SUM(fact_transactions[amount]),
    [no_customers]
)
```

### Average Transaction Volume

Calculates total transaction volume divided by the number of customers.

```DAX
Avg. Transaction Volume =
DIVIDE(
    [no_transactions],
    [no_customers]
)
```
