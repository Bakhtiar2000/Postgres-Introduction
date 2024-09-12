CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY, 
    department_name VARCHAR(50)   
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,   
    employee_name VARCHAR(50),
    department_id INT REFERENCES departments(department_id),
    salary DECIMAL(10, 2),
    hire_date DATE      
);

INSERT INTO departments (department_name) VALUES
('Human Resources'),
('Marketing'),
('Sales'),
('Finance'),
('Engineering'),
('IT'),
('Customer Service'),
('Legal'),
('R&D'),
('Procurement');

INSERT INTO employees (employee_name, department_id, salary, hire_date) VALUES
('John Doe', 1, 55000.00, '2021-03-15'),
('Jane Smith', 2, 62000.00, '2020-07-21'),
('Alice Johnson', 3, 48000.00, '2019-11-30'),
('Bob Brown', 4, 75000.00, '2018-01-10'),
('Charlie Davis', 5, 68000.00, '2017-06-01'),
('Emily White', 6, 51000.00, '2022-09-11'),
('Frank Green', 7, 45000.00, '2020-05-22'),
('Grace Lee', 8, 78000.00, '2019-08-13'),
('Henry Clark', 9, 72000.00, '2018-12-01'),
('Ivy Adams', 10, 60000.00, '2021-02-05'),
('Jack Black', 1, 53000.00, '2019-10-15'),
('Lily Evans', 2, 61000.00, '2021-04-20'),
('Michael Scott', 3, 59000.00, '2020-03-19'),
('Nina Brown', 4, 80000.00, '2019-07-25'),
('Oliver King', 5, 68000.00, '2022-01-02'),
('Paula Reed', 6, 49000.00, '2017-11-05'),
('Quincy Stone', 7, 43000.00, '2018-08-09'),
('Rachel Adams', 8, 78000.00, '2020-06-15'),
('Sam Wilson', 9, 69000.00, '2021-12-22'),
('Tina Turner', 10, 54000.00, '2022-07-30');


SELECT * FROM employees;
DROP TABLE employees;
SELECT * FROM departments;
DROP TABLE departments;


-- Inner join retrieve Employee and Department Information
SELECT * FROM employees 
    JOIN departments USING(department_id); -- ON employees.department_id = departments.department_id

-- Show dept name with avg salary
SELECT department_name, round(avg(salary)) as avg_salary FROM employees
    JOIN departments USING(department_id)
    GROUP BY department_name;

-- Count employees in Each dept
SELECT department_name, count(employee_id) as employees FROM employees
    JOIN departments USING(department_id)
    GROUP BY department_name;

-- Find the dept name with highest avg salary
SELECT department_name, round(avg(salary)) FROM employees
    JOIN departments USING(department_id)
    GROUP BY department_name
    ORDER BY round DESC
    LIMIT 1

-- Count Employees hired each year
SELECT extract(YEAR FROM hire_date), count(employee_id) FROM employees
    GROUP BY extract

---------------------------------------------------------------------------------
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
)

INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2023-01-15', 150.50),
(2, '2023-01-20', 250.75),
(1, '2023-02-01', 300.00),
(3, '2023-02-10', 120.99),
(2, '2023-03-05', 450.60),
(3, '2023-03-15', 75.20),
(1, '2023-04-01', 230.45),
(2, '2023-04-10', 310.85),
(3, '2023-05-05', 190.10),
(1, '2023-05-15', 125.75);

-- Find customers who have placed more than 2 orders and calculate the total amount spent by each of these customers
SELECT customer_id , count(order_id), sum(total_amount) FROM orders
    GROUP BY customer_id
    HAVING count(order_id) > 2
    ORDER BY customer_id;

-- Find the total amount of orders placed each month in the year 2023
SELECT extract(MONTH FROM order_date) as "month" , sum(total_amount) FROM orders
    WHERE extract(YEAR FROM order_date) = 2023
    GROUP BY "month"