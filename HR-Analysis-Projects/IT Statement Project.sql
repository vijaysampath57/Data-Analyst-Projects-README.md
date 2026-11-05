Create database hr_analysis;

Use hr_analysis;

--- EmployeeID	Age	Gender	Department	JobRole	EducationField	MaritalStatus	BusinessTravel	OverTime	Attrition	---
--- MonthlyIncome	JobLevel	YearsAtCompany	YearsInCurrentRole	DistanceFromHome	JobSatisfaction	EnvironmentSatisfaction	WorkLifeBalance	---
--- TrainingTimesLastYear	PerformanceRating ---
Create table hr_employee_data
(EmployeeID	int Primary Key,
Age int,	
Gender varchar(10),	
Department varchar(50),	
JobRole varchar(200),	
EducationField varchar(500),	
MaritalStatus varchar(20),	
BusinessTravel varchar(100),	
OverTime varchar(10),	
Attrition varchar(10),	
MonthlyIncome int,
JobLevel int,
YearsAtCompany int,	
YearsInCurrentRole int,
DistanceFromHome int,	
JobSatisfaction int,	
EnvironmentSatisfaction int,	
WorkLifeBalance	int,
TrainingTimesLastYear int,	
PerformanceRating int);

--  View all employee data
SELECT * FROM hr_employee_data;

-- Average monthly income by department
SELECT Department, AVG(MonthlyIncome) AS Average_Income
FROM hr_employee_data
GROUP BY Department;

-- Employees with more than 10 years at the company
SELECT * FROM hr_employee_data
WHERE YearsAtCompany > 10;

-- Top 5 job roles by employee count
SELECT JobRole, COUNT(*) AS Employee_Count
FROM hr_employee_data
GROUP BY JobRole
ORDER BY Employee_Count DESC
LIMIT 5;

-- Employees earning more than average salary
SELECT EmployeeID, JobRole, MonthlyIncome
FROM hr_employee_data
WHERE MonthlyIncome > (SELECT AVG(MonthlyIncome)FROM hr_employee_data);

-- Department and job role (JOIN)
SELECT d.Department, r.JobRole, r.Employee_Count
FROM (SELECT Department, COUNT(*) AS Employee_Count
FROM hr_employee_data
GROUP BY Department) d
JOIN (SELECT Department, JobRole, COUNT(*) AS Employee_Count
FROM hr_employee_data
GROUP BY Department, JobRole) r ON d.Department = r.Department;

--  Rank job roles by average salary (window function)
SELECT JobRole,
AVG(MonthlyIncome) AS Average_Income,
DENSE_RANK() OVER (ORDER BY AVG(MonthlyIncome) DESC) AS Salary_Rank
FROM hr_employee_data
GROUP BY JobRole;

-- Employees by education level
SELECT EducationField, COUNT(*) AS Employee_Count
FROM hr_employee_data
GROUP BY EducationField
ORDER BY EducationField;