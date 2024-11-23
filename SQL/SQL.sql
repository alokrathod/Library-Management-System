
-- create a databse for our Library Managemnt System
CREATE DATABASE lms;



-- using lms database
USE lms;



-- creating a table for admins

CREATE TABLE admins(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    username VARCHAR(50),
    password VARCHAR(50),
    email VARCHAR(100)
);

SELECT * FROM admins;



-- creating a table to store the details of the books

CREATE TABLE book_details(
	book_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	book_name VARCHAR(250),
    author VARCHAR(100),
    quantity INT
);

-- INSERT INTO book_details(book_id, book_name, author, quantity)
-- VALUES (1, 'Java', 'Java Man', 2),
-- 		(2, 'Python', 'Python Man', 4);

SELECT * FROM book_details;



-- creating a table of courses

CREATE TABLE courses(
	courseName VARCHAR(50) PRIMARY KEY
);

INSERT INTO courses(courseName)
VALUES ('B.Tech'),
		('M.Tech'),
        ('PhD');

SELECT * FROM courses;



-- creating a table of branches

CREATE TABLE branches(
	branchName VARCHAR(50) PRIMARY KEY
);

INSERT INTO branches(branchName)
VALUES ('CSE'),
		('ECE'),
        ('EEE'),
        ('MECH'),
        ('CHEM');

SELECT * FROM branches;



-- craeting a table to store the details of students

CREATE TABLE student_details(
	student_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(100),
    course VARCHAR(100) REFERENCES courses(courseName),
    branch VARCHAR(100) REFERENCES branches(branchName)
);

-- INSERT INTO student_details(student_id, name, course, branch)
-- VALUES (1, 'Alok', 'B.Tech', 'CSE'),
-- 		(2, 'Kumar', 'M.Tech', 'MECH');


SELECT * FROM student_details;



-- creating a table to add the issued book details


CREATE TABLE issue_book_details(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    book_id INT REFERENCES book_details(book_id),
    student_id INT REFERENCES student_details(student_id),
    issue_date DATE,
    due_date DATE,
    status VARCHAR(20)
);

SELECT * FROM issue_book_details;

-- Fetching data with book and student names
SELECT 
    ibd.id,
    bd.book_name,
    sd.name AS student_name,
    ibd.issue_date,
    ibd.due_date,
    ibd.status
FROM 
    issue_book_details AS ibd
JOIN 
    book_details bd ON ibd.book_id = bd.book_id
JOIN 
    student_details sd ON ibd.student_id = sd.student_id;


