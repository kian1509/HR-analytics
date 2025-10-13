# HR-analytics

## 1) How many employees does the company have?
``` sql
SELECT count(*) FROM employee_data;
```
ANSWER: 4653 employees

## 2) What is the education of the employees?
``` sql
  SELECT education, 
	   COUNT(*) AS "Amount of employees",
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM employee_data),2) AS "Percentage"
FROM employee_data
GROUP BY education;
```
![Education_of_employees](Images\education_employees.png)
