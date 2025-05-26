-- Active: 1747592879333@@127.0.0.1@5432@ph
CREATE TABLE employees(
    emp_id INT,
    emp_name VARCHAR(50),
    dept_id INT
);
CREATE TABLE departments(
    dept_id INT,
    dept_name VARCHAR(50)
);

INSERT INTO employees VALUES
(1, 'John Doe', 101),
(2, 'John Smith', 102);

INSERT INTO departments VALUES
(101, 'CSE'),
(102, 'EEE');

SELECT * FROM employees;
SELECT * FROM departments;

-- CROSS JOIN...
SELECT * from employees 
CROSS JOIN departments;

-- NUTURAL JOIN..
SELECT * from employees 
NATURAL JOIN departments;

