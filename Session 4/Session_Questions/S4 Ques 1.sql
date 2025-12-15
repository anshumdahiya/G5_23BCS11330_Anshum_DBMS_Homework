SELECT St.student_id, St.student_name, Su.subject_name, COUNT(E.subject_name) as [attended_exam]
FROM Students as St
CROSS JOIN Subjects as Su
LEFT JOIN 
Examinations as E
ON 
E.student_id=St.student_id 
AND 
E.subject_name = Su.subject_name
GROUP BY St.student_id, St.student_name, Su.subject_name
ORDER BY St.student_id
