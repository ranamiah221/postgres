-- Active: 1747592879333@@127.0.0.1@5432@postgres
SELECT * FROM employees;


-- create a view...
CREATE VIEW sum_department_salary
AS
SELECT department_name, sum(salary) FROM employees GROUP BY(department_name);


-- show view
SELECT * from sum_department_salary;