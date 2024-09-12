CREATE TABLE "user"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL
)

CREATE TABLE post(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES "user"(id)
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
('Nodi''s wisdom is amazing', 4),
('None is there for me', NULL);


SELECT * FROM post;
SELECT * FROM "user";
DROP TABLE post;
DROP TABLE "user";

-- Joining two tables
SELECT * FROM post JOIN "user" 
    on post.user_id = "user".id;

SELECT u.id as user_table_id, p.id as post_table_id FROM post as p JOIN "user" as u -- Table name aliasing happened: post as p and user as u
 on p.user_id = u.id;

 -- Inner join
 SELECT * FROM post INNER JOIN "user" 
    on post.user_id = "user".id;
 -- Left join (post is the left table)
SELECT * FROM post LEFT JOIN "user" 
    on post.user_id = "user".id;
 -- Right join (user is the right table)
SELECT * FROM post RIGHT JOIN "user" 
    on post.user_id = "user".id;
 -- Full join
SELECT * FROM post FULL JOIN "user" 
    on post.user_id = "user".id;
--N.B: Left Join = Left Outer Join, Right Join = Right Outer Join, Full Join = Full Outer Join