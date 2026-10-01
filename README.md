# Customer Churn Analysis

Python | SQL | Power BI

A project to find out how many customers left a business, which customers are more likely to leave, and why.

---

## Project Goals

- Find the overall churn rate
- Find which customer groups churn the most
- Find the behaviours and reasons linked to churn
- Suggest simple actions to keep more customers

---

## Dataset

- 50,000 customers (one row per customer), 17 columns
- Covers customer details, buying behaviour, satisfaction scores and whether the customer left

| Column | Meaning |
|---|---|
| CustomerID | Unique customer code |
| JoinDate, LastPurchaseDate | When the customer joined and last bought |
| Age, Gender | Age (21 to 67); Female, Male or Other |
| Region | North, South, East, West or Central |
| CustomerSegment | Startup, SMB, Mid-Market or Enterprise |
| ProductCategory | Subscription, Software, Consulting, Services or Hardware |
| TotalPurchases, TotalSpend | Number of purchases and money spent |
| AvgOrderValue | Average value of one order |
| DaysSinceLastPurchase | Days since the customer last bought |
| NumSupportTickets | Support tickets raised (0 to 19) |
| SatisfactionScore | Rating from 1 to 5 |
| NPSScore | Recommendation score from -100 to +100 |
| Churn | 1 = left, 0 = stayed |
| ChurnReason | Why the customer left (only for churned customers) |

---

## Tools Used

| Tool | Used for |
|---|---|
| Python (pandas) | Data cleaning and exploration |
| SQL | Summarising sales, satisfaction and NPS |
| Power BI | Dashboard (Executive Summary, Sales Performance, Churn Insights) |

---

## Project Structure

```
Customer-Churn-Analysis/
│
├── README.md
├── Data/
│   └── <your dataset file>
├── Notebooks/
│   └── DataCleaing.ipynb
├── SQL/
│   └── SQLQuery.sql
├── PowerBI/
│   └── <your .pbix file>
├── Images/
│   ├── Summary.png
│   ├── Sales.png
│   ├── Churn_Insights.png
│   └── ...
└── Report/
    └── Customer_Churn_Report.pdf
```

---

## Data Cleaning (Python)

- Removed 300 duplicate rows (50,300 rows became 50,000)
- Missing Age: filled with the median age
- Missing Region: filled with the most common region
- Missing AvgOrderValue: filled with the median of the same segment and purchase count
- Missing Satisfaction and NPS: filled with the median
- Customers who stayed were labelled "Not_Churned" in ChurnReason
- Converted dates to date type and Age to whole numbers
- Created an Age_Group column with three equal-size groups: Young (21-37), Adult (38-51), Senior (52-67)

---

## SQL Analysis

Queries in `SQL/SQLQuery.sql` cover:

- Total sales
- Sales by age group, region, gender, product category and customer segment
- Region-wise sales by customer segment
- Average satisfaction by age group
- Average satisfaction of churned vs retained customers
- NPS counts by age group
- Product category share of total sales
- Average days since last purchase by region and age group

---

## Key Numbers

| Measure | Value |
|---|---|
| Customers | 50,000 |
| Churned | 15,324 |
| Retained | 34,676 |
| Churn rate | 30.65% |
| Total customer spend | ₹1,248.7 million |
| Average order value | ₹1,576 |
| Average satisfaction (out of 5) | 3.01 |
| Average NPS | -0.03 |

- Subscription (24.8%) and Software (22.0%) bring in the most spend
- Hardware is the smallest (12.9%)

---

## Key Findings

**1. Startup customers churn the most**
- Startup churn rate is 36.5%
- Other segments are between 28.7% and 29.7%
- SMB has the most churned customers by count only because it is the largest segment. Its churn rate is one of the lowest.

**2. Who the customer is makes little difference**
- Churn is between 30.2% and 31.4% across every age group, gender, region and product category

**3. Unhappy customers leave more**
- Satisfaction 2.0 or below: 46.2% churn
- Satisfaction above 4.0: 16.7% churn
- NPS shows the same pattern

**4. Inactive customers leave more**
- Bought in the last 180 days: 17.6% churn
- No purchase for over 180 days: 35.1% churn

**5. Many support tickets go with higher churn**
- 10 tickets or fewer: 25.1% churn
- 11 or more tickets: 37.4% churn

**6. Top reasons for churn**
- Competitor (20.4%)
- Price (20.0%)
- Low ROI (14.9%)
- Poor support (14.7%)

---

## Recommendations

- Contact customers before they reach 180 days without a purchase
- Reach out quickly to customers who rate satisfaction 2.0 or below
- Escalate customers who raise many support tickets to a senior person
- Give Startup customers better onboarding and flexible pricing, and ask why they leave
- Review pricing and competitors, which together make up about 40% of churn reasons
- Track churn rate (not just counts) by segment

---

## Dashboard Preview

| Page | Preview |
|---|---|
| Home | ![Home](Images/Summary.png) |
| Customer Analysis | ![Customer Analysis](Images/Customer_Info.png) |
| Sales Performance | ![Sales](Images/Sales.png) |
| Churn Insights | ![Churn Insights](Images/Churn_Insights.png) |

---

## Author

**Mohammed Naveed**
- GitHub: [NaveedSultan](https://github.com/NaveedSultan)
- LinkedIn: [naveed1222](https://linkedin.com/in/naveed1222)
- Email: mohammednaveed1222@gmail.com
