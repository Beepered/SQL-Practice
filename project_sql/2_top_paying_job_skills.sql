/*
 Question: What skills are required for top paying roles?
 - Find top 20 highest-paying "X Engineer" jobs
 - Get skills required
 */
WITH top_paying_jobs AS (
    SELECT job_id,
        job_title,
        salary_year_avg,
        name AS company_name -- attach company name
    FROM job_postings_fact
        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE job_title_short LIKE '%Engineer' -- look for "X Engineer"
        AND salary_year_avg IS NOT NULL -- specified salaries
)
SELECT top_paying_jobs.*,
    skills
FROM top_paying_jobs
    INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC
LIMIT 20;
/*
 Gets required information from jobs (salary, Engineer roles)
 Compares the skills with the top paying jobs
 Returns top 20 jobs
 */