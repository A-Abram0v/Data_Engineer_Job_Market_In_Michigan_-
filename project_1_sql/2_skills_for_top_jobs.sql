WITH top_10_jobs AS(
SELECT
    job_id,
    job_title,
    company_dim.name AS company_name,
    job_schedule_type,
    job_location,
    salary_year_avg,
    job_posted_date
FROM job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id=job_postings_fact.company_id
WHERE job_location LIKE '%MI'
    AND salary_year_avg IS NOT NULL
    AND job_title_short = 'Data Engineer'
ORDER BY salary_year_avg DESC
LIMIT 10
)
SELECT 
    top_10_jobs.*,
    skills_dim.skills
FROM top_10_jobs
INNER JOIN skills_job_dim ON skills_job_dim.job_id = top_10_jobs.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
