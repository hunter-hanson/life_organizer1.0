-- creates the life_organizer database and sets it to defualt for the session
CREATE DATABASE life_organizer;
USE life_organizer;

-- creates the subjects table
CREATE TABLE subjects (
    subject_id INT NOT NULL AUTO_INCREMENT,
    subject_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (subject_id)
);

-- creates the books table
CREATE TABLE books (
    book_id INT NOT NULL AUTO_INCREMENT,
    subject_id INT NOT NULL,
    title VARCHAR(500) NOT NULL,
    author_first VARCHAR(100),
    author_last VARCHAR(100),
    PRIMARY KEY (book_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

-- creates the tasks table
CREATE TABLE tasks (
    task_id INT NOT NULL AUTO_INCREMENT,
    task_description VARCHAR(500) NOT NULL,
    priority INT,
    subject_id INT NOT NULL,
    book_id INT,
    PRIMARY KEY (task_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- creates the subtasks
CREATE TABLE subtasks (
    subtask_id INT NOT NULL AUTO_INCREMENT,
    task_id INT NOT NULL,
    subtask_description VARCHAR(500) NOT NULL,
    PRIMARY KEY (subtask_id),
    FOREIGN KEY (task_id) REFERENCES tasks(task_id)
);

-- adds rows of data to the subjects table
INSERT INTO subjects (subject_name) VALUES 
('Hygiene'), ('Health'), ('MRKT 316'), ('CIS 340'), ('Social'), ('Other');

-- adds rows of data to the books table
INSERT INTO books (subject_id, title, author_first, author_last) VALUES 
(3, 'SQL Pocket Guide', 'Alice', 'Zhao'),
(3, 'Consumer Behavior Guide', 'Billy', 'Boby');

-- adds rows of data to the tasks table
INSERT INTO tasks (task_description, priority, subject_id, book_id) VALUES 
('Read a section', 1, 3, 1),
('Write a program', 2, 4, NULL),
('Workout', 5, 2, NULL),
('Brush teeth', 6, 1, NULL);

-- adds rows of data to the subtasks table
INSERT INTO subtasks (task_id, subtask_description) VALUES 
(1, 'Read Sentence 1'),
(2, 'Write first line'),
(1, 'Read Sentence 5'),
(2, 'Stare at diagram');


SELECT * FROM tasks; -- displays the tasks table

-- inserts more data into the tasks table
INSERT INTO tasks(task_description, priority, subject_id, book_id)
VALUES
("Read a section", 4, 3, 2);

-- deletes a task from the tasks table
DELETE FROM tasks
WHERE task_id = 7;

-- assortment of Select statments that show the programmer differnet things
SELECT * FROM subjects;
SELECT * FROM books;
SELECT * FROM subtasks;

-- updates the books table with the appropriate subject_id
UPDATE books
SET subject_id = 4
WHERE book_id = 1;
