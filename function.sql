SELECT * FROM employees;

CREATE Function emp_count()
    RETURNS INT -- Return data type
    LANGUAGE SQL -- language used inside
    as
    $$ -- works as opening bracket
        SELECT count(*) FROM employees;
    $$ -- works as closing bracket

SELECT emp_count();

-------------------------------------------------------------------------
CREATE or REPLACE Function delete_last()
    RETURNS VOID
    LANGUAGE SQL 
    as
    $$
        DELETE FROM employees 
            WHERE employee_id= 
                (SELECT max(employee_id) FROM employees);
    $$

SELECT delete_last();

-------------------------------------------------------------------------
-- Parameters in Function
CREATE or REPLACE Function delete_emp_by_id(p_emp_id int)
    RETURNS VOID
    LANGUAGE SQL 
    as
    $$
        DELETE FROM employees 
            WHERE employee_id= p_emp_id;
    $$

SELECT delete_emp_by_id(19);