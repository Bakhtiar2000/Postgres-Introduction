CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,   
    employee_name VARCHAR(50) NOT NULL,
    department_name VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE      
);

INSERT INTO employees (employee_name, department_name, salary, hire_date) VALUES
('John Doe', 'Human Resources', 55000.00, '2021-03-15'),
('Jane Smith', 'Marketing', 62000.00, '2020-07-21'),
('Alice Johnson', 'Sales', 48000.00, '2019-11-30'),
('Bob Brown', 'Finance', 75000.00, '2018-01-10'),
('Charlie Davis', 'Engineering', 68000.00, '2017-06-01'),
('Emily White', 'IT', 51000.00, '2022-09-11'),
('Frank Green', 'Customer Service', 45000.00, '2020-05-22'),
('Grace Lee', 'Legal', 78000.00, '2019-08-13'),
('Henry Clark', 'R&D', 72000.00, '2018-12-01'),
('Ivy Adams', 'Procurement', 60000.00, '2021-02-05'),
('Jack Black', 'Human Resources', 53000.00, '2019-10-15'),
('Lily Evans', 'Marketing', 61000.00, '2021-04-20'),
('Michael Scott', 'Sales', 59000.00, '2020-03-19'),
('Nina Brown', 'Finance', 80000.00, '2019-07-25'),
('Oliver King', 'Engineering', 68000.00, '2022-01-02'),
('Paula Reed', 'IT', 49000.00, '2017-11-05'),
('Quincy Stone', 'Customer Service', 43000.00, '2018-08-09'),
('Rachel Adams', 'Legal', 78000.00, '2020-06-15'),
('Sam Wilson', 'R&D', 69000.00, '2021-12-22'),
('Tina Turner', 'Procurement', 54000.00, '2022-07-30');

DROP TABLE employees;
SELECT * FROM employees;

-- Retrieve all employees whose salary is greater the highest salary of the HR dept
SELECT * FROM employees
    WHERE salary > (
        SELECT max(salary) FROM employees   
            WHERE department_name = 'Human Resources' 
    )


-- Sub query with SELECT clause (Returns single value)
SELECT * , (SELECT sum(salary) FROM employees) From employees;

-- Sub query with FROM clause (Treated as derived table)
SELECT department_name FROM 
    (SELECT department_name , sum(salary) FROM employees GROUP BY department_name)
        as dept_name;

-- Sub query with WHERE clause (used to filter data)
SELECT employee_name, salary, department_name FROM employees
    WHERE department_name IN (
        SELECT department_name FROM employees 
            WHERE department_name LIKE '%R%'
    )

