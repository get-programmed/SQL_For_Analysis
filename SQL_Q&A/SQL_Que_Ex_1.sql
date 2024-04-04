CREATE TABLE rsc.job_table (
    JOB_ID INT,
    MEMBER_ID INT,
    JOB_POSTING_DATE DATE
);





INSERT INTO rsc.job_table (JOB_ID, MEMBER_ID, JOB_POSTING_DATE) VALUES (1001, 1, '2023-04-14');
INSERT INTO rsc.job_table (JOB_ID, MEMBER_ID, JOB_POSTING_DATE) VALUES (1002, 1, '2023-08-14');
INSERT INTO rsc.job_table (JOB_ID, MEMBER_ID, JOB_POSTING_DATE) VALUES (1003, 2, '2023-05-31');
INSERT INTO rsc.job_table (JOB_ID, MEMBER_ID, JOB_POSTING_DATE) VALUES (1004, 3, '2022-08-23');
INSERT INTO rsc.job_table (JOB_ID, MEMBER_ID, JOB_POSTING_DATE) VALUES (1005, 3, '2023-04-28');
INSERT INTO rsc.job_table (JOB_ID, MEMBER_ID, JOB_POSTING_DATE) VALUES (1006, 3, '2023-05-23');
INSERT INTO rsc.job_table (JOB_ID, MEMBER_ID, JOB_POSTING_DATE) VALUES (1007, 3, '2023-07-08');



/*
Here we introduce some marketing acquisition concepts:
- New job posting: Job posting by a member who's never posted a job on Jobportal's platform before
-Repeat job posting: Job Posting by a member who have already posted job before, like not new to platform

For example 
*member #1 posted a job (1001) on 4/14/2023, which is classified as a "new job posting."
* They also posted a second job (1002) on 8/14/2023, which is classified as a "repeat job posting."

Question 1: Of the jobs that are in this file, how many are new job postings, and how many are repeat job postings for each member?

OUTPUT Column - MEMBER_ID, JOB_POSTING, REPEAT_JOB_POSTING
*/

--- Solution
SELECT 
  	MEMBER_ID, 
	COUNT(DISTINCT Member_ID ) AS New_Job_posting,
	COUNT(*) - 1 AS Repeat_Jobs
FROM 
	rsc.job_table
GROUP BY MEMBER_ID


/*
I Question 2: 
Let's introduce a new concept called a Reactivation job posting,
which refers to a job posting by a member who's posted a job but not in the previous 180 days. 
For example, Job_ID 1005 is a Reactivation job posting, because the previous job by this member was posted > 180 days ago. 
Given this new concept,how many new job postings/repeat job posting/reactivations are present in this file?
*/

--- Solution
/* SUB Query
SELECT
    *,
    CASE
        WHEN DATEDIFF(DAY, LAG(JOB_POSTING_DATE) OVER (PARTITION BY MEMBER_ID ORDER BY JOB_POSTING_DATE), JOB_POSTING_DATE) > 180 THEN 'Reactivation'
        ELSE 'New'
    END AS Job_Type
FROM
	rsc.job_table
*/

SELECT 
    MEMBER_ID, 
    COUNT(CASE WHEN Job_Type = 'New' THEN Member_ID END) AS New_Job_posting,
    COUNT(CASE WHEN Job_Type = 'Reactivation' THEN Member_ID END) AS Repeat_Jobs
FROM 
    (SELECT
        *,
        CASE
            WHEN DATEDIFF(DAY, LAG(JOB_POSTING_DATE) OVER (PARTITION BY MEMBER_ID ORDER BY JOB_POSTING_DATE), JOB_POSTING_DATE) > 180 THEN 'Reactivation'
            ELSE 'New'
        END AS Job_Type
    FROM
        rsc.job_table) AS subquery_alias
GROUP BY
    MEMBER_ID;

