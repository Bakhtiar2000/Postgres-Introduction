
CREATE TABLE students(
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT check (age >= 18),
    grade CHAR(2),
    course VARCHAR(50),
    email VARCHAR(100),
    dob DATE,
    blood_group VARCHAR(5),
    country VARCHAR(50)
)

-- Insert 20 values into students table
INSERT INTO students (first_name, last_name, age, grade, course, email, dob, blood_group, country)
VALUES 
('John', 'Doe', 19, 'A', 'Math', 'johndoe@example.com', '2005-05-12', 'O+', 'USA'),
('Jane', 'Smith', 20, 'B', 'History', 'janesmith@example.com', '2004-08-23', 'A-', 'UK'),
('Michael', 'Johnson', 22, 'C', 'Physics', NULL , '2002-09-16', 'B+', 'Canada'),
('Emily', 'Williams', 18, 'A', 'Computer Science', 'emilywilliams@example.com', '2006-03-29', 'O-', 'Australia'),
('David', 'Brown', 19, 'B', 'Chemistry', 'davidbrown@example.com', '2005-12-10', 'AB+', 'USA'),
('Olivia', 'Jones', 21, 'A', 'English', 'oliviajones@example.com', '2003-11-05', 'B-', 'USA'),
('James', 'Garcia', 23, 'C', 'Biology', 'jamesgarcia@example.com', '2001-07-02', 'A+', 'Mexico'),
('Sophia', 'Miller', 20, 'B', 'Philosophy', NULL , '2004-01-17', 'O+', 'UK'),
('William', 'Davis', 19, 'A', 'Math', 'williamdavis@example.com', '2005-04-11', 'A-', 'USA'),
('Isabella', 'Rodriguez', 18, 'B', 'History', 'isabellarodriguez@example.com', '2006-06-25', 'B+', 'Spain'),
('Elijah', 'Martinez', 21, 'C', 'Physics', 'elijahmartinez@example.com', '2003-10-19', 'O-', 'Brazil'),
('Mia', 'Hernandez', 20, 'A', 'Computer Science', 'miahernandez@example.com', '2004-05-30', 'AB+', 'USA'),
('Alexander', 'Lopez', 19, 'B', 'Chemistry', 'alexanderlopez@example.com', '2005-03-14', 'B-', 'USA'),
('Amelia', 'Gonzalez', 22, 'A', 'English', 'ameliagonzalez@example.com', '2002-08-22', 'A+', 'Argentina'),
('Benjamin', 'Perez', 18, 'C', 'Biology', 'benjaminperez@example.com', '2006-12-18', 'O+', 'USA'),
('Charlotte', 'Turner', 23, 'B', 'Philosophy', NULL , '2001-09-09', 'B+', 'Canada'),
('Lucas', 'Torres', 19, 'A', 'Math', 'lucastorres@example.com', '2005-07-07', 'A-', 'Portugal'),
('Harper', 'Flores', 18, 'B', 'History', 'harperflores@example.com', '2006-01-21', 'O+', 'USA'),
('Henry', 'Rivera', 21, 'C', 'Physics', 'henryrivera@example.com', '2003-02-14', 'AB-', 'Colombia'),
('Evelyn', 'Sanders', 20, 'A', 'Computer Science', 'evelynsanders@example.com', '2004-11-30', 'A+', 'USA');

SELECT email as "Student Email", age, blood_group as bg FROM students;

SELECT * FROM students ORDER BY first_name DESC;

SELECT DISTINCT country FROM students;

SELECT * FROM students 
    WHERE (country = 'USA' OR country = 'Canada') AND (age > 17 AND age <= 22) AND grade!= 'A'

SELECT * FROM students 
    WHERE grade = 'C' AND course = 'Physics';

-- Scaler function
SELECT concat(first_name, ' ', last_name) as fullName FROM students;
SELECT upper(country) FROM students;

-- Aggregate function
SELECT avg(age) from students;
SELECT max(age) from students;
SELECT count(*) from students;

-- Scaler + Aggregate function
SELECT max(length(first_name)) from students;

-- Handle NULL value using is keyword
SELECT * FROM students
    WHERE email is NOT NULL;

SELECT COALESCE(email, 'Email Not Found!') FROM students;

SELECT * FROM students
    WHERE country NOT IN('USA', 'Australia') LIMIT 5;

SELECT * FROM students
    WHERE dob BETWEEN '2004-01-01' AND '2004-12-31' ORDER BY dob;

SELECT * FROM students
    WHERE first_name LIKE '%a';

SELECT * FROM students
    WHERE first_name LIKE '__a%';

SELECT * FROM students
    WHERE first_name ILIKE 'a%'; -- ILIKE is case insensitive whereas LIKE is case sensitive

-- LIMIT and OFFSET to implement Pagination
SELECT * FROM students LIMIT 5 OFFSET 5 * 0;
SELECT * FROM students LIMIT 5 OFFSET 5 * 1;
SELECT * FROM students LIMIT 5 OFFSET 5 * 2;

DELETE FROM students WHERE grade = 'B' AND country = 'USA';

SELECT * FROM students

UPDATE students 
    SET email = 'default@gmail.com', age = 30, grade = 'A'
    WHERE student_id = 23;