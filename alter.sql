-- Active: 1725967185419@@127.0.0.1@5432@ph
SELECT * FROM person2;

ALTER TABLE person2
    ADD COLUMN email VARCHAR(25) DEFAULT 'default@mail.com' NOT NULL;

INSERT INTO person2 VALUES(4, 'Bithy', 30, 'bithy@gmail.com') 

ALTER TABLE person2
    DROP COLUMN email;

ALTER TABLE person2
    RENAME COLUMN age to user_age;

ALTER TABLE person2
    ALTER COLUMN user_name TYPE VARCHAR(50);

ALTER TABLE person2
    ALTER COLUMN user_age set NOT NULL;

ALTER TABLE person2
    ALTER COLUMN user_age drop NOT NULL;

ALTER TABLE person2
    ADD constraint unique_person2_user_age UNIQUE(user_age);

ALTER TABLE person2
    DROP constraint unique_person2_user_age;

TRUNCATE TABLE person2;