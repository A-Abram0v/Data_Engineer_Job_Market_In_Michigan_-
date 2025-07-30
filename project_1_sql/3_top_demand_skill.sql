SELECT
    skills_dim.skills AS skill_name,
    COUNT(*) AS skill_count
FROM skills_job_dim
INNER JOIN job_postings_fact ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_title_short = 'Data Engineer'
GROUP BY skill_name
ORDER BY skill_count DESC
LIMIT 5