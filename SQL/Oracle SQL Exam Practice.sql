CREATE TABLE students (
    student_id     NUMBER PRIMARY KEY,
    name           VARCHAR2(50),
    department     VARCHAR2(30),
    semester       NUMBER,
    cgpa           NUMBER(3,2),
    city           VARCHAR2(30)
);

INSERT INTO students VALUES (1, 'Ali', 'CS', 3, 3.20, 'Karachi');
INSERT INTO students VALUES (2, 'Haroon', 'IT', 5, 3.50, 'Hyderabad');
INSERT INTO students VALUES (3, 'Ayesha', 'CS', 1, 3.80, 'Lahore');
INSERT INTO students VALUES (4, 'Rehan', 'SE', 7, 2.90, 'Karachi');
INSERT INTO students VALUES (5, 'Ahmed', 'CS', 5, 3.10, 'Islamabad');
INSERT INTO students VALUES (6, 'Zara', 'IT', 1, 3.95, 'Sukkur');
INSERT INTO students VALUES (7, 'Hamza', 'SE', 3, 2.75, 'Karachi');
INSERT INTO students VALUES (8, 'Fatima', 'CS', 7, 3.60, 'Lahore');
INSERT INTO students VALUES (9, 'Usman', 'IT', 5, 2.40, 'Hyderabad');
INSERT INTO students VALUES (10, 'Naila', 'SE', 1, 3.45, 'Larkana');

-- Basic Select
SELECT * FROM students;
SELECT student_id, name FROM students;
--  Alias(as)
SELECT name as "Full_Name" FROM students;
-- Concatenation Operator (||''||)
SELECT student_id ||' '|| name ||' '|| department AS "RollNo"
FROM students;
-- WHERE 
SELECT * FROM students WHERE cgpa > 3.0;
-- OR
SELECT * FROM students WHERE semester=1 OR semester=3;
-- LIKE
SELECT * FROM students WHERE name LIKE 'A%';
-- BETWEEN
SELECT * FROM students WHERE cgpa BETWEEN 3.0 AND 3.8;
-- ORDER BY
SELECT *  FROM students ORDER BY cgpa DESC;
SELECT *  FROM students ORDER BY cgpa ASC;
-- AGGREGATE FUNCTIONS
SELECT AVG(cgpa) FROM students;
-- GROUP BY
SELECT department, COUNT(student_id) AS "Number of Students"
FROM students
GROUP BY department;
SELECT city, COUNT(*) AS "Number Of Students"
FROM students 
GROUP BY city;


-- Practice Problems
-- ✅ SELECT + WHERE Practice Problems
-- 1) Get all students who belong to the CS department.
SELECT * FROM students WHERE department = 'CS';
-- 2) Show only name and cgpa of students from Karachi.
SELECT name, cgpa FROM students WHERE city='Karachi';
-- 3) Get all students with CGPA greater than 3.3.
SELECT * FROM students WHERE cgpa > 3.3;
-- 4) Show students who are in semesters 1 OR 3.
SELECT * FROM students WHERE semester=1 OR semester=3;
-- 5) Display all students whose names start with 'A'.
SELECT * FROM students WHERE name LIKE 'A%';
-- 6) Display all students whose city is NOT Karachi.
SELECT * FROM students WHERE city !='Karachi';
-- 7) Show all students with CGPA between 3.0 and 3.8.
SELECT * FROM students WHERE cgpa BETWEEN 3.0 AND 3.8;
-- 8) Show all students whose department is either CS or IT.
SELECT * FROM students WHERE department= 'CS' OR department='IT';

-- ✅ ORDER BY Practice Problems
-- 9) Show all students sorted by CGPA in descending order.
SELECT name,cgpa FROM students ORDER BY cgpa DESC ;
-- 10) Sort students by department first, then by semester.
SELECT * FROM students ORDER BY department ASC, semester ASC;


-- ✅ AGGREGATE FUNCTIONS Practice Problems
-- 11) Find the average CGPA of all students.
SELECT AVG(cgpa) FROM students;
-- 12) Count how many students are from each city (GROUP BY).
SELECT city, COUNT(*) FROM students GROUP BY city;
-- 13) Find the highest CGPA in the CS department.
SELECT MAX(cgpa) FROM students ;
-- 14) Find the lowest CGPA among IT students.
SELECT MIN(cgpa) FROM students WHERE department='IT';
-- 15) Show departments having more than 2 students (HAVING).
SELECT
    department,
    COUNT(student_id) AS NumberOfStudents
FROM
    students
GROUP BY
    department
HAVING
    COUNT(student_id) > 2;

-- 16) Show the total number of students in each department.
SELECT department, COUNT(student_id) AS "NumberOfStudents" FROM students GROUP BY department;
-- 17) Find student with  highest CGPA
SELECT * FROM students WHERE cgpa=(SELECT MAX(cgpa)FROM students);



CREATE TABLE courses (
    course_id     NUMBER PRIMARY KEY,
    student_id    NUMBER,
    course_name   VARCHAR2(50),
    marks         NUMBER,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);
INSERT INTO courses VALUES (101, 1, 'Database Systems', 85);
INSERT INTO courses VALUES (102, 1, 'Data Structures', 78);
INSERT INTO courses VALUES (103, 2, 'Operating Systems', 92);
INSERT INTO courses VALUES (104, 3, 'Discrete Math', 88);
INSERT INTO courses VALUES (105, 3, 'Programming 1', 91);
INSERT INTO courses VALUES (106, 4, 'Software Engineering', 70);
INSERT INTO courses VALUES (107, 5, 'Database Systems', 73);
INSERT INTO courses VALUES (108, 7, 'Computer Networks', 66);
INSERT INTO courses VALUES (109, 9, 'Programming 1', 55);
INSERT INTO courses VALUES (110, 10, 'Computer Networks', 81);

-- INNER JOIN (Returns only matching rows from both tables.)
SELECT s.student_id, s.name, s.department,
       c.course_name, c.marks
FROM students s
INNER JOIN courses c
ON s.student_id = c.student_id;

-- LEFT JOIN (Returns all students even if they have no courses)
SELECT s.student_id, s.name, c.course_name, c.marks
FROM students s
LEFT JOIN courses c
ON s.student_id = c.student_id;

-- RIGHT JOIN (Returns all courses even if a student does not exist)
SELECT s.name, c.course_name, c.marks
FROM students s
RIGHT JOIN courses c
ON s.student_id = c.student_id;

-- 🔥 INNER JOIN Practice Problems
-- 1) Show each student with his course name and marks.
-- Columns: name, department, course_name, marks.
SELECT s.name, s.department, c.course_name, c.marks
FROM students s
INNER JOIN courses c
ON s.student_id=c.student_id;

-- 2) Show only those students who scored more than 80 in any course.
SELECT s.name, s.department, c.course_name, c.marks
FROM students s
INNER JOIN courses c
ON s.student_id=c.student_id
WHERE c.marks > 80
;
-- 3) Show students from CS department and the courses they have taken.
SELECT s.name,s.department,c.course_name
FROM students s
INNER JOIN courses c 
ON s.student_id=c.student_id 
WHERE s.department='CS';

-- 4) Show all course names along with the cities of the students taking them.
SELECT c.course_name, s.city
FROM students s
INNER JOIN courses c
ON s.student_id = c.student_id ;
-- 5) Show the student name, course_name, and semester for all matching records.
SELECT s.name, c.course_name, s.semester 
FROM students s 
INNER JOIN courses c 
ON s.student_id = c.student_id;

-- 🔵 LEFT JOIN Practice Problems
-- 6) Show all students even if they are not enrolled in any course.
-- (course_name should show NULL)
SELECT s.*
FROM students s
LEFT JOIN courses c
ON s.student_id = c.student_id;

-- 7) List students who have NOT taken any course.
-- (Hint: WHERE course_id IS NULL)
SELECT s.*
FROM students s
LEFT JOIN courses c
ON s.student_id = c.student_id
WHERE c.course_id IS NULL;

-- 8) Show student names with number of courses they took.
-- (Hint: LEFT JOIN + GROUP BY)
SELECT s.name,COUNT(c.course_id) AS "No Of Courses"
FROM students s
LEFT JOIN courses c
ON s.student_id = c.student_id
GROUP BY s.name ;
-- 9) Show all students with their course marks, if any.
-- If a student has no course → marks = NULL
SELECT s.student_id,s.name, s.department,c.course_name,c.marks
FROM students s
LEFT JOIN courses c
ON s.student_id=c.student_id;
-- 10) Show all students and only those courses that belong to semester 1 students.
SELECT s.student_id, s.name, s.semester,
c.course_name
FROM students s
LEFT JOIN courses c
ON s.student_id = c.student_id 
AND s.semester=1;

-- 🔴 RIGHT JOIN Practice Problems
-- 11) Show all courses, even if no matching student exists.
SELECT s.name,c.course_name
FROM courses c
RIGHT JOIN students s
ON c.student_id = s.student_id;

-- 12) Display course_name with student name, showing NULL if student doesn't exist.
SELECT c.course_name,s.name 
FROM courses c
RIGHT JOIN students s
ON c.student_id = s.student_id;
-- 13) List all students who have a valid course record.
-- (RIGHT JOIN + WHERE student_id IS NOT NULL)
SELECT s.* 
FROM courses c
RIGHT JOIN students s
ON c.student_id = s.student_id 
WHERE c.student_id IS NOT NULL;

-- 14) Show all courses taken by students from Lahore.
SELECT c.course_name
FROM courses c
RIGHT JOIN students s
ON c.student_id = s.student_id 
WHERE s.city='Lahore';
-- 15) Show all courses and the departments of the linked students.
SELECT s.name,c.course_name,s.department 
FROM courses c
RIGHT JOIN students s
ON c.student_id = s.student_id 
GROUP BY s.name,c.course_name,s.department;