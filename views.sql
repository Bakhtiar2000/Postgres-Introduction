SELECT * FROM employees;

CREATE VIEW dept_avg_salary
    AS
    SELECT department_name, round(avg(salary)) FROM employees 
    GROUP BY department_name;

DROP VIEW dept_avg_salary;

-- Storing a complex query in view to use it later
CREATE VIEW contains_R
    AS
    SELECT employee_name, salary, department_name FROM employees
        WHERE department_name IN (
            SELECT department_name FROM employees 
                WHERE department_name LIKE '%R%'
        )

-- Running query on view (Virtual Table)
SELECT * FROM contains_R;