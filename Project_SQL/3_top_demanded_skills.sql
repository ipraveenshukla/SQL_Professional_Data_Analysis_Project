/*
QUESTION: What are the most in-demand skills for a Data Analyst?

--> Join job postings using an inner join to the table similar to Query 2.
--> Identify the top 5 in-demand skills for a Data Analyst.
--> Focus on all job postings.

WHY?
This retrieves the top 5 skills with the highest demand in the job market,
providing insights into the most valuable skills for job seekers.
*/


SELECT 
    skills AS demanded_skill,
    COUNT (job_postings_fact.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN 
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    demanded_skill
ORDER BY
    demand_count DESC
LIMIT 5


-- Similarly, TOP 5 in-demand skills for a (Work-from-Home) Data Analyst -


SELECT 
    skills AS demanded_skill,
    COUNT (job_postings_fact.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN 
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE
GROUP BY
    demanded_skill
ORDER BY
    demand_count DESC
LIMIT 5


-- Similarly, the top 5 in-demand skills for a Data Analyst looking to work in (India)


SELECT 
    skills AS demanded_skill,
    COUNT (job_postings_fact.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN 
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'India'
GROUP BY
    demanded_skill
ORDER BY
    demand_count DESC
LIMIT 5