-- Active: 1747592879333@@127.0.0.1@5432@postgres
CREATE Table my_users(user_name VARCHAR(50), email VARCHAR(100));

INSERT INTO my_users VALUES ('Rana','rana@gmail.com'),('Rony', 'rony@gmail.com');

SELECT * from my_users;

CREATE TABLE deleted_user_info(
  deleted_user_name VARCHAR(50),
  deleted_time TIMESTAMP
);

SELECT * FROM deleted_user_info;

-- trigger function
CREATE OR REPLACE Function save_deleted_user()
RETURNS TRIGGER
LANGUAGE plpgsql
AS 
$$
    BEGIN
         INSERT INTO deleted_user_info VALUES(OLD.user_name, now());
         RAISE NOTICE 'Deleted user audit log created';
         RETURN OLD;
    END
$$;

CREATE or REPLACE Trigger save_delated_user_trigger
BEFORE DELETE
ON my_users
FOR EACH ROW
EXECUTE FUNCTION save_deleted_user();

DELETE FROM my_users WHERE user_name = 'Rony';