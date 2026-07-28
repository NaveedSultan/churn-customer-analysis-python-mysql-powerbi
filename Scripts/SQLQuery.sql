-- Total Sales 
SELECT round(sum(TotalSpend),2)as Total_Sales from churn_info;

-- Total_Sales from Customer Age_Group
SELECT Age_Group,sum(totalSpend) as Age_group_Sales from churn_info
GROUP by Age_Group
order by sum(TotalSpend) desc;


-- Total_Sales from Region 
SELECT Region,sum(TotalSpend) as Region_Sales from churn_info 
group by Region
order by sum(TotalSpend) desc;

-- Total_Sales from Product_category
SELECT ProductCategory,sum(TotalSpend) as Product_Sales from churn_info
group by ProductCategory
order by sum(TotalSpend) desc;

-- Avg Satisfaction from Customer Age_group
SELECT Age_Group,round(avg(SatisfactionScore),2) as Avg_Satisfaction from churn_info
GROUP by Age_Group
order by AVG(SatisfactionScore)DESC;


-- Total Sales from Male and Female 
SELECT Gender,sum(TotalSpend) as SalesByGender from churn_info
GROUP by Gender
ORDER by sum(TotalSpend) desc;

-- Avg_Churn/NotChurned 
SELECT 
	round(Avg(case when ChurnReason='Not_Churned' then SatisfactionScore end),2)as Avg_NotChurned,
	round(AVG( case when ChurnReason !='Not_Churned' then SatisfactionScore end),2) as Avg_Churn
from churn_info ;

-- Avg_Churn/NotChurned from Age_Group
SELECT Age_Group,
	round(Avg(case when ChurnReason='Not_Churned' then SatisfactionScore end),2)as Avg_NotChurned,
	round(AVG( case when ChurnReason !='Not_Churned' then SatisfactionScore end),2) as Avg_Churn
from churn_info 
GROUP BY Age_Group;


-- NPS Counts
SELECT Age_Group,COUNT(case when NPSScore <=0 then 'Bad' end )as Count_Bad,
   COUNT(case when NPSScore BETWEEN 1 and 50 then 'Avg'end )AS Count_Avg,
   COUNT(case when NPSScore BETWEEN 51 and 70 then 'Excellent'end )as Count_Excellent ,
   COUNT(case when NPSScore > 70 then 'World_class' end)as Count_WorldClass
from churn_info
GROUP by Age_Group;


-- product Category percentage 
SELECT
    ProductCategory,
    SUM(TotalSpend) AS Total_Sales,
    ROUND(
        SUM(TotalSpend) * 100.0 /
        SUM(SUM(TotalSpend)) OVER (),
        2
    ) AS Percentage
FROM churn_info
GROUP BY ProductCategory;                                


SELECT  Region,AVG(DaysSinceLastPurchase) as Avg_days,
	round(avg(DaysSinceLastPurchase)*100.0/sum(avg(DaysSinceLastPurchase)) over(),2) as Avg_Percent
from churn_info
group by Region
order by Avg_Percent DESC;


-- Avg days since last day visit
SELECT  Age_Group,AVG(DaysSinceLastPurchase) as Avg_days,
	round(avg(DaysSinceLastPurchase)*100.0/sum(avg(DaysSinceLastPurchase)) over(),2) as Avg_Percent
from churn_info
group by Age_Group
order by Avg_Percent DESC

-- Customer-Segment 
SELECT CustomerSegment,round(SUM(TotalSpend),2) as Total_Sales from churn_info
GROUP by CustomerSegment
order by round(SUM(TotalSpend),2) desc;

-- Region wise Customer-Segment 
SELECT Region,CustomerSegment,round(sum(TotalSpend),2) as TotalRegionSales from churn_info
GROUP by Region,CustomerSegment; 
