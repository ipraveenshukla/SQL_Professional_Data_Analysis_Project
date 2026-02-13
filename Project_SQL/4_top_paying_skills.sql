/*
QUESTION: What are the top skills based on salary?

--> Look at the average salary associated with each skill for Data Engineer positions.
--> Focus on roles with specified salaries, regardless of location.

WHY?
It reveals how different skills impact salary levels for Data Engineers
and helps identify the most financially rewarding skills to acquire or improve.
*/

SELECT 
    skills AS demanded_skill,
    ROUND (AVG(salary_year_avg),0) AS Annual_Salary
FROM job_postings_fact
INNER JOIN 
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Engineer'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    demanded_skill
ORDER BY
    Annual_Salary DESC
LIMIT 25

/*

Here’s a summary of the highest-paying skills for Data Engineers:

Assembly leads at $192.5K, earning $42.5K (+28%) more than VMware at $150K, showing a strong premium for low-level systems expertise.
Database and streaming skills average ~$162K, with Mongo, Neo4j, Cassandra, Redis, and Kafka driving high pay in distributed data roles.
Systems languages average ~$178K, as Assembly, Rust, and Clojure pay about 15–18% above the $150K salary cluster baseline.
AI and scientific tools average ~$163K, with ggplot2, Julia, NumPy, and MXNet consistently exceeding the lower salary tier.
Cloud and DevOps skills cluster near $155K, with Kubernetes, VMware, and Bitbucket showing stable but moderate salary premiums.

[
  {
    "demanded_skill": "assembly",
    "annual_salary": "192500"
  },
  {
    "demanded_skill": "mongo",
    "annual_salary": "182223"
  },
  {
    "demanded_skill": "ggplot2",
    "annual_salary": "176250"
  },
  {
    "demanded_skill": "rust",
    "annual_salary": "172819"
  },
  {
    "demanded_skill": "clojure",
    "annual_salary": "170867"
  },
  {
    "demanded_skill": "perl",
    "annual_salary": "169000"
  },
  {
    "demanded_skill": "neo4j",
    "annual_salary": "166560"
  },
  {
    "demanded_skill": "solidity",
    "annual_salary": "166250"
  },
  {
    "demanded_skill": "graphql",
    "annual_salary": "162547"
  },
  {
    "demanded_skill": "julia",
    "annual_salary": "160500"
  },
  {
    "demanded_skill": "splunk",
    "annual_salary": "160397"
  },
  {
    "demanded_skill": "bitbucket",
    "annual_salary": "160333"
  },
  {
    "demanded_skill": "zoom",
    "annual_salary": "159000"
  },
  {
    "demanded_skill": "kubernetes",
    "annual_salary": "158190"
  },
  {
    "demanded_skill": "numpy",
    "annual_salary": "157592"
  },
  {
    "demanded_skill": "mxnet",
    "annual_salary": "157500"
  },
  {
    "demanded_skill": "fastapi",
    "annual_salary": "157500"
  },
  {
    "demanded_skill": "redis",
    "annual_salary": "157000"
  },
  {
    "demanded_skill": "trello",
    "annual_salary": "155000"
  },
  {
    "demanded_skill": "jquery",
    "annual_salary": "151667"
  },
  {
    "demanded_skill": "express",
    "annual_salary": "151636"
  },
  {
    "demanded_skill": "cassandra",
    "annual_salary": "151282"
  },
  {
    "demanded_skill": "unify",
    "annual_salary": "151000"
  },
  {
    "demanded_skill": "kafka",
    "annual_salary": "150549"
  },
  {
    "demanded_skill": "vmware",
    "annual_salary": "150000"
  }
]

*/
