DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist


CREATE TABLE regions (
   id SERIAL PRIMARY KEY,
   region TEXT NOT NULL UNIQUE
);

CREATE TABLE categories (
   id SERIAL PRIMARY KEY,
   category TEXT NOT NULL UNIQUE
);

CREATE TABLE users (
   id SERIAL PRIMARY KEY,
   user_name VARCHAR(15),
   preferred_region TEXT
);

CREATE TABLE posts (
   id SERIAL PRIMARY KEY,
   title TEXT NOT NULL,
   details TEXT NOT NULL,
   location TEXT NOT NULL,
   user_id INTEGER REFERENCES users ON DELETE CASCADE,
   region_id INTEGER REFERENCES regions ON DELETE CASCADE,
   category_id INTEGER REFERENCES categories ON DELETE CASCADE
);


INSERT INTO regions
   (region)
VALUES
   ('San Fran'),
   ('Chico'),
   ('Gold Country'),
   ('Humboldt County'),
   ('Sacramento');

INSERT INTO categories
   (category)
VALUES
   ('Jobs'),
   ('Housing'),
   ('Pets'),
   ('Interships'),
   ('Personal Advertisements');

INSERT INTO users
   (user_name, preferred_region)
VALUES
   ('liviu_j_grozav', 'San Fran'),
   ('isa_fran_riolo', 'Chico'),
   ('kam_g_qualls', 'Humboldt County'),
   ('julie_boboc', 'Sacramento'),
   ('tushy_cheta', 'Gold Country');

INSERT INTO posts
   (title, details, location, user_id, region_id, category_id)
VALUES
   ('Theragun', 'Brand new massaging device.', '111 Street Ave', 1, 3, 5),
   ('Mountain Bike', 'Lightly used bike.', '222 Silly St', 3, 4, 1),
   ('Theragun', 'Brand New Massaging Device', '333 No Way', 2, 5, 2),
   ('Theragun', 'Brand New Massaging Device', '444 High Way', 4, 5, 4),
   ('Theragun', 'Brand New Massaging Device', '555 Smokey Ln', 5, 1, 3);