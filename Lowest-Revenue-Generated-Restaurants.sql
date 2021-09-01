/*
#Lowest Revenue Generated Restaurants- DoorDash-Hard

Write a query that returns a list of the bottom 2% revenue generating restaurants. 
Return a list of restaurant IDs and their total revenue from when customers placed orders in May 2020.
You can calculate the total revenue by summing the order_total column. And you should calculate the bottom 2% by partitioning the total revenue into evenly distributed buckets.

--Filter data to use only May 2020 using cutomer_placed_order_datetime
--calculate the revenue by sum(order_total) and group by restaurant_id
--find percentiles by splitting total order into even buckets using NTILE(50) to give 2% buckets
--isolate 1st ntile to get bottom 2% bucket
*/


WITH TEMP AS
(select restaurant_id,
sum(order_total) AS total_revenue,
ntile(50) OVER (order by sum(oredr_total))
from doordash_delivery
where cutomer_placed_order_datetime BETWEEN '2020-05-01' AND'2020-05-31'
group by restaurant_id)


select restaurant_id, total_revenue 
from TEMP
where ntile=1
order by total_revenue DESC
