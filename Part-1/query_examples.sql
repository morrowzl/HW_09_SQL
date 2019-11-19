-- Create a table of students
CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  last_name VARCHAR NOT NULL,
  first_name VARCHAR NOT NULL
);

-- Create a table of courses
CREATE TABLE courses (
  id INTEGER NOT NULL PRIMARY KEY,
  course_name VARCHAR NOT NULL
);

-- Create a junction table.
CREATE TABLE student_courses_junction (
  student_id INTEGER NOT NULL,
  FOREIGN KEY (student_id) REFERENCES students(id),
  course_id INTEGER NOT NULL,
  FOREIGN KEY (course_id) REFERENCES courses(id),
  course_term VARCHAR NOT NULL,
  PRIMARY KEY (student_id, course_id)
);

-- Insert Data into table
INSERT INTO students (id, last_name, first_name)
VALUES
  (1, 'Skywalker', 'Luke'),
  (2, 'Skywalker', 'Leia'),
  (3, 'Solo', 'Han');

INSERT INTO courses (id, course_name)
VALUES
  (3201, 'Data modeling'),
  (3202, 'Data visualization'),
  (12101, 'Force utilization');

INSERT INTO student_courses_junction (student_id, course_id, course_term)
VALUES
  (1,12101, 'Spring'),
  (1,3201, 'Fall'),
  (1,3202, 'Fall'),
  (2,12101, 'Fall'),
  (2,3202, 'Spring'),
  (3,3201, 'Spring'),
  (3,3202, 'Fall');

-- Query Tables
SELECT * FROM students;

SELECT * FROM courses;

SELECT * FROM student_courses_junction;

-- A join statement to query all courses taken by students
SELECT s.id, s.last_name, s.first_name, c.id, c.course_name, j.course_term
FROM students s
LEFT JOIN student_courses_junction j
ON s.id = j.student_id
LEFT JOIN courses c
ON c.id = j.course_id;

-- ------------------------------------------------------------------------------
-- Drop table if exists
DROP TABLE players;

-- Create the players table
CREATE TABLE players (
	player_id INT,
	first_name VARCHAR,
	last_name VARCHAR,
	hand VARCHAR,
	country_code VARCHAR
);

-- Check data import
SELECT *
FROM players;

-- Create the matches table
CREATE TABLE matches (
	loser_age DEC,
	loser_id INT,
	loser_name VARCHAR,
	loser_rank INT,
	winner_age DEC,
	winner_id INT,
	winner_name VARCHAR,
	winner_rank INT
);

-- Check data import
SELECT *
FROM matches;

-- Perform an INNER JOIN on the two tables
SELECT players.first_name, players.last_name, players.hand, matches.loser_rank
FROM matches
INNER JOIN players ON
players.player_id=matches.loser_id;

-- Alternative solution:
-- Perform an INNER JOIN on the two tables
SELECT p.first_name, p.last_name, p.hand, m.loser_rank
FROM matches AS m
INNER JOIN players AS p ON
p.player_id=m.loser_id;
