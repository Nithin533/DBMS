-- Tutorial_3 :
-- STUDENT NAME:  Nithin Ravi 
-- USN: 1RUA24BCA0063
-- SECTION: A

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

root@localhost	RVU-PC-025	8.4.6	2025-09-10 06:04:45

create database Colleage;
use Colleage;

create table student (
StudentID varchar(20) PRIMARY KEY,
FirstName varchar(20),
LastName varchar(20),
DOB date,
class varchar(10),
City varchar(20)
);

create table Teacher (
TeacherID varchar(20) PRIMARY KEY,
FirstName varchar(20),
LastName varchar(20),
Subject varchar(20),
Hireddate date,
Salary decimal(8, 2)
);

create table course (
courseID varchar(20) PRIMARY KEY,
courseName varchaR(20),
Credits INT
);

create table Enrollememnt (
Enrollement_ID Varchar(20) PRIMARY KEY,
studentID varchar(20),
courseID varchar(20),
Grade Varchar(20),
FOREIGN KEY(studentID) REFERENCES student(studentID),
FOREIGN KEY(courseID) REFERENCES course(courseID)
);

INSERT INTO student (studentID, FirstName, LastName, DOB, class, City)
VALUES
(1, 'Rahul', 'Sharma', '2005-06-15', '10A', 'Mumbai'),
(2, 'Sneha', 'Patil', '2006-01-22', '9B', 'Pune'),
(3, 'Arjun', 'Verma', '2005-09-10', '10A', 'Delhi'),
(4, 'Ananya', 'Rao', '2006-03-05', '8C', 'Bengaluru'),
(5, 'Karan', 'Mehta', '2005-11-19', '9A', 'Chennai'),
(6, 'Pooja', 'Iyer', '2006-07-12', '8B', 'Hyderabad'),
(7, 'Amit', 'Kulkarni', '2005-08-30', '10B', 'Nagpur'),
(8, 'Nisha', 'Nair', '2006-04-18', '9C', 'Kochi'),
(9, 'Vikram', 'Singh', '2005-12-25', '10A', 'Jaipur'),
(10, 'Meera', 'Joshi', '2006-02-08', '8A', 'Ahmedabad');



-- 1..Display the details  of all students.
select * from student;

-- Output:

1	Rahul	Sharma	2005-06-15	10A	Mumbai
2	Sneha	Patil	2006-01-22	9B	Pune
3	Arjun	Verma	2005-09-10	10A	Delhi
4	Ananya	Rao	2006-03-05	8C	Bengaluru
5	Karan	Mehta	2005-11-19	9A	Chennai
6	Pooja	Iyer	2006-07-12	8B	Hyderabad
7	Amit	Kulkarni	2005-08-30	10B	Nagpur
8	Nisha	Nair	2006-04-18	9C	Kochi
9	Vikram	Singh	2005-12-25	10A	Jaipur
10	Meera	Joshi	2006-02-08	8A	Ahmedabad

alter table course
modify courseName varchar(100);

INSERT INTO course (courseID, courseName)
VALUES
(1, 'Database Management'),
(2, 'Java Programming'),
(3, 'Operating Systems'),
(4, 'Python Basics'),
(5, 'Data Structures'),
(6, 'Computer Networks'),
(7, 'Software Engineering'),
(8, 'Web Development'),
(9, 'Artificial Intelligence'),
(10, 'Machine Learning');

-- 2. Show the  last 3 characters of course names.
SELECT courseName, RIGHT(courseName, 3) As Last3Chars
FROM course;

-- Output:
Database Management	ent
Machine Learning	ing
Java Programming	ing
Operating Systems	ems
Python Basics	ics
Data Structures	res
Computer Networks	rks
Software Engineering	ing
Web Development	ent
Artificial Intelligence	nce

INSERT INTO Teacher (TeacherID, FirstName, LastName, Subject, Hireddate, Salary)
VALUES
(1, 'Rahul', 'Sharma', 'Mathematics', '2015-06-12', 55000.00),
(2, 'Sneha', 'Patil', 'English', '2017-03-20', 48000.00),
(3, 'Arjun', 'Verma', 'Physics', '2016-11-05', 60000.00),
(4, 'Ananya', 'Rao', 'Chemistry', '2018-07-15', 52000.00),
(5, 'Karan', 'Mehta', 'Biology', '2014-09-25', 58000.00),
(6, 'Pooja', 'Iyer', 'History', '2019-01-10', 47000.00),
(7, 'Amit', 'Kulkarni', 'Geography', '2020-05-30', 49000.00),
(8, 'Nisha', 'Nair', 'Computer Science', '2013-08-18', 65000.00),
(9, 'Vikram', 'Singh', 'Economics', '2016-02-22', 53000.00),
(10, 'Meera', 'Joshi', 'Political Science', '2021-04-14', 46000.00);

-- 3.Concatenate FirstName and LastName of teachers as fullname
SELECT CONCAT(FirstName, '',LastName) AS FullName
FROM Teacher;

-- Output:
RahulSharma
MeeraJoshi
SnehaPatil
ArjunVerma
AnanyaRao
KaranMehta
PoojaIyer
AmitKulkarni
NishaNair
VikramSingh

-- 4. Find the length of each student’s name.
SELECT LENGTH(CONCAT(FirstName, ' ', LastName)) AS NameLength
FROM student;

-- OUTUT:
'12'
'11'
'11'
'11'
'10'
'11'
'10'
'13'
'10'
'12'



-- 5.Replace the word "Maths" with "Mathematics" in the Course table. (use REPLACE function)
SELECT courseName,
	REPLACE(courseName,'Python Basics', 'Python Programming') AS Updatedcourse
FROM course;

-- output:

'Database Management','Database Management'
'Machine Learning','Machine Learning'
'Java Programming','Java Programming'
'Operating Systems','Operating Systems'
'Python Basics','Python Programming'
'Data Structures','Data Structures'
'Computer Networks','Computer Networks'
'Software Engineering','Software Engineering'
'Web Development','Web Development'
'Artificial Intelligence','Artificial Intelligence'

-- 6.Find the absolute difference between maximum and minimum marks.

ALTER TABLE student ADD Marks INT;

UPDATE student SET Marks = 85 WHERE StudentID = 1;
UPDATE student SET Marks = 78 WHERE StudentID = 2;
UPDATE student SET Marks = 92 WHERE StudentID = 3;
UPDATE student SET Marks = 67 WHERE StudentID = 4;
UPDATE student SET Marks = 74 WHERE StudentID = 5;
UPDATE student SET Marks = 88 WHERE StudentID = 6;
UPDATE student SET Marks = 90 WHERE StudentID = 7;
UPDATE student SET Marks = 79 WHERE StudentID = 8;
UPDATE student SET Marks = 95 WHERE StudentID = 9;
UPDATE student SET Marks = 82 WHERE StudentID = 10;

SELECT ABS(MAX(Marks) - MIN(Marks)) AS AbsDifference
FROM student;

-- Output: 28

-- 7.Round off teachers’ salaries to the nearest thousand.

SELECT TeacherID, FirstName, LastName, Salary, ROUND(Salary, -3) AS RoundedSalary
FROM Teacher;

-- Output:
'1','Rahul','Sharma','55000.00','55000'
'10','Meera','Joshi','46000.00','46000'
'2','Sneha','Patil','48000.00','48000'
'3','Arjun','Verma','60000.00','60000'
'4','Ananya','Rao','52000.00','52000'
'5','Karan','Mehta','58000.00','58000'
'6','Pooja','Iyer','47000.00','47000'
'7','Amit','Kulkarni','49000.00','49000'
'8','Nisha','Nair','65000.00','65000'
'9','Vikram','Singh','53000.00','53000'

-- 8.Show the square root of each course credit.

SELECT courseID, courseName, Credits, SQRT(Credits) AS SqrtCredits
FROM course;

-- Output:
'1','Database Management',NULL,NULL
'10','Machine Learning',NULL,NULL
'2','Java Programming',NULL,NULL
'3','Operating Systems',NULL,NULL
'4','Python Basics',NULL,NULL
'5','Data Structures',NULL,NULL
'6','Computer Networks',NULL,NULL
'7','Software Engineering',NULL,NULL
'8','Web Development',NULL,NULL
'9','Artificial Intelligence',NULL,NULL

-- 9. Display students’ marks along with ceiling and floor values. 

SELECT StudentID, FirstName, LastName, Marks, CEIL(Marks) AS CeilMarks, FLOOR(Marks) AS FloorMarks
FROM Student; 

-- Output:
'1','Rahul','Sharma','85','85','85'
'10','Meera','Joshi','82','82','82'
'2','Sneha','Patil','78','78','78'
'3','Arjun','Verma','92','92','92'
'4','Ananya','Rao','67','67','67'
'5','Karan','Mehta','74','74','74'
'6','Pooja','Iyer','88','88','88'
'7','Amit','Kulkarni','90','90','90'
'8','Nisha','Nair','79','79','79'
'9','Vikram','Singh','95','95','95'

-- 10.Find the modulus of total marks divided by 5.

SELECT StudentID,FirstName, LastName, Marks, MOD(Marks, 5) AS ModValue
FROM Student;

-- output:
'1','Rahul','Sharma','85','0'
'10','Meera','Joshi','82','2'
'2','Sneha','Patil','78','3'
'3','Arjun','Verma','92','2'
'4','Ananya','Rao','67','2'
'5','Karan','Mehta','74','4'
'6','Pooja','Iyer','88','3'
'7','Amit','Kulkarni','90','0'
'8','Nisha','Nair','79','4'
'9','Vikram','Singh','95','0'

-- 11.Display the current date and time.

 SELECT NOW() AS CurrentDateTime;
 
 -- Output:
 '2025-09-10 19:00:21'

-- 12.Show the year and month of hire for all teachers. 

SELECT TeacherID,FirstName,LastName,YEAR(Hireddate)  AS Hire_Year,MONTH(Hireddate) AS Hire_Month
FROM Teacher;

-- Output:
'1','Rahul','Sharma','2015','6'
'10','Meera','Joshi','2021','4'
'2','Sneha','Patil','2017','3'
'3','Arjun','Verma','2016','11'
'4','Ananya','Rao','2018','7'
'5','Karan','Mehta','2014','9'
'6','Pooja','Iyer','2019','1'
'7','Amit','Kulkarni','2020','5'
'8','Nisha','Nair','2013','8'
'9','Vikram','Singh','2016','2'

-- 13.List students who were born in January. 

SELECT StudentID,FirstName,LastName,DOB FROM Student WHERE MONTH(DOB) = 1;

-- Output: '2','Sneha','Patil','2006-01-22'

-- 14. Find the difference in days between today and a teacher’s HireDate. 
SELECT TeacherID,FirstName,LastName,Hireddate, DATEDIFF(CURDATE(), Hireddate) AS Days_Since_Hire
FROM Teacher;

-- Output:
'1','Rahul','Sharma','2015-06-12','3743'
'10','Meera','Joshi','2021-04-14','1610'
'2','Sneha','Patil','2017-03-20','3096'
'3','Arjun','Verma','2016-11-05','3231'
'4','Ananya','Rao','2018-07-15','2614'
'5','Karan','Mehta','2014-09-25','4003'
'6','Pooja','Iyer','2019-01-10','2435'
'7','Amit','Kulkarni','2020-05-30','1929'
'8','Nisha','Nair','2013-08-18','4406'
'9','Vikram','Singh','2016-02-22','3488'

-- 15.Find the total number of students in the school.

SELECT COUNT(*) AS Total_students
FROM student;

-- Output: '10'

-- 16.Calculate the average salary of teachers.

SELECT AVG(Salary) AS Average_Salary
FROM Teacher;

-- Output: '53300.000000'

-- 17. Find the highest and lowest marks in the Student table.
SELECT MAX(Marks) AS HighestMarks, MIN(Marks) AS LowestMarks
FROM student;

-- Output: '95','67'

