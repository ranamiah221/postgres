-- Active: 1747592879333@@127.0.0.1@5432@postgres
SELECT * FROM employees;

CREATE FUNCTION emp_count()
RETURNS INT
LANGUAGE SQL
AS $$
    SELECT count(*) FROM employees;
$$;

-- create a delete function....
CREATE Function delete_user()
RETURNS void
LANGUAGE SQL
AS $$
  DELETE FROM employees WHERE employee_id = 30;
$$;

CREATE OR REPLACE Function em_delete_user(p_em_id INT)
RETURNS void
LANGUAGE SQL
AS $$
  DELETE FROM employees WHERE employee_id = p_em_id;
$$;

SELECT emp_count ();

SELECT delete_user ();

SELECT em_delete_user (29);

CREATE Procedure remove_em()
LANGUAGE plpgsql
AS $$
    BEGIN
      DELETE FROM employees WHERE employee_id = 28;
    END
$$
CALL remove_em();

CREATE PROCEDURE remove_employee()
LANGUAGE plpgsql
AS $$
DECLARE 
    test_var INT;
BEGIN
    SELECT employee_id INTO test_var FROM employees WHERE employee_id = 25;
    DELETE FROM employees WHERE employee_id = test_var;
END;
$$;

CALL remove_employee();

CREATE PROCEDURE p_remove_employee(p_employee_id INT)
LANGUAGE plpgsql
AS $$
DECLARE 
    test_var INT;
BEGIN
    SELECT employee_id INTO test_var FROM employees WHERE employee_id = p_employee_id;
    DELETE FROM employees WHERE employee_id = test_var;
END;
$$;


CALL p_remove_employee(27);

SELECT * FROM employees;