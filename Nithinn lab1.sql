-- Lab Experiment 01: Implementation of DDL Commands in SQL
-- STUDENT NAME: 
-- USN: 
-- SECTION: 

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate 
'root@localhost','Puranik-MacBook-Air.local','9.3.0','2025-08-18 18:24:21'



-- 'root@localhost', 'RVU-PC-025', '8.4.6','2025-08-18 06:02:31'

-- Scenario: University Course Management System
-- CREATE AND LOAD THE database DBLab001
-- Write your SQL query below Codespace:

create database BCALab2;
use BCALab2;
-- Task 1: Create the Students Table
-- Create a table to store information about students.
-- Include the following columns:
-- 1. StudentID (Primary Key)
-- 2. FirstName
-- 3. LastName
-- 4. Email (Unique Constraint)
-- 5. DateOfBirth

-- Write your SQL query below Codespace:


create table students
(StudentId varchar(10) primary key,
firstname varchar(15),
lastname varchar(10),
email varchar(20) unique,
dob date);







DESC students; -- [COPYPASTE OF THE OUTPUT in CSV format and terminate with ;]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code
'Name','varchar(15)','YES','',NULL,''
'Age','int','YES','',NULL,''
'email','varchar(15)','YES','',NULL,''
'address','varchar(15)','YES','',NULL,''
'Phonenumber','varchar(15)','YES','',NULL,''





-- Alter the table and 2 new columns
alter table students
add gender varchar(10),
add age int;





-- Modify a column data type
-- Rename a column
-- Drop a column
-- Rename the table

desc students;


alter table students
modify age float;

alter table students
rename to Guy;

desc Guy;

alter table Guy
drop column email;

desc  Guy;
'StudentId','varchar(10)','NO','PRI',NULL,''
'firstname','varchar(15)','YES','',NULL,''
'lastname','varchar(10)','YES','',NULL,''
'email','varchar(20)','YES','UNI',NULL,''
'dob','date','YES','',NULL,''
'gender','varchar(10)','YES','',NULL,''
'age','float','YES','',NULL,''

	



-- Task 2: Create the Courses Table
-- Create a table to store information about courses.
-- Include the following columns:
-- - CourseID (Primary Key)
-- - CourseName
-- - Credits

CREATE TABLE courses (
  courseID VARCHAR(15)  PRIMARY KEY,
  coursename VARCHAR(50),
  credits INT
);
desc courses;






-- Write your SQL query below Codespace:


DESC Courses; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- OUTPUT :
courseID	varchar(15)	NO	PRI		
coursename	varchar(50)	YES			
credits	int	YES	

		

-- Alter the table and 2 new columns
-- Modify a column data type
-- Rename a column
-- Drop a column
-- Rename the table

alter table courses
modify credits float;

alter table courses
rename to subjects;

desc subjects;

alter table subjects
add subjectname varchar(10);

desc subjects;


alter table subjects
drop column subjectname;

desc subjects;

-- Task 3: Create the Enrollments Table
-- Create a table to store course enrollment information.
-- Include the following columns:
-- - EnrollmentID (Primary Key)
-- - StudentID (Foreign Key referencing Students table)
-- - CourseID (Foreign Key referencing Courses table)
-- - EnrollmentDate

-- Write your SQL query below Codespace:

create table courseenrollmentinformation
(EnrollmentID varchar(15) primary key,
StudentID varchar(15),
CourseID varchar(15),
EnrollmentDate date);

desc  courseenrollmentinformation;

DESC ENROLLMENTS; -- [ [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ] ]
-- OUTPUT :
EnrollmentID	varchar(15)	NO	PRI		
StudentID	varchar(15)	YES			
CourseID	varchar(15)	YES			
EnrollmentDate	date	YES			



-- Alter the table and 2 new columns
-- Modify a column data type
-- Rename a column
-- Drop a column
-- Rename the table

alter table courseenrollmentinformation
modify EnrollmentID varchar(20);

alter table courseenrollmentinformation
rename to Enrollements;

desc Enrollements;

alter table Enrollements
add Name varchar(20);

alter table Enrollements
drop column Name;

desc Enrollements;

-- Task 4: Alter the Students Table
-- Add a column 'PhoneNumber' to store student contact numbers.

-- Write your SQL query below Codespace:
create table students
(Name varchar(15),
Age int,
email varchar(15),
address varchar(15)
);

Alter table students
add Phonenumber varchar(15);

desc students;




DESC STUDENTS; -- [[ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]]
Name	varchar(15)	YES			
Age	int	YES			
email	varchar(15)	YES			
address	varchar(15)	YES			
Phonenumber	varchar(15)	YES	
	

-- Task 5: Modify the Courses Table
-- Change the data type of the 'Credits' column to DECIMAL.
-- Write your SQL query below Codespace:

CREATE TABLE courses (
  courseID VARCHAR(15)  PRIMARY KEY,
  coursename VARCHAR(50),
  credits INT
);

desc courses;

alter table courses
modify credits decimal(8,2);

desc courses;






-- Task 6: Drop Tables

SHOW TABLES; -- Before dropping the table

-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:

drop table if exists Enrollements;
drop table if exists courses; 

drop table Enrollements;


SHOW TABLES; -- After dropping the table Enrollement and Course

'Guy'
'Guys'
'students'
'subjects'


-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabExperiment01