SELECT count(*) FROM employee_data
WHERE leaveornot IS false;

SELECT education, 
	   COUNT(*) AS "Amount of employees",
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM employee_data),2) AS "Percentage"
FROM employee_data
GROUP BY education;

SELECT city,
	ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM employee_data),2) AS "Percentage"
	FROM employee_data
GROUP BY city;

SELECT joiningyear as "Year joined",
		ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM employee_data),2) AS "Percentage"
		FROM employee_data
GROUP BY joiningyear
ORDER BY joiningyear;

SELECT education,
    ROUND(
        COUNT(*) FILTER (WHERE leaveornot IS true) * 100.0 / COUNT(*),
        2
    ) AS "Leave percentage"
FROM employee_data
GROUP BY education
ORDER BY "Leave percentage" DESC;
