/*
https://platform.stratascratch.com/coding/10303-top-percentile-fraud?python&utm_source=youtube&utm_medium=click&utm_campaign=YT+description+link

#Top Percentile Fraud- Netflix-Hard

ABC Corp is a mid-sized insurer in the US and in the recent past their fraudulent claims have increased significantly for their personal auto insurance portfolio. They have developed a ML based predictive model to identify propensity of fraudulent claims. Now, they assign highly experienced claim adjusters for top 5 percentile of claims identified by the model.
Your objective is to identify the top 5 percentile of claims from each state. Your output should be policy number, state, claim cost, and fraud score.
*/

select policy_num,
state,
claim_cost,
fraud_score
from
(select *,
ntile(100) over (partition by state order by fraud_score desc) as percentile
from fraud_score) a
where percentile<6
