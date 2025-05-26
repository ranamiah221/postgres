## 1. What is the difference between the VARCHAR and CHAR data types?

### CHAR Datatype:
CHAR datatype is used to store character string of fixed length specified. If the length of the string is less than set or fixed length then it is padded with extra blank spaces. CHAR takes 1 byte for each character. Better performance than VARCHAR.

```
CREATE TABLE students(name VARCHAR(50), gender CHAR(10));
INSERT into students VALUES('Rana Miah','Male');
INSERT into students VALUES('Rony', 'Female');

SELECT LENGTH(gender) FROM students;
```
#### Output:
```
LENGTH(gender)
10
10
```
### VARCHAR Datatype:
VARCHAR Datatype is used to store character string of variable length but a maximum of set length specified. If the length of the string is less than set or fixed length then it will store al it is without padded with extra blank spaces. VARCHAR takes 1 byte for each character and some extra bytes for holding length. Perfomance is not good as compared to CHAR.
```
CREATE TABLE students(name VARCHAR(50), gender CHAR(10));
INSERT into students VALUES('Rana Miah','Male');
INSERT into students VALUES('Rony', 'Female');

SELECT LENGTH(name) FROM students;
``` 
#### Output:
```
LENGTH(name)
9
4
```
## 2. Explain the Primary Key and Foreign Key concepts in PostgreSQL?

### Primary Key:

Primary key is a column (or set of columns) that uniquely identifiers each row in a table. primary key consits two constraint NOT NULL contraint which means the key cannot be empty and another is UNIQUE that means row values must be different.
Syntax of primary key:
```
column_name Data-type PRIMARY KEY
```
#### Create a Table with a Primary Key.
```
CREATE TABLE books (
    book_id INTEGER PRIMARY KEY,
    title TEXT,
    price INTEGER
);
```
### Foreign Key

A foreign key creates a link between two tables when data enter the foreign key column must already exist in the parent table. foreign key build a relation between the two table 

#### Key Term
- Referential Integrity: It ensure the relationship between two table remains consistent.
- Parent Table: It's containing the primary key.
- Child Table: That table containing foreign key and referencing the primary key of parent table.

Syntax for Foreign Key:
```
CREATE TABLE child_table(
    column1 datatype,
    ...
    CONSTRAINT fk_name FOREIGN KEY (foreign_key_column)
    REFERENCES parent_table(primary_key_column)
);
```
#### Foreign Key Constraints: 
There are several contraints that ensure how to behave data in the parent table affect the child table. These contraints set when create table or altering.

- ON DELETE CASECADE: It automatically delete row in the child table when the corresponding row delete in parent table. 
- ON DELETE SET NULL: It automatically set Null value in child table when the corresponding row delete in parent table.
- ON UPDATE CASCADE: It updates the foreign key  in child table when the corresponding row update into the parent table.

## 3. Explain the purpose of the WHERE clause in a SELECT statement?

### SELECT Clause:

The SELECT statement is used to select data from a database.
```
SELECT * FROM TABLE_NAME;
```
SELECT all data of the table and return the data.

### WHERE Clause:

The WHERE clause is used to filter records.It is used to extract only those records that fulfill a specified condition.

```
SELECT * FROM TABLE_NAME
WHERE CONDITION;
```
WHERE clause is very important with this, we can easily filter data based on conditions 

## 4. The LIMIT and OFFSET clauses in SQL are powerful tools for managing and manipulating data?

### LIMIT 
The LIMIT Clause in SQL is used to control number of row s returned in the query result.when a database contains a lot of data and needs to show a certain amount of data to the user, we use LIMIT. 

- Paginating result ( Show 10 data per page )
- Retrieving top records ( The top 5 highest-rated data )
- Sampling data

```
SELECT * FROM student 
LIMIT 3;
```
Showing first Three data of student table.

### OFFSET
The OFFSET clause in sql is a powerful tool used for pagination. OFFSET clause is the identifies when it's starting point from which rows are returned in a result set. offset can't use it's own it use ORDER BY Clause and also used with limit for the pagination.

```
SELECT Fname, Lname
FROM Employee
ORDER BY Salary
OFFSET 1 ROWS;
```
Skips the first row (lowest salary) and shows the rest.

## 5. What is the significance of the JOIN operation, and how does it work in PostgreSQL?
The postgres sql JOIN statement is a powerful tool for combining data rows from one or more table bases on common field. Postgres supports several types of joins, such as INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN, CROSS JOIN, NATURAL JOIN

### INNER JOIN:
Selects those records that have matching values in both tables.<br>
Syntax Inner join:
```
select * from products as p
INNER JOIN categories as c ON p.category_id = c.category_id;
```
### LEFT JOIN
Select all values for left tables and the matching value for right tables.<br>
Syntax Left join:
```
select * from products as p
LEFT JOIN categories as c ON p.category_id = c.category_id;
```
### RIGHT JOIN
Select all values for left tables and the matching value for right tables.<br>
Syntax Right join:
```
select * from products as p
RIGHT JOIN categories as c ON p.category_id = c.category_id;
```
### FULL OUTER JOIN / FULL JOIN
Full join returns a result set that contains all rows from both the left and right tables. <br>
Syntax Right join:
```
select * from products as p
FULL OUTER JOIN categories as c ON p.category_id = c.category_id;
```
### CROSS JOIN
Cross join return a Cartesian product of two table.<br>
Syntax Cross join:
```
SELECT * from products 
CROSS JOIN categories;
```
### NATURAL JOIN
Natural join in sql marges rows from two table based on column same name. The feature of natural join automatically find the same name column, when find same name column then return data if not find the two same column then return empty.<br>
Syntax Natural join:
```
SELECT * from products 
NATURAL JOIN categories;
```
