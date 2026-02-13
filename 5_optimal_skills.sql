/*
QUESTION: What are the most optimal skills to learn (because they are in high demand and high-paying)?

--> Identify skills that are in high demand and associated with high average salaries for Data Analyst roles.
--> Focus on remote positions with specified salaries.

WHY?
Target skills that offer job security (high demand) and financial benefits (high salaries),
providing strategic insights for career development in data analysis.
*/

SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT (job_postings_fact.job_id) AS demand_count,
    ROUND (AVG (job_postings_fact.salary_year_avg),0) AS average_annual_salary
FROM
    job_postings_fact
INNER JOIN 
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home IS TRUE
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT (job_postings_fact.job_id) > 10
    AND ROUND (AVG (job_postings_fact.salary_year_avg),0) > 50000
ORDER BY
    average_annual_salary DESC,
    demand_count DESC
LIMIT 25;