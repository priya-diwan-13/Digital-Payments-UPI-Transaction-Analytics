create database upi_analytics_project;

use upi_analytics_project; 

select * from cleaned_upi_transactions_CSV;

# 1.Check First 10 Records
select *
from cleaned_upi_transactions_CSV 
limit 10; 

# 2.Total Rows
select count(*) as Total_Rows
from cleaned_upi_transactions_CSV;

# 3.Date Range
select
    min(str_to_date(Date, '%m/%d/%Y')) as Start_Date,
    MAX(str_to_date(Date, '%m/%d/%Y')) as End_Date
from cleaned_upi_transactions_CSV;

# App Analysis
# 4.App-wise Total Transaction Value
select
    App_Name,
    sum(`Total_Value(Cr)`)  Total_Value
from cleaned_upi_transactions_CSV
group by App_Name
order by Total_Value desc;

# 5.App-wise Transaction Volume
select
    App_Name,
    sum(`Total_Volume(Mn)`) as Total_Volume
from cleaned_upi_transactions_CSV
group by App_Name
order by Total_Volume desc;

# Time Analysis
# 6.Year-wise Transaction Analysis
select
    Year,
    sum(`Total_Volume(Mn)`) as Total_Volume,
    sum(`Total_Value(Cr)`) as Total_Value
from cleaned_upi_transactions_CSV
group by Year
order by Year;

# 7.Quarter-wise Analysis
select
    Year,
    Quarter,
    sum(`Total_Volume(Mn)`) as Total_Volume,
    sum(`Total_Value(Cr)`) as Total_Value
from  cleaned_upi_transactions_CSV
group by Year, Quarter
order by Year, Quarter;

# 8.Month-wise Analysis
select
    Year,
    Month_Name,
    sum(`Total_Volume(Mn)`) as Total_Volume,
    sum(`Total_Value(Cr)`) as Total_Value
from cleaned_upi_transactions_CSV
group by Year, Month_Name
order by Year, Month_Name;

# segment analysis
# 9.B2C vs B2B Comparison
select
    sum(`B2C_Volume(Mn)`) as B2C_Volume,
    sum(`B2C_Value(Cr)`) as B2C_Value,
    sum(`B2B_Volume(Mn)`) as B2B_Volume,
    sum(`B2B_Value(Cr)`) as B2B_Value
from  cleaned_upi_transactions_CSV;

# 10. Customer vs B2C vs B2B Transaction Value

select
    sum(`Customer_Value(Cr)`) as Customer_Value,
    sum(`B2C_Value(Cr)`) as B2C_Value,
    sum(`B2B_Value(Cr)`) as B2B_Value
from cleaned_upi_transactions_CSV;

# 11. Year-wise Segment Transaction Volume

select
    Year,
    sum(`Customer_Volume(Mn)`) as Customer_Volume,
    sum(`B2C_Volume(Mn)`) as B2C_Volume,
    sum(`B2B_Volume(Mn)`) as B2B_Volume
from cleaned_upi_transactions_CSV
group by Year
order by Year;

# 12.App-wise B2C vs B2B
select
    App_Name,
    sum(`B2C_Value(Cr)`) as B2C_Value,
    sum(`B2B_Value(Cr)`) as B2B_Value
from  cleaned_upi_transactions_CSV
group by App_Name
order by App_Name;

# Top app analysis
# 13.Top 5 Apps by Transaction Value
select
    App_Name,
    sum(`Total_Value(Cr)`) as Total_Value
from cleaned_upi_transactions_CSV
group by App_Name
order by Total_Value desc
limit 5;

# 14. Top 5 Apps by Transaction Volume

select
    App_Name,
    SUM(`Total_Volume(Mn)`) as Total_Volume
from cleaned_upi_transactions_CSV
group by App_Name
order by Total_Volume desc
limit 5;

# 15.Overall UPI Performance
select
    sum(`Total_Volume(Mn)`) as Total_Volume,
    sum(`Total_Value(Cr)`) as Total_Value,
    sum(`Customer_Volume(Mn)`) as Customer_Volume,
    sum(`Customer_Value(Cr)`) as Customer_Value,
    sum(`B2C_Volume(Mn)`) as B2C_Volume,
    sum(`B2C_Value(Cr)`) as B2C_Value,
    sum(`B2B_Volume(Mn)`) as B2B_Volume,
    sum(`B2B_Value(Cr)`) as B2B_Value
from cleaned_upi_transactions_CSV;

