--Part-A


--1. Write a scalar function to print "Welcome to DBMS Lab".

CREATE OR ALTER FUNCTION FN_Welcome()
RETURNS VARCHAR(100)
AS 
BEGIN
	RETURN 'Welcome to DBMS Lab.'
END;

SELECT DBO.FN_Welcome();



--2. Write a scalar function to calculate simple interest.

GO
CREATE OR ALTER FUNCTION FN_SimpleInterest
(@PR DECIMAL(8,2), @R DECIMAL(8,2), @N DECIMAL(8,2))
RETURNS DECIMAL(8,2)
AS 
BEGIN
	RETURN (@PR*@R*@N)/100.0
END;

SELECT DBO.FN_SimpleInterest(10.10,22.22,30) AS Interest;



--3. Function to Get Difference in Days Between Two Given Dates

GO
CREATE OR ALTER FUNCTION FN_DateDiffInDays
(@D1 DATE, @D2 DATE)
RETURNS INT
AS 
BEGIN
	RETURN DATEDIFF(D,@D1,@D2)
END;

SELECT DBO.FN_DateDiffInDays('2022-01-01','2025-11-11') AS Days;



--4. Write a scalar function which returns the sum of Credits for two given CourseIDs.

GO
CREATE OR ALTER FUNCTION FN_SumOfCredits
(@ID1 VARCHAR(25), @ID2 VARCHAR(25))
RETURNS INT
AS 
BEGIN
	DECLARE @Sum INT;
	SELECT @Sum = SUM(CourseCredits) FROM COURSE WHERE CourseID IN (@ID1,@ID2)
	RETURN @Sum;
END;

SELECT DBO.FN_SumOfCredits('CS101','CS201') AS SumOfCredits;



--5. Write a function to check whether the given number is ODD or EVEN.

GO
CREATE OR ALTER FUNCTION FN_CheckOddEven
(@N INT)
RETURNS VARCHAR(50)
AS 
BEGIN
	IF @N % 2 != 0
		RETURN 'ODD'
	RETURN 'EVEN'
END;

SELECT DBO.FN_CheckOddEven(15);



--6. Write a function to print number from 1 to N. (Using while loop)

GO
CREATE OR ALTER FUNCTION FN_Print1ToN
(@N INT)
RETURNS VARCHAR(50)
AS 
BEGIN
	DECLARE @COUNT INT = 1, @Num VARCHAR(100) = ''
	WHILE @COUNT <= @N
		BEGIN
			SET @Num = @Num + CAST(@COUNT AS VARCHAR(10))
			SET @COUNT = @COUNT + 1
		END
	RETURN @Num
END;

SELECT DBO.FN_Print1ToN(15);



--7. Write a scalar function to calculate factorial of total credits for a given CourseID.

GO
CREATE OR ALTER FUNCTION FN_Factorial
(@ID VARCHAR(20))
RETURNS INT
AS 
BEGIN
	DECLARE @COUNT INT = 1, @F INT = 1, @Num INT
	SELECT @Num = SUM(CourseCredits) FROM COURSE WHERE CourseID = @ID
	WHILE @COUNT <= @Num
		BEGIN
			SET @F = @F * @COUNT
			SET @COUNT = @COUNT + 1
		END
	RETURN @F
END;

SELECT DBO.FN_Factorial('CS101');



--8. Write a scalar function to check whether a given EnrollmentYear is in the past, current or future (Case statement)

GO
CREATE OR ALTER FUNCTION FN_CheckYear
(@N INT)
RETURNS VARCHAR(30)
AS 
BEGIN
	RETURN CASE 
			WHEN @N > YEAR(GETDATE()) THEN 'Future'
			WHEN @N = YEAR(GETDATE()) THEN 'Current'
			ELSE 'Past'
		   END;	
END;

SELECT DBO.FN_CheckYear(2025);



--9. Write a table-valued function that returns details of students whose names start with a given letter.

GO
CREATE OR ALTER FUNCTION FN_StudentDetails
(@L CHAR(1))
RETURNS TABLE
AS 
	RETURN SELECT * FROM STUDENT WHERE StuName LIKE @L + '%'	

SELECT * FROM DBO.FN_StudentDetails('A');



--10. Write a table-valued function that returns unique department names from the STUDENT table.

GO
CREATE OR ALTER FUNCTION FN_UniqueDEPT
()
RETURNS TABLE
AS 
	RETURN SELECT DISTINCT StuDepartment FROM STUDENT	

SELECT * FROM DBO.FN_UniqueDEPT();



--Part-B


--11. Write a scalar function that calculates age in years given a DateOfBirth.

GO
CREATE OR ALTER FUNCTION FN_CalcAge
(@D DATE)
RETURNS INT
AS 
BEGIN
	DECLARE @A INT
	SET @A = DATEDIFF(YEAR,@D,GETDATE())
	RETURN @A
END;

SELECT DBO.FN_CalcAge('2005-01-01');



--12. Write a scalar function to check whether given number is palindrome or not.
--13. Write a scalar function to calculate the sum of Credits for all courses in the 'CSE' department.
--14. Write a table-valued function that returns all courses taught by faculty with a specific designation.
--Part - C
--15. Write a scalar function that accepts StudentID and returns their total enrolled credits (sum of credits
--from all active enrollments).
--16. Write a scalar function that accepts two dates (joining date range) and returns the count of faculty
--who joined in that period.