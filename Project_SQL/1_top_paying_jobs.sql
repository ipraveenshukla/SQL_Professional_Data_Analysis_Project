/*
Question: What are the top-paying Data Scientist jobs?
--> Identify the top 10 highest-paying Data Scientist roles that are available remotely.
--> Focuses on job postings with specified salaries (remove NULL)
--> Why? To highlight top-paying Data Scientist roles and reveal key job market insights.
*/

SELECT
    job_id,
    job_title,
    salary_year_avg,
    company_dim.name AS Company_Name,
    job_location,
    job_schedule_type,
    job_posted_date
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Scientist' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC

LIMIT 10;