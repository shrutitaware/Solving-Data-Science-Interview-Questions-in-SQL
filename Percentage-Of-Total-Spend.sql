/*
https://platform.stratascratch.com/coding/9899-percentage-of-total-spend?python&utm_source=youtube&utm_medium=click&utm_campaign=YT+description+link

#Percentage Of Total Spend - Amazon-Hard

Calculate the percentage of the total spend a customer spent on each order. Output the customer’s first name, order details, and 
percentage of the order cost to their total spend across all orders. 
Assume each customer has a unique first name (i.e., there is only 1 customer named Karen in the dataset) and that customers place at most only 1 order a day.
Percentages should be represented as fractions

-- join orders table with customers table inner join
-- sum of total amount spent by each customer
--find % totalspent = total_order_cost/sum(total_order_cost) by customer
--round(*100)
*/



select first_name,
order_details,
round(cast(total_order_cost/ sum(total_order_cost) over (partition by first_name) as float)*100)  AS PERCENTAGE_TOTAL_SPENT
from Orders o INNER JOIN
Customers c ON
o.cust_id=c.id
order by first_name
