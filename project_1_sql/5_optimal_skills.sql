SELECT 
    COUNT(job_postings_fact.job_id) AS job_count,
    skills_dim.skills,
    AVG(salary_year_avg) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE salary_year_avg IS NOT NULL
    AND job_title_short = 'Data Engineer'
    AND job_location LIKE '%MI'
GROUP BY skills_dim.skills
ORDER BY job_count DESC
LIMIT 10;