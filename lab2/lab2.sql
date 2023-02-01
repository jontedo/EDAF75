-- SQL script to create the tables necessary for lab 1 in EDAF75.
-- MySQL version.
--
-- Creates the tables students, courses, taken_courses and
-- populates them with (simulated) data.
--
-- We disable foreign key checks temporarily so we can delete the
-- tables in arbitrary order, and so insertion is faster.

PRAGMA foreign_keys = off;

-- Drop the tables if they already exist.

DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
  full_name   TEXT NOT NULL,
  username    TEXT NOT NULL,
  password    TEXT NOT NULL,
  PRIMARY KEY  (username)
);

DROP TABLE IF EXISTS tickets;
CREATE TABLE tickets (
  id              TEXT DEFAULT (lower(hex(randomblob(16)))),
  start_time      TIME NOT NULL,
  username        TEXT NOT NULL,
  theater_name    TEXT NOT NULL,
  movie_name      TEXT NOT NULL,
  PRIMARY KEY      (id),
  FOREIGN KEY      (username) REFERENCES customer(username),
  FOREIGN KEY      (theater_name) REFERENCES theaters(theater_name),
  FOREIGN KEY      (movie_name) REFERENCES movies(movie_name)
);

DROP TABLE IF EXISTS theaters;
CREATE TABLE theaters (
  theater_name    TEXT NOT NULL,
  capacity        INTEGER NOT NULL,
  PRIMARY KEY     (theater_name)
);

DROP TABLE IF EXISTS movies;
CREATE TABLE movies (
  movie_name        TEXT NOT NULL,
  imdb_key          TEXT NOT NULL,
  running_time      TIME NOT NULL,
  production_year   INTEGER NOT NULL,
  PRIMARY KEY (imdb_key)
);


-- We will do a lot of inserts, so we start a transaction to make it faster.

BEGIN TRANSACTION;

-- Populate the customers table.

INSERT OR REPLACE
INTO   customers(full_name, username, password)
VALUES ('Filip Lennhager','fi1234le','abc123'),
       ('Jonathan Do','jo1234do','123abc'),
       ('Felix Rödén','fe1234rö','lösenord');

-- Populate the students table.

--INSERT OR REPLACE
--INTO   tickets(id, start_time, username, theater_name, movie_name)
--VALUES (),
--       (),
--       ();

-- Populate the theaters table.

INSERT OR REPLACE
INTO   theaters(theater_name, capacity)
VALUES ('Lund', 100),
       ('Malmö', 200),
       ('Helsingborg', 175);

-- Populate the movies table.

INSERT OR REPLACE
INTO   movies(movie_name, imdb_key, running_time, production_year)
VALUES ('Alien', 'a1', 90, 1980),
       ('Pulp Fiction', 'a2', 93, 1990),
       ('Interstellar', 'a3', 120, 2015);

-- Commit the transaction.

END TRANSACTION;

-- And re-enable foreign key checks.

PRAGMA foreign_key = on;

--Powershell promt, enter in terminal:
--Get-Content lab2.sql | & sqlite3 movies.sqlite