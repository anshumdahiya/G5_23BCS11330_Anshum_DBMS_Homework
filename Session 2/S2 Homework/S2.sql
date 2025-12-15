CREATE FUNCTION getNthHighestSalary(@N INT) 
RETURNS INT 
AS
BEGIN
    RETURN (
        SELECT (
            SELECT DISTINCT salary
            FROM Employee
            ORDER BY salary DESC
            OFFSET CASE WHEN @N > 0 THEN @N - 1 ELSE 1000000 END ROWS
            FETCH NEXT 1 ROWS ONLY
        )
    );
END
