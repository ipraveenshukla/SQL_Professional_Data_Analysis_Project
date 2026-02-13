/*
QUESTION: What skills are required for the top-paying Data Scientist jobs?

--> Use the top 10 highest-paying Data Scientist jobs from the first query.
--> Add the specific skills required for these roles.

WHY? 
It provides a detailed look at which high-paying jobs demand certain skills,
helping job seekers understand which skills to develop that align with top salaries.
*/


WITH Top_Paying_Jobs AS
(
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
)
SELECT 
    skills_dim.skills AS Required_Skill,
    Top_Paying_Jobs.* 
FROM
    Top_Paying_Jobs
INNER JOIN 
    skills_job_dim ON Top_Paying_Jobs.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC
LIMIT 10;


/*
Here are the insights from top 10 Data Scientist roles (2023)

- SQL appears in 30% of roles, highest demanded skill.
- Python required in 20% of postings.
- 7 unique skills identified across 10 total mentions.
- SQL and Python form 50% of total skill demand.


[
  {
    "required_skill": "sql",
    "job_id": 40145,
    "job_title": "Staff Data Scientist/Quant Researcher",
    "salary_year_avg": 550000,
    "company_name": "Selby Jennings",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-08-16 16:05:16"
  },
  {
    "required_skill": "python",
    "job_id": 40145,
    "job_title": "Staff Data Scientist/Quant Researcher",
    "salary_year_avg": 550000,
    "company_name": "Selby Jennings",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-08-16 16:05:16"
  },
  {
    "required_skill": "sql",
    "job_id": 1714768,
    "job_title": "Staff Data Scientist - Business Analytics",
    "salary_year_avg": 525000,
    "company_name": "Selby Jennings",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-09-01 19:24:02"
  },
  {
    "required_skill": "sql",
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "salary_year_avg": 375000,
    "company_name": "Algo Capital Group",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-07-31 14:05:21"
  },
  {
    "required_skill": "python",
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "salary_year_avg": 375000,
    "company_name": "Algo Capital Group",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-07-31 14:05:21"
  },
  {
    "required_skill": "java",
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "salary_year_avg": 375000,
    "company_name": "Algo Capital Group",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-07-31 14:05:21"
  },
  {
    "required_skill": "cassandra",
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "salary_year_avg": 375000,
    "company_name": "Algo Capital Group",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-07-31 14:05:21"
  },
  {
    "required_skill": "spark",
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "salary_year_avg": 375000,
    "company_name": "Algo Capital Group",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-07-31 14:05:21"
  },
  {
    "required_skill": "hadoop",
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "salary_year_avg": 375000,
    "company_name": "Algo Capital Group",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-07-31 14:05:21"
  },
  {
    "required_skill": "tableau",
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "salary_year_avg": 375000,
    "company_name": "Algo Capital Group",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-07-31 14:05:21"
  }
]

*/