create database healthcare;
use healthcare;

## appointment_id	patient_id	doctor_id	appointment_date	reason	status
create table appointments
(appointment_id int,	
patient_id int,	
doctor_id int,
appointment_date date,	
reason	varchar(100),
status varchar(100));

## diagnosis_id	patient_id	doctor_id	diagnosis_date	diagnosis	treatment
create table diagnosis
(diagnosis_id int,	
patient_id int,	
doctor_id int,	
diagnosis_date date,	
diagnosis varchar(100),	
treatment varchar(100));

## doctor_id	name	specialization	experience_years	contact_number
create table doctors
(doctor_id int,	
doctor_name varchar(100),
specialization varchar(100),	
experience_years int,	
contact_number varchar(20));

## medication_id	diagnosis_id	medication_name	dosage	start_date	end_date
create table medications
(medication_id int,	
diagnosis_id int,	
medication_name varchar(100),	
dosage varchar(100),	
start_date date,	
end_date date);

## patient_id	name	age	gender	address	contact_number
create table patients
(patient_id int,	
patient_name varchar(100),	
age int,	
gender varchar(20),	
address varchar(50),	
contact_number  varchar(20));

## Inner Join
SELECT p.patient_name,d.doctor_name,d.specialization,a.appointment_date,a.status
FROM appointments a
INNER JOIN patients p
ON a.patient_id = p.patient_id
INNER JOIN doctors d
ON a.doctor_id = d.doctor_id
WHERE a.status = 'Completed';

## Left Join with NULL Handling
SELECT p.patient_id,p.patient_name,p.contact_number,p.address
FROM patients p
LEFT JOIN appointments a ON p.patient_id = a.patient_id
WHERE a.appointment_id IS NULL;

## Right Join and Aggregate Functions
SELECT d.doctor_name,d.specialization,
COUNT(dg.diagnosis_id) AS total_diagnoses
FROM diagnosis dg
RIGHT JOIN doctors d ON dg.doctor_id = d.doctor_id
GROUP BY d.doctor_id,d.doctor_name,d.specialization
ORDER BY total_diagnoses DESC;

## Full Join for Overlapping Data
SELECT a.appointment_id,
a.patient_id AS appointment_patient_id,
a.doctor_id AS appointment_doctor_id,
p.patient_name,
d.doctor_name,
a.appointment_date,
dg.diagnosis_id,
dg.diagnosis,
dg.diagnosis_date
FROM appointments a
LEFT JOIN diagnosis dg
ON a.patient_id = dg.patient_id
AND a.doctor_id = dg.doctor_id
LEFT JOIN patients p
ON a.patient_id = p.patient_id
LEFT JOIN doctors d
ON a.doctor_id = d.doctor_id
UNION ALL
SELECT
a.appointment_id,
a.patient_id AS appointment_patient_id,
a.doctor_id AS appointment_doctor_id,
p.patient_name,
d.doctor_name,
a.appointment_date,
dg.diagnosis_id,
dg.diagnosis,
dg.diagnosis_date
FROM diagnosis dg
LEFT JOIN appointments a
ON dg.patient_id = a.patient_id
AND dg.doctor_id = a.doctor_id
LEFT JOIN patients p
ON dg.patient_id = p.patient_id
LEFT JOIN doctors d
ON dg.doctor_id = d.doctor_id
WHERE a.appointment_id IS NULL;

## Window Functions — Rank Patients for Each Doctor
SELECT doctor_name,patient_id,total_appointments,
RANK() OVER (PARTITION BY doctor_id
ORDER BY total_appointments DESC) AS patient_rank
FROM (SELECT d.doctor_id,d.doctor_name,a.patient_id,
COUNT(a.appointment_id) AS total_appointments
FROM appointments a
INNER JOIN doctors d
ON a.doctor_id = d.doctor_id
GROUP BY d.doctor_id,
d.doctor_name,
a.patient_id) AS appointment_counts
ORDER BY doctor_name, patient_rank;

## Conditional Expressions — Count Patients by Age Group
SELECT CASE
WHEN age BETWEEN 18 AND 30 THEN '18-30'
WHEN age BETWEEN 31 AND 50 THEN '31-50'
WHEN age >= 51 THEN '51+'
ELSE 'Below 18'
END AS age_group,
COUNT(*) AS total_patients
FROM patients
GROUP BY CASE
WHEN age BETWEEN 18 AND 30 THEN '18-30'
WHEN age BETWEEN 31 AND 50 THEN '31-50'
WHEN age >= 51 THEN '51+'
ELSE 'Below 18'
END
ORDER BY MIN(age);

## Numeric and String Functions — Contact Numbers Ending in 1234
SELECT UPPER(patient_name) AS patient_name,contact_number
FROM patients
WHERE CAST(contact_number AS CHAR) LIKE '%1234';

## Subqueries — Patients Prescribed Only Insulin
SELECT DISTINCT p.patient_id,p.patient_name,p.contact_number
FROM patients p
WHERE EXISTS (SELECT 1
FROM diagnosis dg
INNER JOIN medications m
ON dg.diagnosis_id = m.diagnosis_id
WHERE dg.patient_id = p.patient_id
AND LOWER(TRIM(m.medication_name)) = 'insulin')
AND NOT EXISTS (SELECT 1
FROM diagnosis dg
INNER JOIN medications m
ON dg.diagnosis_id = m.diagnosis_id
WHERE dg.patient_id = p.patient_id
AND LOWER(TRIM(m.medication_name)) <> 'insulin');

## Date and Time Functions — Average Medication Duration
SELECT dg.diagnosis_id,dg.diagnosis,
ROUND(AVG(DATEDIFF(m.end_date, m.start_date)),2) AS avg_duration_days
FROM diagnosis dg
INNER JOIN medications m
ON dg.diagnosis_id = m.diagnosis_id
WHERE m.start_date IS NOT NULL
AND m.end_date IS NOT NULL
GROUP BY dg.diagnosis_id,dg.diagnosis
ORDER BY avg_duration_days DESC;

## Complex Joins and Aggregation — MySQL
SELECT d.doctor_name,d.specialization,
COUNT(DISTINCT a.patient_id) AS unique_patients
FROM doctors d
INNER JOIN appointments a
ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id,
d.doctor_name,d.specialization
ORDER BY unique_patients DESC
LIMIT 1;