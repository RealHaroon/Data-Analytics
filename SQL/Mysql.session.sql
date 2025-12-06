/* SQL query is case insensitive*/

CREATE DATABASE temp1 ;   /* Create database*/
DROP DATABASE temp1; /* Destroy database*/

create database class; /* create database */
create database if not exists class; /* Create database if doesn't exist*/
drop database if exists school; /* Dismantle database if exist*/
use class;/* Selected database in action*/
create table student( /* Create table*/
/* Variables*/
id INT PRIMARY KEY,
name varchar(50),
age INT NOT NULL
);
insert into student values (1,"Haroon", 19);/* Individually insertion*/
insert into student values (2,"Abbas", 12);
SHOW DATABASES; /* Display all the databases*/
SHOW TABLES; /* Display all the tables present into database that is in action */
SELECT * FROM student; /* Display selected table*/

create table info(
rollno INT ,
name varchar(50),
PRIMARY KEY (rollno,name) /* Prmary key Constraint */
);
insert into info
(rollno,name)
VALUES
(1,"HAROON"),
(2,"ALI"),
(3,"SOS");
SELECT * FROM info;


create database employee; /* Creating database*/
use employee; /* selected database in action */
create table employees( /* Create table*/
/* variables*/
Id INT ,
Name varchar(50), 
PRIMARY KEY( Id,Name), /* Primary key means that the value of colubmn must be unique  & not null in each row */ 
Salary INT
);                    /* Parameters*/
insert into employees (Id, Name,Salary) /* Inserting data into table*/
VALUES
(1,"Haroon",4000),
(2,"Abbas",4500),
(3,"Khan",4600);
SELECT * FROM employees; /* Printing the particular table*/
SHOW TABLES; /* Displaying all the tables that database contain( that is in use) */
SHOW DATABASES;  /* Display all the databases into the code*/

use employee;
create table temp1(
id INT unique, /* UNIQUE constraint is very similar to the PRIMARY KEY Constraint */
age INT NOT NULL /* NOTNULL */
);
insert into temp1 values(1,3);
insert into temp1 values (1);
SELECT * FROM temp1;

use employee;
create table temp2(
id INT,
salary INT default 2000
);
insert into temp2(id) values (1);
select * from temp2;




create table student_data( /* Creating table */
/* Variables */
rollno INT PRIMARY KEY, Name varchar(50), Marks INT NOT NULL,Grade varchar(5), City varchar (20) 
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

SELECT * FROM student_data WHERE Marks>= 70;
SELECT COUNT(rollno)FROM student_data WHERE City IN ("Karachi");
SELECT * FROM student_data WHERE Grade="A";
SELECT * FROM student_data  ORDER BY Marks DESC;
UPDATE student_data SET Marks=65 WHERE rollno=105;
SELECT AVG(Marks)FROM student_data WHERE City=("Badin");
DELETE FROM student_data WHERE rollno=109;
SELECT City,AVG(Marks) FROM student_data GROUP BY City;
SELECT * FROM student_data ORDER BY Marks DESC LIMIT 3;
SELECT * 
FROM student_data
WHERE Name LIKE 'A%';

SELECT * FROM student_data;
use sample_database;
