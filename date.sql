SELECT now(); 
SELECT now()::date; 
SELECT now()::time; 
SELECT to_char(now(), 'dd/mm/yyyy');
SELECT CURRENT_DATE - INTERVAL '1 year 2 month'; 
SELECT age(CURRENT_DATE, '2000-11-14');
SELECT extract (year from '2024-01-25'::date);


-- Create table with timestamp
CREATE Table timez (ts TIMESTAMP without TIME ZONE, tsz TIMESTAMP with TIME ZONE);
INSERT INTO timez VALUES('2024-01-12 10:45:00', '2024-01-12 10:45:00');


-- Show the age of every students
SELECT age(CURRENT_DATE, dob) FROM students;
