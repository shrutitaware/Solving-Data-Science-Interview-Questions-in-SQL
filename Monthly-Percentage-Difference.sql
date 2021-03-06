[YouTube - Nate at StrataScratch] (https://www.youtube.com/watch?app=desktop&v=QenwDm5oWdU&t=236s)
[Coding Platform] (https://platform.stratascratch.com/coding/10319-monthly-percentage-difference?python&utm_source=youtube&utm_medium=click&utm_campaign=YT+description+link)
/*
# Monthly Percentage Difference- Amazon-Hard

Given a table of purchases by date, calculate the month-over-month percentage change in revenue. The output should include the year-month date (YYYY-MM) and 
percentage change, rounded to the 2nd decimal point, and sorted from the beginning of the year to the end of the year.
The percentage change column will be populated from the 2nd month forward and can be calculated as ((this month's revenue - last month's revenue) / last month's revenue)*100.


-- YYYY-MM, MoM %Change
--required: created_at, value
-- %change rounded to 2nd decimal
--order by year

--Step 1: cast to date and then forrmat yyyy-mm

--Step 2: Formaula: MoM %change = ((this month's revenue - last month's revenue) / last month's revenue)*100
--a. total value for current month
--b. total value for last month
--c aggregated by yyyy-mm
--d. round to 2nd decimal
*/

select  
  to_char(cast(created_at as date),'YYYY-MM') as year_month,
  ROUND(((sum(value) - lag(sum(value),1) over (w))/
  lag(sum(value),1) over (w))*100,2) as Percent_Change
from sf_transactions
group by year_month
WINDOW w AS (order by to_char(cast(created_at as date),'YYYY-MM'))
order by year_month
