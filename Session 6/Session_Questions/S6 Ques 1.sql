--- Postgre
SELECT d.dept_name,E.name,E.salary, (SELECT AVG(SALARY)::NUMERIC(10,0) FROM Employees WHERE dept_id=d.dept_id) as DEPT_AVG
FROM Departments as d
LEFT JOIN 
Employees as E
ON 
D.dept_id=E.dept_id
WHERE emp_id =
(
SELECT emp_id FROM Employees
WHERE dept_id=d.dept_id
ORDER BY abs( (SELECT AVG(salary) FROM Employees WHERE dept_id=d.dept_id) - salary),
salary desc
limit 1
)