/*
https://platform.stratascratch.com/coding/2031-transactions-by-billing-method-and-signup-id?python&utm_source=youtube&utm_medium=click&utm_campaign=YT+description+link

#Transactions By Billing Method and Signup ID- Noom-Medium

Get list of signups which have a transaction start date earlier than 10 months ago from today. 
For all of those users get the average transaction value and group it by the billing cycle. 

Your output should include the billing cycle, signup_id of the user, and average transaction amount. 
Sort your results by billing cycle in reverse alphabetical order and signup_id in ascending order.
*/

--JOIN ALL 3 TABLEs together using signuo_id and plan_id
--filter the data on transactions that were made 10 months from today
--dateadd(month, -10, getdate())
--avg transaction amount for users by biling cycle
--sort data

select billing_cycle,
s.signup_id,
avg(amt) as avg_amt
from transactions t INNER JOIN signups s
ON t.signup_id=s.signup_id
INNER JOIN plans p 
ON p.id=s.plan_id
WHERE transaction_start_date < dateadd(MONTH, -10, GETDATE())
GROUP BY billing_cycle DESC,
        s.signup_id ASC
