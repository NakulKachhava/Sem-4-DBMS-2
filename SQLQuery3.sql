--Advanced Stored Procedure


--Part – A


--1. Create a stored procedure that accepts a date and returns all faculty members who joined on that date.

CREATE OR ALTER PROCEDURE PR_Date_Faculty
@DATE DATE
AS 
BEGIN 
	SELECT * 
	FROM FACULTY
	WHERE FacultyJoiningDate = @DATE;
END

EXEC PR_Date_Faculty '2010-07-15';



--2. Create a stored procedure for ENROLLMENT table where user enters either StudentID and returns EnrollmentID, EnrollmentID, Grade, and Status.

GO -- <= USED FOR BRANCHING
CREATE OR ALTER PROCEDURE PR_Get_Details
@SID INT
AS 
BEGIN 
	SELECT EnrollmentID, EnrollmentDate, Grade, EnrollmentStatus
	FROM ENROLLMENT
	WHERE StudentID = @SID;
END

EXEC PR_Get_Details 1;



--3. Create a stored procedure that accepts two integers (min and max credits) and returns all courses whose credits fall between these values.

GO
CREATE OR ALTER PROCEDURE PR_Get_Courses_On_Credits
@MinCredits INT,
@MaxCredits INT
AS 
BEGIN 
	SELECT *	
	FROM COURSE
	WHERE CourseCredits BETWEEN @MinCredits AND @MaxCredits;
END

EXEC PR_Get_Courses_On_Credits 1,3;



--4. Create a stored procedure that accepts Course Name and returns the list of students enrolled in that course.

GO
CREATE OR ALTER PROCEDURE PR_Get_Students_On_CName
@CourseName VARCHAR(50)
AS 
BEGIN 
	SELECT C.CourseName, S.StuName	
	FROM COURSE C
	JOIN ENROLLMENT E
	ON C.CourseID = E.CourseID
	JOIN STUDENT S
	ON S.StudentID = E.StudentID
	WHERE CourseName = @CourseName;
END

EXEC PR_Get_Students_On_CName 'Data Structures';



--5. Create a stored procedure that accepts Faculty Name and returns all course assignments.

GO
CREATE OR ALTER PROCEDURE PR_Get_Courses_On_Faculty
@FacultyName VARCHAR(50)
AS 
BEGIN 
	SELECT FacultyName, C.CourseName	
	FROM FACULTY F
	JOIN COURSE_ASSIGNMENT CA
	ON F.FacultyID = CA.FacultyID
	JOIN COURSE C
	ON C.CourseID = CA.CourseID
	WHERE FacultyName = @FacultyName;
END

EXEC PR_Get_Courses_On_Faculty 'Dr. Sheth';



--6. Create a stored procedure that accepts Semester number and Year, and returns all course assignments with faculty and classroom details.

GO
CREATE OR ALTER PROCEDURE PR_Get_Courses_On_Sem_Year
@SemNum INT,
@SemYear INT
AS 
BEGIN 
	SELECT F.FacultyName, C.CourseName, ClassRoom	
	FROM FACULTY F
	JOIN COURSE_ASSIGNMENT CA
	ON F.FacultyID = CA.FacultyID
	JOIN COURSE C
	ON C.CourseID = CA.CourseID
	WHERE Semester = @SemNum AND Year = @SemYear;
END

EXEC PR_Get_Courses_On_Sem_Year 1,2024;



--Part – B


--7. Create a stored procedure that accepts the first letter of Status ('A', 'C', 'D') and returns enrollment details.

GO
CREATE OR ALTER PROCEDURE PR_Get_Enrollment_On_Status
@Status CHAR(1)
AS 
BEGIN 
	SELECT *	
	FROM ENROLLMENT
	WHERE EnrollmentStatus LIKE @Status+'%';
END

EXEC PR_Get_Enrollment_On_Status 'A';



--8. Create a stored procedure that accepts either Student Name OR Department Name and returns student data accordingly.

GO
CREATE OR ALTER PROCEDURE PR_Get_StuDetails_On_Name
@Name VARCHAR(50)
AS 
BEGIN 
	SELECT *
	FROM STUDENT
	WHERE StuName = @Name OR StuDepartment = @Name;
END

EXEC PR_Get_StuDetails_On_Name 'CSE';



--9. Create a stored procedure that accepts CourseID and returns all students enrolled grouped by enrollment status with counts.

GO
CREATE OR ALTER PROCEDURE PR_Get_StuEnrollNum_On_CourseID
@CourseID VARCHAR(10),
@Counts INT OUT
AS 
BEGIN 
	SELECT @Counts = COUNT(StudentID)
	FROM ENROLLMENT
	GROUP BY EnrollmentStatus;
END

-- ALWAYS EXECUTE THIS BELOW 3 QUERIES AS A WHOLE. DO NOT EXECUTE THEM SEPERATELY.

DECLARE @Count INT

EXEC PR_Get_StuEnrollNum_On_CourseID 'EC101', @Count OUT;

SELECT @Count AS Number_Of_Students_Enrolled



--Part – C


--10. Create a stored procedure that accepts a year as input and returns all courses assigned to faculty in that year with classroom details.

GO
CREATE OR ALTER PROCEDURE PR_Get_Courses_On_Year
@SemYear INT
AS 
BEGIN 
	SELECT F.FacultyName, C.CourseName, ClassRoom	
	FROM FACULTY F
	JOIN COURSE_ASSIGNMENT CA
	ON F.FacultyID = CA.FacultyID
	JOIN COURSE C
	ON C.CourseID = CA.CourseID
	WHERE Year = @SemYear;
END

EXEC PR_Get_Courses_On_Year 2024;



--11. Create a stored procedure that accepts From Date and To Date and returns all enrollments within that range with student and course details.

GO
CREATE OR ALTER PROCEDURE PR_Get_Student_Details_On_Date
@FromDate DATE,
@ToDate DATE
AS 
BEGIN 
	SELECT S.StuName, S.StuDepartment, S.StuEnrollmentYear, C.CourseName	
	FROM STUDENT S
	JOIN ENROLLMENT E
	ON S.StudentID = E.StudentID
	JOIN COURSE C
	ON E.CourseID = C.CourseID
	WHERE EnrollmentDate BETWEEN @FromDate AND @ToDate;
END

EXEC PR_Get_Student_Details_On_Date '2021-07-01','2022-01-05';



--12. Create a stored procedure that accepts FacultyID and calculates their total teaching load (sum of credits of all courses assigned).

GO
CREATE OR ALTER PROCEDURE PR_Faculty_Load_Calculate
@FacultyID INT
AS 
BEGIN 
	SELECT SUM(CourseCredits) AS Total_Teaching_Load	
	FROM FACULTY F
	JOIN COURSE_ASSIGNMENT CA
	ON F.FacultyID = CA.FacultyID
	JOIN COURSE C
	ON C.CourseID = CA.CourseID
	WHERE CA.FacultyID = @FacultyID;
END

EXEC PR_Faculty_Load_Calculate 101;