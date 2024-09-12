CREATE TABLE employees(
    emp_id INT,
    emp_name VARCHAR(50),
    dept_id INT
);

CREATE TABLE departments(
    dept_id INT,
    dept_name VARCHAR(50)
);

INSERT INTO employees VALUES 
(1, 'John Doe', 101),
(2, 'Jane Smith', 102);

INSERT INTO departments VALUES 
(101, 'Human Resources'), 
(102, 'Marketing');

SELECT * FROM employees;
DROP TABLE employees;
SELECT * FROM departments;
DROP TABLE departments;

-- CROSS join
SELECT * FROM employees
    CROSS JOIN departments;

-- NATURAL join
SELECT * FROM employees
    NATURAL JOIN departments;

