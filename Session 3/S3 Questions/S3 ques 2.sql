-- APPROACH 1: USING JOIN 
SELECT S.student_id, S.student_name
FROM Student as S
LEFT JOIN 
Enrollments as E
ON 
S.student_id=E.student_id
WHERE E.student_id IS NULL


-- APPROACH 2: USING SUBQUERY
SELECT * FROM Student WHERE student_id NOT IN (SELECT student_id FROM Enrollments)