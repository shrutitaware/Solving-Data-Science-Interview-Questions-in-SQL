/*
https://platform.stratascratch.com/coding/10302-distance-per-dollar?python&utm_source=youtube&utm_medium=click&utm_campaign=YT+description+link

#Distance Per Dollar- Uber-Hard

You’re given a dataset of uber rides with the traveling distance (‘distance_to_travel’) and cost (‘monetary_cost’) for each ride. 
For each date, find the difference between the distance-per-dollar for that date and the average distance-per-dollar for that year-month. 
Distance-per-dollar is defined as the distance traveled divided by the cost of the ride.

The output should include the year-month (YYYY-MM) and the absolute average difference in distance-per-dollar (Absolute value to be rounded to the 2nd decimal). 
You should also count both success and failed request_status as the distance and cost values are populated for all ride requests. 
Also, assume that all dates are unique in the dataset. Order your results by earliest request date first.

*/

--date|distance/cost  - avg(distance/cost) for month
--01-01-2020 | 5 miles per dollar - 4 miles per dollar
--01-22-2020 | 9 miles per dollar - 4 miles per dollar
--02-01-2020 | 4 miles per dollar - 3 miles per dollar

select  sub1.request_month_year,
cast(abs(sub1.dist_per_dollar-sub1.avg_dist_per_dollar) as decimal(10,2)) as abs_difference
from
    (select sub.request_date, sub.request_month_year,
        sub.dist_per_dollar,
        avg(sub.dist_per_dollar) over (partition by sub.request_month_year) AS avg_dist_per_dollar
    from
        (select *,
            to_char(cast(request_date as date),'yyyy-MM') as request_month_year,
            (distance_to_travel/monetary_cost) AS dist_per_dollar
        from uber_request_logs) sub ) sub1
group by sub1.request_month_year, abs_difference
order by sub1.request_month_year
