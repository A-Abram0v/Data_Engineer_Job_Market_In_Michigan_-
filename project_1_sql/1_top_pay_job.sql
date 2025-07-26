SELECT
    job_id,
    job_title,
    company_dim.name,
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