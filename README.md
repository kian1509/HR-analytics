# HR Mini Case Study 👪

## Introduction
The data for this case study was taken from ![Kaggle](https://www.kaggle.com/datasets/tawfikelmetwally/employee-dataset). It contains information about employees in a company, including their educational backgrounds, work history, demographics, and employment-related factors. The goal of this project is to generate meaningful insights using SQL and a Power BI dashboard. All insights presented in this project are original and have been independently developed by me.


## Power BI Dashboard 
![Dashboard](Images/HR_Mini_Case_Study_Power_BI_Dashboard.png)
***
## SQL code
### 1) How many employees does the company currently have?
``` sql
SELECT count(*) FROM employee_data
WHERE leaveornot IS false;
```
**Answer**: 3053 employees

***

### 2) What is the education of the employees?
``` sql
  SELECT education, 
	   COUNT(*) AS "Amount of employees",
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM employee_data),2) AS "Percentage"
FROM employee_data
GROUP BY education;
```
![Education_of_employees](Images/education_employees.png)

**Answer**: Bachelor, Master, PhD
***
### 3) In what city do the employees work?
``` sql
SELECT city,
	ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM employee_data),2) AS "Percentage"
	FROM employee_data
GROUP BY city;
```
**Answer**: Bangalore, Pune, New Delhi
![Employee_city](Images/employee_city.png)
***
### 4) Which year had the highest number of new hires?

``` sql
SELECT joiningyear as "Year joined",
		ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM employee_data),2) AS "Percentage"
		FROM employee_data
GROUP BY joiningyear
ORDER BY joiningyear;
```
![hires_year](Images/hires_year.png)

**Answer**: Most were hired **in 2017.**
***

### 5) Which group of employees having a certain degree has the highest chance of leaving the company?
``` sql
SELECT education,
    ROUND(
        COUNT(*) FILTER (WHERE leaveornot IS true) * 100.0 / COUNT(*),
        2
    ) AS "Leave percentage"
FROM employee_data
GROUP BY education
ORDER BY "Leave percentage" DESC;
```
![diploma_leave](Images/diploma_leave.png)

**Answer**: Almost **50%** of the hired masters have left the company, this is twice as high as the hired PhDs.
***







