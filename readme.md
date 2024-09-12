### 1. **What is PostgreSQL?**

PostgreSQL is an open-source, powerful, and object-relational database management system (ORDBMS) known for its robustness, extensibility, and standards compliance. It supports advanced data types, ACID compliance, complex queries, and custom functions, making it suitable for high-performance and large-scale applications.

### 2. **What is the purpose of a database schema in PostgreSQL?**

A **schema** in PostgreSQL is a namespace that organizes and groups database objects like tables, views, and functions. It helps manage object names by allowing multiple objects with the same name but in different schemas, enabling logical organization and better security by defining access privileges at the schema level.

### 3. **Explain the primary key and foreign key concepts.**

- **Primary Key**: A primary key is a unique identifier for each record in a table. It ensures that no two rows can have the same value and prevents null values. A table can have only one primary key, often composed of one or more columns.
- **Foreign Key**: A foreign key is a column or a set of columns that establishes a link between two tables. It refers to the primary key of another table, enforcing referential integrity by ensuring that data in the foreign key column exists in the referenced primary key column.

### 4. **What is the difference between the VARCHAR and CHAR data types?**

- **VARCHAR(n)**: A variable-length character string with a maximum limit of `n` characters. The actual storage depends on the input size, so it is space-efficient.
- **CHAR(n)**: A fixed-length character string. It always reserves space for `n` characters, and any unused space is padded with spaces. This makes it less flexible and potentially wasteful compared to `VARCHAR`.

### 5. **Explain the purpose of the WHERE clause in a SELECT statement.**

The `WHERE` clause filters records in a query based on specific conditions. It retrieves only those rows that meet the condition(s) provided, helping refine the data returned by a `SELECT` statement.

Example:

````sql
SELECT * FROM employees WHERE salary > 50000;

### 6. **What are the LIMIT and OFFSET clauses used for?**

- **LIMIT**: Specifies the maximum number of rows to return in a query.
- **OFFSET**: Skips a specified number of rows before starting to return rows. These clauses are useful for pagination in large datasets.

Example:
```sql
SELECT * FROM employees ORDER BY hire_date LIMIT 10 OFFSET 20;
````
