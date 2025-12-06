/*
 Question: What are the top-paying "X Engineer" jobs?
 - Top 20 highest-paying that are available remote
 - Focus on posts with specified salaries (NO NULLS)
 
 Returns information about the top 20 highest paying Engineer jobs
 */
SELECT job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name -- attach company name
FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short LIKE '%Engineer' -- look for "X Engineer"
    AND job_location = 'Anywhere' -- available remote
    AND salary_year_avg IS NOT NULL -- specified salaries
ORDER BY salary_year_avg DESC -- pay from high-low
LIMIT 20;