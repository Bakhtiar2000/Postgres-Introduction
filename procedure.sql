CREATE Procedure remove_emp_from_var()
    LANGUAGE plpgsql -- a procedural language in PostgreSQL 
    AS
    $$
        DECLARE
            test_var INT; -- Variable declaration inside function
        BEGIN
            SELECT employee_id INTO test_var FROM employees 
                WHERE employee_id = 18; -- Setting variable value

            DELETE FROM employees WHERE employee_id= test_var;
        END
    $$

call remove_emp_from_var();

-------------------------------------------------------------------------
CREATE Procedure remove_emp_by_id(p_emp_id int)
    LANGUAGE plpgsql
    AS
    $$
        DECLARE
            test_var INT;
        BEGIN
            SELECT employee_id INTO test_var FROM employees 
                WHERE employee_id = p_emp_id;

            DELETE FROM employees WHERE employee_id= test_var;
            RAISE NOTICE 'Employee removed successfully!'; -- Shows a notification when employee is removed
        END
    $$

call remove_emp_by_id(18);