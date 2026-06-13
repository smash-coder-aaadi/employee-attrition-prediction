--Query 1: Overall Attrition Rate

SELECT
ROUND(
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) * 100.0
    / COUNT(*),
    2
) AS AttritionRate
FROM employee_attrition;

--Query 2: Department-wise Attrition

SELECT
Department,
COUNT(*) AS TotalEmployees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS AttritionCount
FROM employee_attrition
GROUP BY Department
ORDER BY AttritionCount DESC;

--Query 3: Overtime Impact

SELECT
OverTime,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS LeftEmployees
FROM employee_attrition
GROUP BY OverTime;

--Query 4: Job Role Attrition

SELECT
JobRole,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS AttritionCount
FROM employee_attrition
GROUP BY JobRole
ORDER BY AttritionCount DESC;

--Query 5: Salary Band Attrition

SELECT
CASE
    WHEN MonthlyIncome < 5000 THEN 'Low Income'
    WHEN MonthlyIncome < 10000 THEN 'Medium Income'
    ELSE 'High Income'
END AS SalaryBand,

COUNT(*) AS Employees,

SUM(
CASE
    WHEN Attrition='Yes'
    THEN 1
    ELSE 0
END
) AS AttritionCount

FROM employee_attrition

GROUP BY SalaryBand;

