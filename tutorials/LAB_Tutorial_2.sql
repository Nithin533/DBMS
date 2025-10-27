-- Lab Tutorial 01: Student Marks Card
-- STUDENT NAME:  Nithin Ravi 
-- USN: 1RUA24BCA0063
-- SECTION: A

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
       
'root@localhost','Puranik-MacBook-Air.local','8.0.28','2025-09-03 18:13:11'


create database StudentMarksDB;
use StudentMarksDB;

CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Class VARCHAR(20),
    Section CHAR(1),
    Roll_No INT UNIQUE
);

CREATE TABLE Marks (
    Marks_ID INT PRIMARY KEY,
    Student_ID INT,
    Subject VARCHAR(30),
    Marks_Obtained INT,
    Max_Marks INT,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
);

INSERT INTO Student VALUES (1, 'Rahul', '10th', 'A', 21);
INSERT INTO Student VALUES (2, 'Priya', '10th', 'A', 22);

INSERT INTO Marks VALUES (101, 1, 'Math', 88, 100);
INSERT INTO Marks VALUES (102, 1, 'Science', 92, 100);
INSERT INTO Marks VALUES (103, 2, 'Math', 76, 100);
INSERT INTO Marks VALUES (104, 2, 'Science', 81, 100);

UPDATE Student
SET Class = '11th'
WHERE Student_ID = 1;


UPDATE Student
SET Section = 'B'
WHERE Student_ID = 2;

UPDATE Marks
SET Marks_Obtained = 90
WHERE Marks_ID = 101;

UPDATE Marks
SET Marks_Obtained = Marks_Obtained + 5
WHERE Marks_ID = 104;

UPDATE Marks
SET Subject = 'Physics'
WHERE Subject = 'Science';

SET SQL_SAFE_UPDATES = 0;

SET SQL_SAFE_UPDATES = 1;

SELECT * FROM Student;
SELECT * FROM Marks;

'1','Rahul','11th','A','21'
'2','Priya','10th','B','22'

'104','2','Physics','96','100'
'103','2','Math','76','100'
'102','1','Physics','92','100'
'101','1','Math','90','100'


SELECT Student_ID, 
       SUM(Marks_Obtained) AS Total, 
       AVG(Marks_Obtained) AS Average
FROM Marks
GROUP BY Student_ID;

'1','182','91.0000'
'2','172','86.0000'


SELECT Student_ID, Subject, Marks_Obtained,
       IF(Marks_Obtained >= 35, 'PASS', 'FAIL') AS Result
FROM Marks;

'2','Math','76','PASS'
'2','Physics','96','PASS'
'1','Math','90','PASS'
'1','Physics','92','PASS'

SELECT Student_ID,
       IF(MIN(Marks_Obtained) >= 35, 'PASS', 'FAIL') AS Final_Result
FROM Marks
GROUP BY Student_ID;

'2','PASS'
'1','PASS'

SELECT Student_ID, Subject, Marks_Obtained
FROM Marks
WHERE (Subject='Math' AND Marks_Obtained > 80)
   OR (Subject='Physics' AND Marks_Obtained > 80);

'1','Math','90'
'1','Physics','92'
'2','Physics','96'


select * from Student
select * from Marks

'1','Rahul','11th','A','21'
'2','Priya','10th','B','22'

'101','1','Math','90','100'
'102','1','Physics','92','100'
'103','2','Math','76','100'
'104','2','Physics','96','100'







