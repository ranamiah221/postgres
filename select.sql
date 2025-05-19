-- Active: 1747592879333@@127.0.0.1@5432@ph
CREATE Table students(
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT,
    grade CHAR(2),
    course VARCHAR(50),
    email VARCHAR(100),
    dob DATE,
    blood_group VARCHAR(5),
    country VARCHAR(50)
);

INSERT INTO students (first_name, last_name, age, grade, course, email, dob, blood_group, country)
VALUES
('Alice', 'Smith', 20, 'A', 'Mathematics', 'alice.smith@example.com', '2005-03-12', 'A+', 'USA'),
('Bob', 'Johnson', 21, 'B', 'Physics', 'bob.johnson@example.com', '2004-06-25', 'B+', 'Canada'),
('Charlie', 'Williams', 22, 'A', 'Chemistry', 'charlie.w@example.com', '2003-02-15', 'O-', 'UK'),
('Diana', 'Brown', 19, 'C', 'Biology', 'diana.brown@example.com', '2006-11-30', 'AB+', 'Australia'),
('Ethan', 'Jones', 20, 'A', 'Computer Science', 'ethan.jones@example.com', '2005-05-20', 'O+', 'India'),
('Fiona', 'Garcia', 23, 'B', 'History', 'fiona.garcia@example.com', '2002-09-09', 'B-', 'USA'),
('George', 'Martinez', 21, 'C', 'Economics', 'george.m@example.com', '2004-07-07', 'A-', 'Mexico'),
('Hannah', 'Rodriguez', 20, 'A', 'Philosophy', 'hannah.rod@example.com', '2005-04-01', 'AB-', 'Spain'),
('Ian', 'Lee', 19, 'B', 'Statistics', 'ian.lee@example.com', '2006-08-15', 'B+', 'South Korea'),
('Julia', 'Walker', 22, 'A', 'Political Science', 'julia.walker@example.com', '2003-12-12', 'A+', 'UK'),
('Kevin', 'Hall', 20, 'A', 'Engineering', 'kevin.hall@example.com', '2005-03-18', 'O-', 'USA'),
('Laura', 'Allen', 21, 'B', 'Medicine', 'laura.allen@example.com', '2004-06-06', 'B+', 'Canada'),
('Mike', 'Young', 22, 'C', 'Architecture', 'mike.young@example.com', '2003-01-01', 'A+', 'Germany'),
('Nina', 'Hernandez', 20, 'A', 'Law', 'nina.h@example.com', '2005-10-10', 'O+', 'Brazil'),
('Oscar', 'King', 19, 'B', 'Music', 'oscar.king@example.com', '2006-07-07', 'AB+', 'USA'),
('Paula', 'Wright', 21, 'A', 'Art', 'paula.wright@example.com', '2004-04-04', 'B-', 'France'),
('Quentin', 'Lopez', 23, 'C', 'Design', 'quentin.lopez@example.com', '2002-05-05', 'O-', 'Italy'),
('Rachel', 'Hill', 22, 'B', 'Psychology', 'rachel.hill@example.com', '2003-03-03', 'A+', 'India'),
('Sam', 'Scott', 20, 'A', 'Geography', 'sam.scott@example.com', '2005-02-02', 'AB-', 'Australia'),
('Tina', 'Green', 21, 'B', 'Sociology', 'tina.green@example.com', '2004-09-09', 'B+', 'New Zealand');

-- delete table...
DROP Table students;

-- show table all details...
SELECT * FROM students;

-- show email,age column only ...
SELECT  email, age, blood_group FROM students;

-- show email in different name student_email.
SELECT email as "Student Email" FROM students;
SELECT email as student_email FROM students;

-- show student sorting....
SELECT * FROM students ORDER BY first_name ASC;
SELECT * FROM students ORDER BY first_name DESC;
SELECT * FROM students ORDER BY age DESC;
SELECT * FROM students ORDER BY age ASC;

-- unique country show...
SELECT DISTINCT country FROM students;
-- unique blood group...
SELECT DISTINCT blood_group FROM students;


--data filtering.....

-- select students from usa..
SELECT * from students
WHERE country ='USA';

-- select students with 'A' grade in physice.
SELECT * FROM students
WHERE grade = 'B' AND course='Physics';
-- select students with a specific blood group('A+).
SELECT * FROM students
WHERE blood_group = 'A+' ;
-- select students from the USA or from Australia.
SELECT * FROM students
WHERE country = 'USA' OR country='Australia';
-- select students from USA or from Australia and the age is 20.
SELECT * FROM students
WHERE (country='USA' OR country ='Australia') AND age=20;
-- select students with a grade of "A" or 'B' in Law or Physics
SELECT * FROM students 
WHERE (grade='A' OR grade='B') AND (course='Law' OR course='Physics');

SELECT * FROM students;




-- Scalar Functions
--  concat, uppercase, lowercase, lenghth...

SELECT concat(first_name,' ', last_name) as "Full Name" FROM students;
-- convert uppercase for specific column value---
 SELECT upper(first_name) * FROM students;
 SELECT upper(first_name) as first_name_using_upper_case, * FROM students;
 SELECT length(first_name) from students;


--  Aggregate Functions
-- avg,max,min, sum, count
SELECT avg(age) FROM students;
SELECT max(age) FROM students;
SELECT min(age) FROM students;
SELECT sum(age) FROM students;
SELECT count(*) FROM students;



-- combined aggregate and scale function...
SELECT max(length(first_name)) FROM students;


-- NOT keyword...
SELECT * from students
WHERE country !='USA';
SELECT * from students
WHERE country <> 'Canada';
SELECT * from students
WHERE NOT country = 'UK';


-- 