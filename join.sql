-- Active: 1747592879333@@127.0.0.1@5432@ph
CREATE TABLE "user"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL
);

CREATE TABLE post(
    id SERIAL PRIMARY KEY,
    title TEXT,
    user_id INTEGER REFERENCES "user"(id)
);



INSERT INTO "user"(username) VALUES
('alice123'),
('bob_the_builder'),
('charlie99'),
('diana_k'),
('edward007'),
('frankie_5'),
('grace_hopper'),
('henry_dev'),
('irene_c'),
('jackson42');


INSERT INTO post (title, user_id) VALUES
('Hello World!', 4),
('My first post', 2),
('Learning SQL', 1),
('PostgreSQL Tips', 5),
('Database Design 101', 2);


SELECT * from "user";
SELECT * from post;



-- inner join

select title, username from post as p
INNER JOIN "user" as u on p.user_id = u.id;

select * from post as p
INNER JOIN "user" as u on p.user_id = u.id;

select p.id from post as p
INNER JOIN "user" as u on p.user_id = u.id;




select * from "user"
JOIN post on post.user_id = "user".id;


-- left join
INSERT INTO post (title, user_id) VALUES
('This is null post', NULL),
('This is null post 222', NULL);

select * from post
LEFT JOIN "user" on post.user_id = "user".id;

-- right join
select * from post
RIGHT JOIN "user" on post.user_id = "user".id;

-- swipe order...

select * from "user"
LEFT JOIN post on post.user_id = "user".id;

-- right join
select * from "user"
RIGHT JOIN post on post.user_id = "user".id;


-- Full outer Join

select * from post
FULL OUTER JOIN "user" on post.user_id = "user".id;

