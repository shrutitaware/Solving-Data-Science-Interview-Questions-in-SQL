/*
https://platform.stratascratch.com/coding/9637-growth-of-airbnb?python&utm_source=youtube&utm_medium=click&utm_campaign=YT+description+link

#Growth of Airbnb- Airbnb-Hard

Estimate the growth of Airbnb each year using the number of hosts registered as the growth metric. 
The rate of growth is calculated by taking 
((number of hosts registered in the current year - number of hosts registered in the previous year) / the number of hosts registered in the previous year) * 100.
Output the year, number of hosts in the current year, number of hosts in the previous year, and the rate of growth. 
Round the rate of growth to the nearest percent and order the result in the ascending order based on the year.
Assume that the dataset consists only of unique hosts, meaning there are no duplicate hosts listed.

--count number of hosts by year: cast to date data type and extract only year
--create a view with year, number of hosts for current year, number of hosts for previous year (lag())
--calculate the growth rate equation= round( (current_year_hosts-previous_year_hosts)/previous_year_hosts*100)
*/


select year,
    round(cast((current_year_hosts-prev_year_hosts) as float) /(prev_year_hosts)*100) AS growth_rate
from
(select year,
current_year_hosts,
lag(current_year_hosts,1) over (order by year) AS prev_year_hosts
from
(select to_char(cast( host_since as date),'yyyy') as year, count(id)as current_year_hosts
from airbnb_search_details
where host_since IS NOT NULL
group by to_char(cast( host_since as date),'yyyy')
order by year) a ) b
