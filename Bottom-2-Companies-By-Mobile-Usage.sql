/*
https://platform.stratascratch.com/coding/2026-bottom-2-companies-by-mobile-usage?python&utm_source=youtube&utm_medium=click&utm_campaign=YT+description+link

#Bottom 2 Companies By Mobile Usage- Microsoft-Medium

Write a query that returns a list of the bottom 2 companies by mobile usage. Mobile usage is defined as the number of events registered on a mobile client_id. Order the result by the number of events ascending.
In the case where there are multiple companies tied for the bottom ranks (rank 1 or 2), return all the companies.

--filter data on client_id so we are only looking at mobile usage
--count the number of events for mobile usage
--rank records based on count of events
--use outer query to fetch data for bottom 2 ranks from above query

*/


select  company, count_events
from 
    (select customer_id AS company, count(client_id) as count_events,
    dense_rank() OVER (ORDER BY count(client_id)) as event_rank
    from fact_events
    where client_id='Mobile'
    group by customer_id) t
where event_rank<=2
order by count_events ASC
