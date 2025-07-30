SELECT
    skills_dim.skills,
    AVG(salary_year_avg) AS salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE salary_year_avg IS NOT NULL
    AND job_title_short = 'Data Engineer'
GROUP BY skills_dim.skills
ORDER BY salary DESC
LIMIT 5