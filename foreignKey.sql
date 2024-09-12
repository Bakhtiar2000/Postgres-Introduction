CREATE TABLE "user"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL
)

CREATE TABLE post(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    -- user_id INTEGER REFERENCES "user"(id) ON  SET DEFAULT DEFAULT 2 -- Sets default value 2 if foreign key is not provided
    -- user_id INTEGER REFERENCES "user"(id) ON DELETE SET NULL 
    user_id INTEGER REFERENCES "user"(id) ON DELETE CASCADE -- This is the Foreign Key from user table. When the id on user table gets deleted, the foreign key table on post table also gets deleted as we used ON DELETE CASCADE

)

INSERT INTO "user" (username) VALUES
('akash'),
('batash'),
('sagor'),
('nodi');

INSERT INTO post (title, user_id) VALUES
('Enjoying a sunny day with akash', 2),
('Batash just joined the chat', 1),
('Exploring with sagor!', 4),
('Nodi''s wisdom is amazing', 4); 
-- N.B: user_id must sync with the id of user table. If a input user_id does not match with any id of user table then it will throw an error


SELECT * FROM post;
SELECT * FROM "user";
DROP TABLE post;
DROP TABLE "user";


ALTER Table post 
    ALter COLUMN user_id set NOT NULL;

DELETE FROM "user" WHERE id = 4; 