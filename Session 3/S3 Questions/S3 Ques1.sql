SELECT P.product_name,SUM(O.unit) AS Total_Units  
FROM Products as P
LEFT JOIN 
Orders as O
ON 
P.product_id=O.product_id
WHERE O.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY P.product_name
HAVING SUM(O.unit) >= 100;