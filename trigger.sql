CREATE TABLE my_users (
    user_name VARCHAR(50),
    email VARCHAR(100)
)

INSERT INTO my_users VALUES
('Mezba', 'mezba@gmail.com'),
('Mir', 'mir@gmail.com'),
('Jhankar', 'jhankar@gmail.com');

SELECT * FROM my_users;

CREATE TABLE deleted_users_audit (
    deleted_user_name VARCHAR(50),
    deletedAt TIMESTAMP
)

SELECT * FROM deleted_users_audit;

-- Trigger Function
CREATE or REPLACE Function save_deleted_user()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    AS
    $$
        BEGIN
          INSERT INTO deleted_users_audit VALUES(OLD.user_name, now());
          RETURN OLD;
          RAISE NOTICE 'Deleted user audit log created';
        END
    $$


-- Trigger 
CREATE or REPLACE TRIGGER save_deleted_user_trigger
BEFORE DELETE
on my_users
for EACH ROW
EXECUTE FUNCTION save_deleted_user();


DELETE FROM my_users WHERE user_name = 'Mir';