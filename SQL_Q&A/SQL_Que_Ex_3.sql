CREATE TABLE rsc.emp (
emp_id INT,
emp_name VARCHAR(20),
department_id INT,
salary INT,
manager_id INT,
emp_age INT,
dob date
);
INSERT INTO rsc.emp VALUES (1, 'Ankit', 100, 10000, 4, 39, '1991-04-08');
INSERT INTO rsc.emp VALUES (2, 'Mohit', 100, 15000, 5, 48, '1991-04-07');
INSERT INTO rsc.emp VALUES (3, 'Vikas', 100, 10000, 4, 37, '1992-04-06');
INSERT INTO rsc.emp VALUES (4, 'Rohit', 100, 5000, 2, 16, '1993-04-05');
INSERT INTO rsc.emp VALUES (5, 'Mudit', 200, 12000, 6, 55, '1999-04-04');
INSERT INTO rsc.emp VALUES (6, 'Agam', 200, 12000, 2, 14, '1995-04-03');
INSERT INTO rsc.emp VALUES (7, 'Sanjay', 200, 9000, 2, 13, '1997-04-02');
INSERT INTO rsc.emp VALUES (8, 'Ashish', 200, 5000, 2, 12, '1997-04-01');
INSERT INTO rsc.emp VALUES (9, 'Mukesh', 300, 6000, 6, 51, '1998-03-31');
INSERT INTO rsc.emp VALUES (10, 'Rakesh', 300, 7000, 6, 50, '1999-03-30');
INSERT INTO rsc.emp VALUES (11, 'Mukki', 300, 2000, 6, 50, '1999-03-30');

-- Problem 1 -- Find all the employees who are born between 1991 and 1995

SELECT 
	DISTINCT emp_name
FROM rsc.emp
WHERE YEAR(dob) BETWEEN 1991 AND 1995
