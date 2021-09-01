/*
https://platform.stratascratch.com/coding/10300-premium-vs-freemium?python&utm_source=youtube&utm_medium=click&utm_campaign=YT+description+link

#Premium vs Freemium- Microsoft-Hard

Find the total number of downloads for paying and non-paying users by date. 
Include only records where non-paying customers have more downloads than paying customers. 
The output should be sorted by earliest date first and contain 3 columns date, non-paying downloads, paying downloads.

-- join 3 table
-- categorize paying and non-paying users
-- count total no. of downloads for each user type

*/



select * from
(select  date,
sum(CASE WHEN paying_customer='yes' THEN downloads END) AS paying,
sum(CASE WHEN paying_customer='no' THEN downloads END) AS non_paying
from ms_user_dimension u
LEFT JOIN ms_acc_dimension a ON u.acc_id=a.acc_id
LEFT JOIN ms_download_facts d ON u.user_id=d.user_id
group by date
order by date ASC) t
group by t.date, t.paying, t.non_paying
HAVING non_paying-paying>0
order by t.date ASC
