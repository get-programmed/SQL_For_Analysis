https://www.sql-practice.com/

/* EASY
Show first name, last name, and gender of patients whose gender is 'M'
*/
SELECT
  first_name,
  last_name,
  gender
FROM patients
where gender = 'M'


/* EASY
Show first name and last name of patients who does not have allergies. (null)
*/
SELECT
  first_name,
  last_name
FROM patients
where allergies IS NULL


/* EASY
Show first name of patients that start with the letter 'C'
*/
SELECT
  first_name
FROM patients
where first_name like 'C%'


/* EASY
Show first name and last name of patients that weight within the range of 100 to 120 (inclusive)
*/
SELECT
  first_name,
  last_name
FROM patients
where weight between 100 AND 120


/* EASY
Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'
*/
update patients
SET allergies = 'NKA'
where allergies IS NULL


/* EASY
Show first name and last name concatinated into one column to show their full name.
*/
SELECT
  concat(first_name, ' ', last_name)
FROM patients


/* EASY
Show first name, last name, and the full province name of each patient.
Example: 'Ontario' instead of 'ON'
*/
select
  p.first_name AS First_Name,
  p.last_name AS Last_Name,
  pn.province_name AS Pn_Name
FROM patients AS p
join province_names AS pn ON p.province_id = pn.province_id


/* EASY
Show how many patients have a birth_date with 2010 as the birth year.
*/
select count(*)
FROM patients
where YEAR(birth_date) = 2010


/* EASY
Show the first_name, last_name, and height of the patient with the greatest height.
*/
select
  first_name AS First_Name,
  last_name AS Last_Name,
  MAX(height) AS Height
FROM patients


/* EASY
Show all columns for patients who have one of the following patient_ids:
1,45,534,879,1000
*/
select *
from patients
where
  patient_id IN (1, 45, 534, 879, 1000)


/* EASY
Show the total number of admissions
*/
select distinct(count(patient_id))
from admissions


/* EASY
Show all the columns from admissions where the patient was admitted and discharged on the same day.
*/
select *
from admissions
where admission_date = discharge_date


/* EASY
Show the patient id and the total number of admissions for patient_id 579.
*/
select
  patient_id,
  count(*)
from admissions
where patient_id = 579


/* EASY
Based on the cities that our patients live in, show unique cities that are in province_id 'NS'?
*/
select distinct(city)
from patients
where province_id = 'NS'


/* EASY
Write a query to find the first_name, last name and birth date of patients who has height greater than 160 and weight greater than 70
*/
select
  first_name,
  last_name,
  birth_date
from patients
where height > 160 and weight > 70


/* EASY
Write a query to find list of patients first_name, last_name, and allergies where allergies are not null and are from the city of 'Hamilton'
*/
select
  first_name,
  last_name,
  allergies
from patients
where allergies IS NOT NULL and city = 'Hamilton'









