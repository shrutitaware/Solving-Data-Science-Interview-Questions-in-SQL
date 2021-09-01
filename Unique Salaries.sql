/*
https://platform.stratascratch.com/coding/9898-unique-salaries?python&utm_source=youtube&utm_medium=click&utm_campaign=YT+description+link

#Unique Salaries- Twitter-Hard

Find the top three unique salaries for each department. Output the department name and the top 3 unique salaries by each department. 
Order your results alphabetically by department and then by highest salary to lowest.
*/

SELECT DEPARTMENT, SALARY, RANK_ID
FROM
    (select department, salary, rank() over (partition by department order by salary desc) as rank_id
    from
        (select department,  salary
        from twitter_employee
        group by department,  salary
        order by department, salary) a) b
where rank_id<4
