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
## 2. Explain the Primary Key and Foreign Key concepts in PostgreSQL.