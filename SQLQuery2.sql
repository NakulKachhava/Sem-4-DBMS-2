--Stored Procedure


--Part – A


--1. INSERT Procedures: Create stored procedures to insert records into STUDENT tables(SP_INSERT_STUDENT) CREATE OR ALTER PROCEDURE PR_INSERT_STUDENT@StuID INT,@Name VARCHAR(100),@Email VARCHAR(100),
@Phone VARCHAR(15),
@Department VARCHAR(50),@DOB DATE,@EnrollmentYear INTAS BEGIN 	INSERT INTO STUDENT(StudentID,StuName,StuEmail,StuPhone,StuDepartment,StuDateOfBirth,StuEnrollmentYear) VALUES	(@StuID,@Name,@Email,@Phone,@Department,@DOB,@EnrollmentYear);ENDEXEC PR_INSERT_STUDENT 10,'Harsh Parmar','harsh@univ.edu','9876543219','CSE','2005-09-18',2023;EXEC PR_INSERT_STUDENT 11,'Om Patel','om@univ.edu','9876543220','IT','2002-08-22',2022;SELECT * FROM STUDENT;--2. INSERT Procedures: Create stored procedures to insert records into COURSE tables(SP_INSERT_COURSE)CREATE OR ALTER PROCEDURE PR_INSERT_COURSE@CourseID VARCHAR(10),@CourseName VARCHAR(100),@Credits INT,
@Dept VARCHAR(50),@Semester INTAS BEGIN 	INSERT INTO COURSE(CourseID,CourseName,CourseCredits,CourseDepartment,CourseSemester) VALUES	(@CourseID,@CourseName,@Credits,@Dept,@Semester);ENDEXEC PR_INSERT_COURSE 'CS330','Computer Networks',4,'CSE',5;EXEC PR_INSERT_COURSE 'EC120','Electronic Circuits',3,'ECE',2;SELECT * FROM COURSE;--3. UPDATE Procedures: Create stored procedure SP_UPDATE_STUDENT to update Email and Phone in STUDENT table.(Update using studentID)

CREATE OR ALTER PROCEDURE PR_UPDATE_STUDENT
@StuID INT,
@Email VARCHAR(100),
@Phone VARCHAR(15)
AS 
BEGIN 
	UPDATE STUDENT
	SET StuEmail = @Email, StuPhone = @Phone
	WHERE StudentID = @StuID;
END

SELECT * FROM STUDENT;



--4. DELETE Procedures: Create stored procedure SP_DELETE_STUDENT to delete records from STUDENT where Student Name is Om Patel.

CREATE OR ALTER PROCEDURE PR_DELETE_STUDENT
@Name VARCHAR(100)
AS
BEGIN
	DELETE FROM STUDENT
	WHERE StuName = @Name;
END

EXEC PR_DELETE_STUDENT 'Om Patel';

SELECT * FROM STUDENT;



--5. SELECT BY PRIMARY KEY: Create stored procedures to select records by primary key(SP_SELECT_STUDENT_BY_ID) from Student table.

CREATE OR ALTER PROCEDURE PR_SELECT_STUDENT_BY_ID
@StuID INT
AS 
BEGIN 
	SELECT * 
	FROM STUDENT
	WHERE StudentID = @StuID;
END

EXEC PR_SELECT_STUDENT_BY_ID 1;



--6. Create a stored procedure that shows details of the first 5 students ordered by EnrollmentYear.

CREATE OR ALTER PROCEDURE PR_Student_OrderedByEnrollYear
AS 
BEGIN 
	SELECT TOP 5 *
	FROM STUDENT
	ORDER BY StuEnrollmentYear;
END

EXEC PR_Student_OrderedByEnrollYear;



--Part – B


--7. Create a stored procedure which displays faculty designation-wise count.

CREATE OR ALTER PROCEDURE PR_Faculty_Designation_Wise
AS
BEGIN
	SELECT FacultyDesignation, COUNT(FacultyID)
	FROM FACULTY
	GROUP BY FacultyDesignation;
END

EXEC PR_Faculty_Designation_Wise;  -- OR YOU CAN DIRECTLY EXECUTE THIS -> PR_Faculty_Designation_Wise With F5



--8. Create a stored procedure that takes department name as input and returns all students in that department.

CREATE OR ALTER PROCEDURE PR_AllStudents_In_Department
@DeptName VARCHAR(50)
AS 
BEGIN
	SELECT * 
	FROM STUDENT
	WHERE StuDepartment = @DeptName;
END

EXEC PR_AllStudents_In_Department 'CSE';



--Part – C


--9. Create a stored procedure which displays department-wise maximum, minimum, and average credits of courses.

CREATE OR ALTER PROCEDURE PR_Dept_Wise_Report
AS
BEGIN 
	SELECT CourseDepartment, MAX(CourseCredits) AS Max_Credits, MIN(CourseCredits) AS Min_Credits, AVG(CourseCredits) AS Avg_Credits
	FROM COURSE
	GROUP BY CourseDepartment;
END



--10. Create a stored procedure that accepts StudentID as parameter and returns all courses the student is enrolled in with their grades.

CREATE OR ALTER PROCEDURE PR_Student_Enroll_Info
@StuID INT
AS 
BEGIN
	SELECT S.StudentID, S.StuName, C.CourseName, E.Grade
	FROM STUDENT S
	JOIN ENROLLMENT E
	ON S.StudentID = E.StudentID
	JOIN COURSE C
	ON C.CourseID = E.CourseID
	WHERE S.StudentID = @StuID;
END

EXEC PR_Student_Enroll_Info 1;