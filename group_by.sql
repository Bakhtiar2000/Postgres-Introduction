-- Show only countries with average age above 20
SELECT country, count(*) as student_count, round(avg(age), 2) as avg_age FROM students
    Group BY country
    HAVING avg(age)> 20;

-- Show each birth year with people born in that birth year
SELECT extract(year from dob) as birth_year , count(*) as people
    FROM students
    Group BY birth_year -- Newly added column