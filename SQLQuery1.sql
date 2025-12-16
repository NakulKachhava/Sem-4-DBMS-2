CREATE TABLE STUDENT (
  StudentID INT PRIMARY KEY,
  StuName VARCHAR(100) NOT NULL,
  StuEmail VARCHAR(100) NULL,
  StuPhone VARCHAR(15) NULL,
  StuDepartment VARCHAR(50) NOT NULL,
  StuDateOfBirth DATE NOT NULL,
  StuEnrollmentYear INT NOT NULL
);



CREATE TABLE COURSE (
  CourseID VARCHAR(10) PRIMARY KEY,
  CourseName VARCHAR(100) NOT NULL,
  CourseCredits INT NOT NULL,
  CourseDepartment VARCHAR(50) NOT NULL,
  CourseSemester INT NOT NULL
);



CREATE TABLE FACULTY (
  FacultyID INT PRIMARY KEY,
  FacultyName VARCHAR(100) NOT NULL,
  FacultyEmail VARCHAR(100) NULL,
  FacultyDepartment VARCHAR(50) NOT NULL,
  FacultyDesignation VARCHAR(50) NOT NULL,
  FacultyJoiningDate DATE NOT NULL
);



CREATE TABLE ENROLLMENT (
  EnrollmentID INT PRIMARY KEY IDENTITY(1,1),
  StudentID INT NOT NULL,
  CourseID VARCHAR(10) NOT NULL,
  EnrollmentDate DATE NULL,
  Grade VARCHAR(2) NULL,
  EnrollmentStatus VARCHAR(20) NOT NULL CHECK (EnrollmentStatus IN ('Active', 'Completed', 'Dropped')),
  FOREIGN KEY (StudentID) REFERENCES STUDENT(StudentID),
  FOREIGN KEY (CourseID) REFERENCES COURSE(CourseID)
);



CREATE TABLE COURSE_ASSIGNMENT (
  AssignmentID INT PRIMARY KEY IDENTITY(1,1),
  CourseID VARCHAR(10) NOT NULL,
  FacultyID INT NOT NULL,
  Semester INT NOT NULL,
  Year INT NOT NULL,
  ClassRoom VARCHAR(20) NOT NULL,
  FOREIGN KEY (CourseID) REFERENCES COURSE(CourseID),
  FOREIGN KEY (FacultyID) REFERENCES FACULTY(FacultyID)
);



INSERT INTO STUDENT (StudentID,StuName,StuEmail,StuPhone, StuDepartment,StuDateOfBirth,StuEnrollmentYear)
VALUES
(1, 'Raj Patel', 'raj@univ.edu', '9876543210', 'CSE', '2003-05-15', 2021),
(2, 'Priya Shah', 'priya@univ.edu', '9876543211', 'IT', '2002-08-22', 2020),
(3, 'Amit Kumar', 'amit@univ.edu', '9876543212', 'CSE', '2003-11-10', 2021),
(4, 'Sneha Desai', 'sneha@univ.edu', '9876543213', 'ECE', '2004-02-18', 2022),
(5, 'Rohan Mehta', 'rohan@univ.edu', '9876543214', 'IT', '2003-07-25', 2021),
(6, 'Kavita Joshi', 'kavita@univ.edu', '9876543215', 'CSE', '2002-12-30', 2020),
(7, 'Arjun Verma', 'arjun@univ.edu', '9876543216', 'MECH', '2003-04-08', 2021),
(8, 'Pooja Rao', 'pooja@univ.edu', '9876543217', 'ECE', '2004-06-12', 2022);

SELECT * FROM STUDENT;



INSERT INTO COURSE (CourseID,CourseName,CourseCredits,CourseDepartment,CourseSemester)
VALUES
('CS101','Programming Fundamentals',4,'CSE',1),
('CS201','Data Structures',4,'CSE',3),
('CS301','Database Management Systems',4,'CSE',5),
('IT101','Web Technologies',3,'IT',1),
('IT201','Software Engineering',4,'IT',3),
('EC101','Digital Electronics',3,'ECE',1),
('EC201','Microprocessors',4,'ECE',3),
('ME101','Engineering Mechanics',4,'MECH',1),
('CS202','Operating Systems',4,'CSE',4),
('CS302','Artificial Intelligence',3,'CSE',6);

SELECT * FROM COURSE;



INSERT INTO FACULTY (FacultyID,FacultyName,FacultyEmail,FacultyDepartment,FacultyDesignation,FacultyJoiningDate)
VALUES
(101,'Dr. Sheth','Sheth@univ.edu','CSE','Professor','2010-07-15'),
(102,'Prof. Gupta','gupta@univ.edu','IT','Associate Prof','2012-08-20'),
(103,'Dr. Patel','patel@univ.edu','CSE','Assistant Prof','2015-06-10'),
(104,'Dr. Singh','singh@univ.edu','ECE','Professor','2008-03-25'),
(105,'Prof. Reddy','reddy@univ.edu','IT','Assistant Prof','2018-01-15'),
(106,'Dr. Iyer','iyer@univ.edu','MECH','Associate Prof','2013-09-05'),
(107,'Prof. Nair','nair@univ.edu','CSE','Assistant Prof','2019-07-20');

SELECT * FROM FACULTY;



INSERT INTO ENROLLMENT (StudentID,CourseID,EnrollmentDate,Grade,EnrollmentStatus)
VALUES
(1,'CS101','2021-07-01','A','Completed'),
(1,'CS201','2022-01-05','B+','Completed'),
(1,'CS301','2023-07-01',NULL,'Active'),
(2,'IT101','2020-07-01','A','Completed'),
(2,'IT201','2021-07-01','A-','Completed'),
(3,'CS101','2021-07-01','B','Completed'),
(3,'CS201','2022-01-05','A','Completed'),
(4,'EC101','2022-07-01','B+','Completed'),
(5,'IT101','2021-07-01','A','Completed'),
(6,'CS201','2021-01-05','A','Completed'),
(1,'CS302','2023-07-01',NULL,'Active'),
(2,'IT201','2022-01-05',NULL,'Dropped');

SELECT * FROM ENROLLMENT;



INSERT INTO COURSE_ASSIGNMENT (CourseID,FacultyID,Semester,Year,ClassRoom)
VALUES
('CS101',103,1,2024,'A-301'),
('CS201',101,3,2024,'B-205'),
('CS301',101,5,2024,'A-401'),
('IT101',102,1,2024,'C-102'),
('IT201',105,3,2024,'C-205'),
('EC101',104,1,2024,'D-101'),
('EC201',104,3,2024,'D-203'),
('ME101',106,1,2024,'E-101'),
('CS202',107,4,2024,'A-305'),
('CS302',101,6,2024,'B-401');

SELECT * FROM COURSE_ASSIGNMENT;





--SQL Concepts Revision


--Part – A 



--1.Retrieve all unique departments from the STUDENT table.

SELECT DISTINCT StuDepartment 
FROM STUDENT;



--2.Insert a new student record into the STUDENT table.(9, 'Neha Singh', 'neha.singh@univ.edu', '9876543218', 'IT', '2003-09-20', 2021)

INSERT INTO STUDENT(StudentID,StuName,StuEmail,StuPhone, StuDepartment,StuDateOfBirth,StuEnrollmentYear) VALUES
(9, 'Neha Singh', 'neha.singh@univ.edu', '9876543218', 'IT', '2003-09-20', 2021);
 
SELECT * FROM STUDENT;



--3.Change the Email of student 'Raj Patel' to 'raj.p@univ.edu'. (STUDENT table)

UPDATE STUDENT
SET StuEmail = 'raj.p@univ.edu'
WHERE StuName = 'Raj Patel';

SELECT * FROM STUDENT;



--4.Add a new column 'CGPA' with datatype DECIMAL(3,2) to the STUDENT table.

ALTER TABLE STUDENT
ADD CGPA DECIMAL(3,2);

SELECT * FROM STUDENT;



--5.Retrieve all courses whose CourseName starts with 'Data'. (COURSE table)

SELECT * FROM COURSE
WHERE CourseName LIKE 'Data%';



--6.Retrieve all students whose Name contains 'Shah'. (STUDENT table)

SELECT * FROM STUDENT
WHERE StuName LIKE '%Shah%';



--7.Display all Faculty Names in UPPERCASE. (FACULTY table)

SELECT UPPER(FacultyName) FROM FACULTY;



--8.Find all faculty who joined after 2015. (FACULTY table)

SELECT * FROM FACULTY
WHERE YEAR(FacultyJoiningDate) > 2015;


--9.Find the SQUARE ROOT of Credits for the course 'Database Management Systems'. (COURSE table)

SELECT SQRT(CourseCredits) FROM COURSE
WHERE CourseName = 'Database Management Systems';



--10.Find the Current Date using SQL Server in-built function.

SELECT GETDATE();



--11.Find the top 3 students who enrolled earliest (by EnrollmentYear). (STUDENT table)

SELECT TOP 3 * FROM STUDENT
ORDER BY StuEnrollmentYear;



--12.Find all enrollments that were made in the year 2022. (ENROLLMENT table)

SELECT * FROM ENROLLMENT
WHERE YEAR(EnrollmentDate) = 2022;



--13.Find the number of courses offered by each department. (COURSE table)

SELECT CourseDepartment, COUNT(CourseID) FROM COURSE
GROUP BY CourseDepartment;



--14.Retrieve the CourseID which has more than 2 enrollments. (ENROLLMENT table)

SELECT CourseID, COUNT(EnrollmentID) AS NUM_Of_ENROLLMENTS FROM ENROLLMENT
GROUP BY CourseID
HAVING COUNT(EnrollmentID) > 2;



--15.Retrieve all the student name with their enrollment status. (STUDENT & ENROLLMENT table)

SELECT StuName, EnrollmentStatus
FROM STUDENT S
INNER JOIN ENROLLMENT E
ON S.StudentID = E.StudentID;



--16.Select all student names with their enrolled course names. (STUDENT, COURSE, ENROLLMENT table)

SELECT StuName, CourseName 
FROM STUDENT S
INNER JOIN ENROLLMENT E
ON S.StudentID = E.StudentID
INNER JOIN COURSE C
ON E.CourseID = C.CourseID;



--17.Create a view called 'ActiveEnrollments' showing only active enrollments with student name and  course name. (STUDENT, COURSE, ENROLLMENT,  table)

CREATE VIEW ActiveEnrollments AS
SELECT StuName, CourseName
FROM STUDENT S
INNER JOIN ENROLLMENT E
ON S.StudentID = E.StudentID
INNER JOIN COURSE C
ON E.CourseID = C.CourseID
WHERE EnrollmentStatus = 'Active';

SELECT * FROM ActiveEnrollments;



--18.Retrieve the student’s name who is not enrol in any course using subquery. (STUDENT, ENROLLMENT TABLE)

SELECT StuName FROM STUDENT
WHERE StudentID IN (SELECT StudentID FROM ENROLLMENT WHERE EnrollmentStatus = 'Dropped')



--19.Display course name having second highest credit. (COURSE table)

SELECT DISTINCT TOP 1 CourseName FROM COURSE
WHERE CourseCredits IN (SELECT DISTINCT TOP 2 CourseCredits FROM COURSE ORDER BY CourseCredits DESC)

--OR--

SELECT DISTINCT TOP 1 CourseName FROM
(SELECT DISTINCT TOP 2 CourseCredits 
FROM COURSE 
ORDER BY CourseCredits DESC)
ORDER BY CourseCredits;



--Part – B 


--20.Retrieve all courses along with the total number of students enrolled. (COURSE, ENROLLMENT table)

SELECT CourseName, COUNT(StudentID) AS Student_Enrolled
FROM COURSE C
JOIN ENROLLMENT E
ON C.CourseID = E.CourseID
GROUP BY CourseName



--21.Retrieve the total number of enrollments for each status, showing only statuses that have more than 2 enrollments. (ENROLLMENT table)

SELECT EnrollmentStatus, COUNT(StudentID)
FROM ENROLLMENT
GROUP BY EnrollmentStatus
HAVING COUNT(StudentID) > 2;



--22.Retrieve all courses taught by 'Dr. Sheth' and order them by Credits. (FACULTY, COURSE, COURSE_ASSIGNMENT table)

SELECT CourseName, CourseCredits 
FROM FACULTY F
JOIN COURSE_ASSIGNMENT CA
ON F.FacultyID = CA.FacultyID
JOIN COURSE C
ON C.CourseID = CA.CourseID
WHERE FacultyName = 'Dr. Sheth'
ORDER BY CourseCredits



--Part – C 


--23.List all students who are enrolled in more than 3 courses. (STUDENT, ENROLLMENT table)

SELECT S.*, COUNT(EnrollmentID) 
FROM STUDENT S
JOIN ENROLLMENT E
ON S.StudentID = E.StudentID
GROUP BY 
HAVING COUNT(EnrollmentID) > 3;



--24.Find students who have enrolled in both 'CS101' and 'CS201' Using Sub Query. (STUDENT, ENROLLMENT table)
--25.Retrieve department-wise count of faculty members along with their average years of experience (calculate experience from JoiningDate). (Faculty table)
