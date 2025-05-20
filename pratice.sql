-- Active: 1747592879333@@127.0.0.1@5432@postgres
create TABLE students(
    id SERIAL PRIMARY KEY,
    roll SMALLINT UNIQUE,
    name VARCHAR(50),
    age SMALLINT,
    department VARCHAR(100),
    score INT,
    status VARCHAR(50),
    last_login DATE
);
SELECT * FROM students;

ALTER Table students
  ADD COLUMN email VARCHAR(50);
ALTER Table students RENAME COLUMN email to student_email;

ALTER TABLE students
ADD constraint uniqu_student_email  UNIQUE(student_email);

CREATE Table courses(course_id VARCHAR(50),
course_name VARCHAR(50),
duration VARCHAR(20),
PRIMARY KEY(course_id)
);
SELECT * from courses;
DROP Table courses;