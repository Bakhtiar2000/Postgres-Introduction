CREATE TABLE departments2 (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50)
    )

CREATE TABLE employees2 (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50), 
    age INT,
    email VARCHAR(50) NOT NULL, 
    department_id INT REFERENCES departments(department_id), 
    salary INT, 
    status VARCHAR(50)
    )

INSERT INTO departments2 (department_name) VALUES 
    ('Engineering'),
    ('Marketing'),
    ('Finance');

INSERT INTO employees2 (employee_name, age, email, department_id, salary, status) VALUES
    ('Alice', 30, 'alice@example.com', 1, 60000, NULL),
    ('Bob', 35, 'bob@example.net', 2, 65000, NULL),
    ('Charlie', 28, 'charlie@google.com', 1, 55000, NULL),
    ('David', 33, 'david@yahoo.com', 2, 62000, NULL),
    ('Eve', 31, 'eve@example.net', 3, 58000, NULL),
    ('Frank', 29, 'frank@example.com', 1, 59000, NULL),
    ('Grace', 34, 'grace@google.com', 2, 63000, NULL),
    ('Henry', 32, 'henry@yahoo.com', 3, 57000, NULL),
    ('Ivy', 27, 'ivy@gmail.com', 1, 56000, NULL),
    ('Jack', 36, 'jack@example.net', 2, 64000, NULL),
    ('Karen', 29, 'karen@gmail.com', 3, 60000, NULL),
    ('Liam', 33, 'liam@gmail.com', 1, 59000, NULL),
    ('Mia', 31, 'mia@yahoo.com', 2, 62000, NULL),
    ('Nora', 28, 'nora@yahoo.com', 3, 57000, NULL),
    ('Oliver', 35, 'oliver@example.net', 1, 61000, NULL),
    ('Penelope', 30, 'penelope@google.com', 2, 63000, NULL),
    ('Quinn', 32, 'quinn@google.com', 3, 59000, NULL),
    ('Rachel', 27, 'rachel@gmail.com', 1, 55000, NULL),
    ('Sam', 34, 'sam@example.net', 2, 64000, NULL),
    ('Taylor', 31, 'taylor@yahoo.com', 3, 58000, NULL);

SELECT * FROM employees2;
DROP TABLE employees2;
SELECT * FROM departments2;
DROP TABLE departments2;

-- Query 01
-- Retrieve all employees with a salary greater than 60000
SELECT * FROM employees2 
    WHERE salary > 60000


-- Query 02
-- Retrieve the names of employees using a limit of 2, starting from the 3rd employee.
SELECT employee_name FROM employees2 
    LIMIT 2 OFFSET 2;

-- Query 03
-- Calculate and display the average age of all employees.
SELECT round(avg(age)) as average_age FROM employees2;

-- Query 04
-- Retrieve the names of employees whose email addresses contain
SELECT employee_name FROM employees2
    WHERE email LIKE '%example.com'
        OR email LIKE '%example.net'
        OR email LIKE '%google.com';


-- Query 05
-- Retrieve the names of all employees who belong to the department titled 'Engineering'.
SELECT employee_name FROM employees2
    JOIN departments2 USING(department_id)
    WHERE department_name = 'Engineering'

-- Query 06
-- Update the status of the employee with the highest salary to 'Promoted'
-- Note: You can use a sub query to identify the employee with the highest salary,
UPDATE employees2
    SET status = 'Promoted'
    WHERE salary = (SELECT max(salary) FROM employees2);

-- Query 07
-- Retrieve the department name and the average salary of employees in each department:

SELECT department_name, avg(salary) FROM employees2
    JOIN departments2 USING(department_id)
    GROUP BY department_name
    ORDER BY department_name