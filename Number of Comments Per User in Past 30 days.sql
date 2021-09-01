/*
https://platform.stratascratch.com/coding/2004-number-of-comments-per-user-in-past-30-days?python&utm_source=youtube&utm_medium=click&utm_campaign=YT+description+link

#Number of Comments Per User in Past 30 days- Facebook-Easy

Return the total number of comments received for each user in the last 30 days. Assume today is 2020-02-10.
*/

--filter dataset from 2020-02-10 to 30 days before
--calculate sum of number of comments
-- group by user_id


select user_id,
sum(number_of_comments) as total_comments 
from fb_comments_count
where created_at BETWEEN dateadd(day, -30, cast('2020-02-10' AS date) and cast('2020-02-10' AS date)
group by user_id
