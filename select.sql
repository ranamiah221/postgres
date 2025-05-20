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
('Zaea', 'Scott', 20, 'A', 'Geography', NULL, '2005-02-02', 'AB-', 'Australia'),
('Moyna', 'Green', 21, 'B', 'Sociology', NULL, '2004-09-09', 'B+', 'New Zealand');

-- delete table...
DROP Table students;

-- show table all details...
SELECT * FROM students;

-- show email,age column only ...
SELECT  email, age, blood_group FROM students;

--(change column name) show email in different name student_email.
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


-- Null value find..
SELECT * from students 
WHERE email IS NULL;

SELECT * from students 
WHERE email IS NOT NULL;


-- set default null filed value....use ____COALESCE()

-- when email not provided then work COALESCE VALUES..
SELECT COALESCE(email, 'Email Not Provided.') FROM students;


-- IN, BETWEEN,LIKE and ILIKE operator.

-- when need to multiple OR we use to IN ...
SELECT * FROM students
WHERE country ='UK' OR country = 'Canada' OR country='USA';
-- example
SELECT * FROM students
WHERE country In('UK','Canada','USA');

-- select those student age is 19 to 21.
SELECT * FROM students
     WHERE age BETWEEN 19 and 21;


SELECT * FROM students
     WHERE dob BETWEEN '2004-01-01' and '2005-01-01' ORDER BY dob;

-- using like operator..
SELECT * FROM students
WHERE first_name LIKE 'R%';
SELECT * FROM students
WHERE first_name LIKE '%na';

SELECT * FROM students
WHERE last_name LIKE '__a_';

-- ILIKE operator....
SELECT * FROM students
WHERE first_name ILIKE 'r%';



-- Limit and Offset....
-- example of limit...
SELECT * from students LIMIT 5;
SELECT * FROM students
WHERE country In('UK','Canada','USA') LIMIT 2;


-- offset ... show data 6 to 10
SELECT * FROM students LIMIT 5 OFFSET 5;
-- show data 3 to 7
SELECT * FROM students LIMIT 5 OFFSET 2;

-- pagination using limit and offset...
SELECT * FROM students LIMIT 10 OFFSET 10 * 0;
SELECT * FROM students LIMIT 10 OFFSET 10 * 1;
SELECT * FROM students LIMIT 10 OFFSET 10 * 2;

-- delete data......
SELECT * FROM students;

DELETE FROM students
WHERE grade='B' AND country='USA';
DELETE FROM students
WHERE grade='B';


-- update....
UPDATE students
 set email ='sam@gmail.com'
 WHERE student_id = 22;

 UPDATE students
 set email ='zaea@gmail.com', age=24
 WHERE student_id = 24;

   