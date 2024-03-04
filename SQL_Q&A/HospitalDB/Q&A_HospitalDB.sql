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


/* MEDIUM
Show unique birth years from patients and order them by ascending.
*/
select
  distinct(YEAR(birth_date)) AS Birth_Year
FROM patients
order by Birth_Year


/* MEDIUM
Show unique first names from the patients table which only occurs once in the list.
For example, if two or more people are named 'John' in the first_name column then don't include their name in the output list. If only 1 person is named 'Leo' then include them in the output.
*/
select distinct(first_name) AS First_Name
from patients
group by First_Name
having count(First_Name) = 1


/* MEDIUM
Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.
*/
select
  patient_id,
  first_name
from patients
where first_name LIKE 's__%__s'


/* MEDIUM
Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.
Primary diagnosis is stored in the admissions table.
*/
select
  p.patient_id,
  p.first_name,
  p.last_name
from patients AS p
  join admissions AS a ON p.patient_id = a.patient_id
where a.diagnosis = 'Dementia'


/* MEDIUM
Display every patient's first_name.
Order the list by the length of each name and then by alphabetically.
*/
select first_name
from patients
order by
  LEN(first_name),
  first_name


/* MEDIUM
Show the total amount of male patients and the total amount of female patients in the patients table.
Display the two results in the same row.
*/
select (
    select count(*)
    from patients
    where gender = 'M'
  ) AS Male, (
    select count(*)
    from patients
    where gender = 'F'
  ) AS Female


/* MEDIUM
Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name.
*/
SELECT
  first_name,
  last_name,
  allergies
from patients
where
  allergies IN ('Penicillin', 'Morphine')
order by
  allergies,
  first_name,
  last_name


/* MEDIUM
Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.
*/
SELECT
  patient_id,
  diagnosis
from admissions
group by
  patient_id,
  diagnosis
having count(admission_date) > 1


/* MEDIUM
Show the city and the total number of patients in the city.
Order from most to least patients and then by city name ascending.
*/
SELECT
  city AS City,
  count(*) AS Total_Patients
from patients
group by city
order by
  Total_Patients desc,
  City ASC


/* MEDIUM
Show first name, last name and role of every person that is either patient or doctor.
The roles are either "Patient" or "Doctor"
*/
SELECT
  first_name,
  last_name,
  'Patient' AS Role
from patients
union all
select
  first_name,
  last_name,
  'Doctor'
from doctors


/* MEDIUM
Show all allergies ordered by popularity. Remove NULL values from query.
*/
SELECT
  allergies,
  count(*) AS Total
from patients
where allergies IS not NULL
group by allergies
order by Total desc


/* MEDIUM
Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date.
*/
select
  first_name,
  last_name,
  birth_date
from patients
where
  year(birth_date) between 1970 AND 1979
order by birth_date asc


/* MEDIUM
We want to display each patient's full name in a single column. Their last_name in all upper letters must appear first, then first_name in all lower case letters. Separate the last_name and first_name with a comma. Order the list by the first_name in decending order
EX: SMITH,jane
*/
select
  concat(upper(last_name), ',', lower(first_name))
from patients
order by first_name desc


/* MEDIUM
Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.
*/
select
  province_id,
  sum(height) AS Total_Height
from patients
group by province_id
having Total_Height >= 7000


/* MEDIUM
Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'
*/
select MAX(weight) - min(weight)
from patients
where last_name = 'Maroni'


/* MEDIUM
Show all of the days of the month (1-31) and how many admission_dates occurred on that day. Sort by the day with most admissions to least admissions.
*/
select
  day(admission_date) AS Admission,
  count(*) As Total_Count
from admissions
group by Admission
order by Total_Count desc


/* MEDIUM
Show all columns for patient_id 542's most recent admission_date.
*/
select *
from admissions
where patient_id = 542
group by patient_id
having
  admission_date = max(admission_date)



/* MEDIUM
Show patient_id, attending_doctor_id, and diagnosis for admissions that match one of the two criteria:
1. patient_id is an odd number and attending_doctor_id is either 1, 5, or 19.
2. attending_doctor_id contains a 2 and the length of patient_id is 3 characters.
*/
select
  patient_id,
  attending_doctor_id,
  diagnosis
from admissions
where
  (
    patient_id % 2 = 1
    and attending_doctor_id in (1, 5, 19)
  )
  or (
    attending_doctor_id like '%2%'
    and lEN(patient_id) = 3
  )


/* MEDIUM
Show first_name, last_name, and the total number of admissions attended for each doctor.\

Every admission has been attended by a doctor.
*/
select
  d.first_name,
  d.last_name,
  count(a.patient_id) as Total_Att
from admissions As a
  join doctors AS d ON d.doctor_id = a.attending_doctor_id
group by
  d.first_name,
  d.last_name


/* MEDIUM
For each doctor, display their id, full name, and the first and last admission date they attended.
*/
select
  d.doctor_id AS ID,
  concat(d.first_name, ' ', d.last_name) AS Name,
  min(a.admission_date) AS First_day,
  MAX(a.admission_date) AS Last_day
from admissions AS a
  JOIn doctors as d ON d.doctor_id = a.attending_doctor_id
group by
  ID,
  Name


/* MEDIUM
Display the total amount of patients for each province. Order by descending.
*/
select
  pn.province_name AS Province_Name,
  count(p.patient_id) AS Total_Count
from province_names AS pn
  JOIN patients AS p on p.province_id = pn.province_id
group by Province_Name
order by Total_Count desc


/* MEDIUM
For every admission, display the patient's full name, their admission diagnosis, and their doctor's full name who diagnosed their problem.
*/
select
  concat(p.first_name, ' ', p.last_name) AS Patient_Name,
  a.diagnosis AS Diagnosi,
  concat(d.first_name, ' ', d.last_name) AS Doctor_Name
FROm patients As p
  join admissions AS a ON p.patient_id = a.patient_id
  Join doctors AS d ON a.attending_doctor_id = d.doctor_id


/* MEDIUM
display the first name, last name and number of duplicate patients based on their first name and last name.

Ex: A patient with an identical name can be considered a duplicate.
*/
select
  first_name,
  last_name,
  count(*) AS Duplicates
from patients
group by
  first_name,
  last_name
having Duplicates >= 2


/* MEDIUM
Display patient's full name,
height in the units feet rounded to 1 decimal,
weight in the unit pounds rounded to 0 decimals,
birth_date,
gender non abbreviated.

Convert CM to feet by dividing by 30.48.
Convert KG to pounds by multiplying by 2.205.
*/
select
  Concat(first_name, ' ', last_name),
  round((height / 30.48), 1),
  round((weight * 2.205), 0),
  birth_date,
  (
    case
      when gender = 'M' THEN 'MALE'
      ELSE 'FEMALE'
    END
  )
FROM patients


/* MEDIUM
Show patient_id, first_name, last_name from patients whose does not have any records in the admissions table. (Their patient_id does not exist in any admissions.patient_id rows.)
*/
select
  p.patient_id AS ID,
  p.first_name AS First_Name,
  p.last_name AS Last_Name
from patients AS p
where ID NOT IN(
    select a.patient_id AS ID2
    from admissions AS a
  )







