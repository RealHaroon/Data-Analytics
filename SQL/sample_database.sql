/*Data : Raw fact and figure is called data or raw data 
Info : Combnation of meta data and data is called info
Meta data: Context/ data discription/ data dictionary */
/*
Database : collection fo related tables
DBS : Database system (DBA,DBMS,DS)
DBMS : System that manages database is called Database Managment System (DBMS)
DBA : Database Administration ( User that interacts with DBS  )

(Database System)DBS ->(DBA -> DBMS -> Database )


There are two types of data (Active & Passive)
Active data: two types of active data(Program & Process)
Program: inactive data (An active data that is inactive )
Process : Active data that is processing (eg: Program execution)


*/





create database sample_database; /* Create database */
drop database sample_database; /* Dismantle database */
use sample_database; /* Use database for the action */

create table student_data( /* Creating table */
/* Variables */
rollno INT PRIMARY KEY, /* Primary key means that the value of colubmn must be unique  & not null in each row */ 
/* In every table Primary key constraint is important to CRUD operations */

 Name varchar(50), Marks INT NOT NULL,Grade varchar(5), City varchar (20) 
);
drop table student_data; /* Dismantle table */
insert into student_data(rollno,Name,Marks,Grade,City) /* Parameters */
values  /* Inserting data */
/* Data */
(101,"Haroon",65,"B","Badin"),
(102,"Abbas",62,"B","Badin"),
(103,"Ali",65,"B","Badin"),
(104,"Ahmed",67,"B","Badin"),
(105,"Alex",61,"B","Badin"),
(106,"Rohan",70,"B+","Karachi"),
(107,"Muhammad",73,"B+","Karachi"),
(108,"Waseem",72,"B+","Karachi"),
(109,"lol",77,"A","Hyderabad"),
(110,"Sameer",75,"A","Hyderabad"),
(111,"Haji",76,"A","Hyderabad"),
(112,"Sagar",73,"A","Mirpurkhas"),
(113,"Azhar",78,"A","Mirpurkhas");

DROP table student_data;

/* SELECT Constraint is use to print given query */
SELECT * FROM student_data;
SELECT rollno,Name FROM student_data;
/* WHERE clause is conditional constraint just like IF */
/* Operators*/
SELECT Name FROM student_data WHERE marks=60; /* WHERE does the conditional filtering */
SELECT * FROM student_data WHERE Marks >=65 AND City ="Badin" ; /* AND Operator satisfies Both conditions */
SELECT * FROM student_data WHERE Marks >=65 OR Grade ="B+" ; /* OR operator satisfies One condition */
SELECT * FROM student_data WHERE Marks BETWEEN 65 AND 70; /* BETWEEN operator selects from given range */
SELECT * FROM student_data WHERE City IN ("Badin","Hyderabad"); /* IN Operator matches given value */
SELECT * FROM student_data WHERE City NOT IN ("Badin","Hyderabad"); /* NOT Operator negates the given condition */
SELECT * FROM student_data WHERE Marks NOT BETWEEN 65 AND 70; /* NOT Operator negates the given condition */
SELECT * FROM student_data WHERE Marks > 65 LIMIT 5; /* LIMIT Clause limits the rows */
SELECT * FROM student_data ORDER BY Marks DESC LIMIT 3;
SELECT * FROM student_data WHERE City IN ("Badin") ORDER BY Name ASC;  /* ORDER BY clause is use to sort data in Ascending (ASC) or Descending (DESC) Order */
SELECT * FROM student_data WHERE Name LIKE 'A%';/*LIKE is an operator used in a WHERE clause to search for a specified pattern in a column. */

/*(%) is a wildcard used with the LIKE operator that matches zero or more characters. */
/* 'A%' will match any string that starts with 'A', followed by zero or more characters (e.g., "Alice", "Alan").
'  %A' will match any string that ends with 'A' (e.g., "Anna", "Sasha").
'  %A%' will match any string that contains 'A' anywhere in the string (e.g., "Mark", "Sarah").*/
/* Aggregate Functions */
/* datatype of all func is Float */
SELECT MAX(Marks) FROM student_data;
SELECT MIN(Marks) FROM student_data;
SELECT AVG(Marks) FROM student_data;  
SELECT COUNT(rollno) FROM student_data; /* Return type INT */
SELECT SUM(Marks) FROM student_data;  

SELECT City ,COUNT(rollno) FROM student_data GROUP BY City; /* GROUP BY clause is use to group data by given condition */
SELECT City ,AVG(Marks) FROM student_data GROUP BY City ORDER BY City ;
SELECT Grade ,COUNT(rollno) FROM student_data GROUP BY Grade ORDER BY Grade;

SELECT City,COUNT(rollno) FROM Student_data GROUP BY City HAVING MAX(Marks)>65; /* HAVING Clause is a conditional clause just like the WHERE clause, It's applicable only on groups*/
/* Genral Order */
SELECT City 
FROM student_data
WHERE Grade="B+"
GROUP BY City 
HAVING MAX(Marks) >=60 
ORDER BY City DESC;
/* SAFE mode is used to prevent unintented Updation & Deletion */
SET SQL_SAFE_UPDATES=0; /* Safe mode off */
SET SQL_SAFE_UPDATES=1; /* Safe mode on */

/* UPDATION & DELETION */
UPDATE student_data 
SET Grade="B+"
WHERE Grade="B";

DELETE FROM student_data 
WHERE Grade="B+";

DELETE FROM student_data
WHERE Marks < 70;

/* ALTER QUERY */ 
/* ADD COLUMN  TO THE TABLE*/
ALTER TABLE student_data
ADD COLUMN age INT NOT NULL DEFAULT 19;

/* MODIFY COLUMN  TO THE TABLE*/
ALTER TABLE student_data
MODIFY COLUMN age varchar(2);
/* CHANGE COLUMN  TO THE TABLE*/
ALTER TABLE student_data
CHANGE age stu_age INT;

ALTER TABLE student_data
CHANGE Name full_name VARCHAR(50);
/* DROP COLUMN  TO THE TABLE*/
ALTER TABLE student_data
DROP COLUMN age ;

ALTER TABLE student_data
DROP COLUMN Grade ;
/* RENAME THE TABLE*/
ALTER TABLE students
RENAME TO student_data ;


/* TRUNCATE deletes all the data from the table */
TRUNCATE TABLE student_data;

/* SUB QUERIES (Sub quieries are use to Retrieve data based on the result of another query) */
/* Case 1 (Using Sub queries w WHERE) */
/* In this case avg marks of students can't be static, Its a dynamic number 'cause avg marks can be change along with the change inthe table */
SELECT full_Name FROM student_data WHERE Marks > (SELECT AVG(Marks) FROM student_data);
/* Case 2 */
SELECT full_Name from student_data WHERE rollno%2=0;
SELECT full_Name,rollno FROM student_data WHERE rollno IN (SELECT rollno from student_data WHERE rollno%2=0);

/* Case 3(Using sub queries w FROM) */
SELECT MAX(Marks) FROM student_data WHERE City = "Hyderabad";
SELECT MAX(Marks)FROM (SELECT * FROM student_data WHERE City="Hyderabad") AS HydTable;
/* Case 4 ( Using sub queries w SELECT)*/
SELECT ( SELECT MAX(Marks) FROM student_data ),full_Name FROM student_data;



                          /* VIEWS */
/* VIEWS in sql (VIEW is a Virtual sub table in that we can limit the access)*/
CREATE VIEW view1 AS 
SELECT rollno,full_Name,Marks
FROM student_data;
SELECT * FROM view1 WHERE Marks>70;
DROP VIEW view1;
use sample_database;


SELECT * FROM student_data;



CREATE TABLE dept(
    Id INT PRIMARY KEY, Name VARCHAR(50)
);
INSERT INTO dept
values
(101,"Cristiano Ronaldo "),
(102,"Messi"),
(103,"Neymar");

UPDATE dept
SET Id=104
WHERE Id=103;
SELECT * FROM dept;

/*                                                          FOREIGN KEY                                       */

CREATE TABLE teacher(
    Id INT PRIMARY KEY, 
    Name VARCHAR(50), 
    Dept_id INT, 
    FOREIGN KEY (Dept_id) REFERENCES Dept(Id)
    /* CASECADING is important for updatation & Deletion in linked tables */
    ON UPDATE CASCADE
    ON DELETE CASCADE

);


INSERT INTO teacher
values
(01,"Seedhe maut",101),
(02,"SOS",102),
(03,"Young stunners",103);
SELECT * FROM teacher;

CREATE TABLE students(
    id INT PRIMARY KEY, student_Name varchar (50) 
);
INSERT into students(id,student_Name)
values
(199,"Ayaz"),
(200,"Rehman"),
(201,"Haroon"),
(202,"Jon"),
(203,"Ali");

CREATE table course(
    id INT PRIMARY KEY,
    course_Name varchar(50)
);
INSERT into course(id, course_Name)
values 
(200,"DSA"),
(201,"DAA"),
(202,"DBMS"),
(203,"ML"),
(204,"AI"),
(205,"Data Science");
drop table students;
drop table course;

/* JOINS in sql */

/* INNER JOIN ( Only returns the overlaping data from both tables )*/
SELECT * FROM students AS a
INNER JOIN course AS b
ON a.id=b.id;


/* LEFT JOIN returns data from left table and overlaping data from right table*/
SELECT * FROM students AS left_table
LEFT JOIN course AS right_table
ON left_table.id=right_table.id;

/* RIGHT JOIN returns data from Right table and overlaping data from left table*/

SELECT * FROM students AS left_table
RIGHT JOIN course AS right_table
ON left_table.id=right_table.id;


/* FUll JOIN returns all the data from left & right table and overlaping data from both table*/
SELECT * FROM students AS left_table
LEFT JOIN course AS right_table
ON left_table.id=right_table.id
UNION
SELECT * FROM students AS left_table
RIGHT JOIN course AS right_table
ON left_table.id=right_table.id;


/* LEFT Exclusive join (Will show the only exclusive data inthe left table) */
SELECT * FROM students AS left_table
LEFT JOIN course AS right_table
ON left_table.id=right_table.id
WHERE right_table.id IS NULL;

/* RIGHT Exclusive join (Will show the only exclusive data inthe right table)*/
SELECT * FROM students AS left_table
RIGHT JOIN course AS right_table
ON left_table.id=right_table.id
WHERE left_table.id IS NULL;

/* FULL exlusive join  (Will show the only exclusive data from both table)*/ 
SELECT * FROM students AS left_table
LEFT JOIN course AS right_table
ON left_table.id=right_table.id
WHERE right_table.id IS NULL
UNION
SELECT * FROM students AS left_table
RIGHT JOIN course AS right_table
ON left_table.id=right_table.id
WHERE left_table.id IS NULL;


CREATE TABLE employee(
    id INT PRIMARY KEY ,
    Name VARCHAR(50),
    manager_id INT
);
INSERT INTO employee(id,Name,manager_id)
values
(01,"Paraboy",03),
(02,"Order",01),
(03,"33Svan",NULL),
(04,"TopG",03);

/* SELF JOIN (Joins table to itself)*/
SELECT a.Name AS Manager, b.Name AS Employee
FROM employee AS a
JOIN employee AS b
ON a.id = b.manager_id;

/* UNION CLAUSE (Gives the Unique/Non Duplicate data )*/
SELECT Name FROM employee
UNION  
SELECT Name FROM employee;


/* UNION-ALL CLAUSE (Gives the All data wether its duplicate or not )*/
SELECT Name FROM employee
UNION  ALL
SELECT Name FROM employee;


select * from employee;






CREATE TABLE PUBG(
   No INT, Name  VARCHAR(50), Team VARCHAR(50)
);
INSERT INTO PUBG(No,)
values

create table customer (
    Id INT PRIMARY KEY, Customer varchar (30), Method  varchar(20),City varchar (20)
);
INSERT into customer(Id,Customer,Method,City)
values 
(101,"Charles Olivera","Credit card","Orlando"),
(102,"Israel Adesaneya","NetBanking","Sydney"),
(103,"Dustin Porier","Debit card","Losiana"),
(104,"Islam Makhachev","Debit card","Dagestan"),
(105,"Jon Jones","NetBanking","New York"),
(106,"Khabib ","Credit card","Dagestan"),
(107,"Belal Muhammad","Debit card","Gaza"),
(108,"Brock lesner","Netbanking","LA"),
(109,"Kamaru Usman","Credit card","Nigeria"),
(110,"Suga sean","Debit card","Orlando");

SELECT Method,COUNT(Id) FROM customer GROUP BY Method;
SELECT * FROM customer;





