-- Active: 1747592879333@@127.0.0.1@5432@ph

-- show all data for person table
SELECT * FROM person;

-- add data into person table..
INSERT INTO person VALUES(6,'Biplop', 23,'biplop@gmail.com');

-- add email column with constraint and set default value for email, when user nothing to input into the email field then set the default value;
ALTER TABLE person
 ADD COLUMN email VARCHAR(50) DEFAULT 'default@gmail.com' NOT NULL;

--  remove the column in person table....
ALTER TABLE person DROP COLUMN email;

-- rename column name...age to user_age;
ALTER TABLE person RENAME COLUMN age to user_age;

-- edit type char/value size....
ALTER TABLE person
alter COLUMN user_name type VARCHAR(50);

-- remove constrain of existing column...
ALTER TABLE person
alter COLUMN user_age DROP NOT NULL;

-- set constrain of existing column...
ALTER TABLE person2
alter COLUMN age set NOT NULL;

-- remove constrain of existing column...
ALTER TABLE person2
alter COLUMN age DROP NOT NULL;

-- add constrain unique...

ALTER TABLE person
 add constraint unique_person_user_name UNIQUE(user_name);

-- drop constrain unique...

ALTER TABLE person
 drop constraint unique_person_user_name;

--  insert values for person2 table..
INSERT into person2 (id, user_name, age) VALUES(2, 'Rana Miah', 23);

-- show data for table person 2
SELECT * FROM person2;

--  use truncate for remove all existing rows...
TRUNCATE Table person2;
