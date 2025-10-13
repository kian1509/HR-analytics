# HR Mini Case Study

## Solution

### 1) How many employees does the company have?
``` sql
SELECT count(*) FROM employee_data;
```
ANSWER: 4653 employees

***

## 2) What is the education of the employees?
``` sql
  SELECT education, 
	   COUNT(*) AS "Amount of employees",
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM employee_data),2) AS "Percentage"
FROM employee_data
GROUP BY education;
```
![Education_of_employees](Images/education_employees.png)

## 3) In what city do the employees work?
``` sql
SELECT city,
	ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM employee_data),2) AS "Percentage"
	FROM employee_data
GROUP BY city;
```
![Employee_city](Images/employee_city.png)

## 4) Which year had the highest number of new hires?

``` sql
SELECT joiningyear as "Year joined",
		ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM employee_data),2) AS "Percentage"
		FROM employee_data
GROUP BY joiningyear
ORDER BY joiningyear;
```
![hires_year](Images/hires_year.png)

Indicating that of all the people who have worked for the company, most were hired **in 2017.**

## 5) Which group of employees having a certain degree has the highest chance of leaving the company?
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

Almost **50%** of the hired masters have left the company, this is twice as high as the hired PhDs.








