-- Active: 1747592879333@@127.0.0.1@5432@postgres
CREATE TABLE post(
    id SERIAL PRIMARY KEY,
    title TEXT,
    user_id INTEGER REFERENCES "user"(id)  on DELETE set DEFAULT DEFAULT 2
);

CREATE TABLE "user"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL
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
('Hello World!', 1),
('My first post', 2),
('Learning SQL', 3),
('PostgreSQL Tips', 4),
('Database Design 101', 5);

DROP Table post;
DROP Table "user";

SELECT * from "user";
SELECT * FROM post;


-- delete operation..
-- ON DELETE CASCADE
-- ON DELETE SET NULL

DELETE FROM "user" 
WHERE id=4;



