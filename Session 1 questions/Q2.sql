-- cust_id 1005 not exist
INSERT INTO ORDERS (CUST_ID,AMOUNT)VALUES(1005, 500);

-- (ii)
-- Automatically Handle Updates/Deletions
(1)
Update CUSTOMER
SET cust_id=99
Where cust_id=101;

-- Now cust_id=101 change to cust_id=99 
Select * from Orders;

-- (2)
DELETE FROM Customer
Where cust_id=102;
-- Customer Id 102 also remove From Order table by usin above Query
select * from Orders
