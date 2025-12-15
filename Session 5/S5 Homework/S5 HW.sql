SELECT E.name, B.bonus
FROM Employee as E
LEFT OUTER JOIN
Bonus as B
on E.empId=B.empId
WHERE (bonus is null or bonus<1000);