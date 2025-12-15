UPDATE Persons 
SET email = 'duplicate email' 
WHERE id IN 
(
 SELECT P1.id FROM 
Persons as P1
JOIN
Persons as P2
ON 
P1.email=P2.email
AND P1.id>P2.id
)

SELECT * FROM Persons