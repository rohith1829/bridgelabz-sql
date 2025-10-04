-- Tables
CREATE TABLE Book (
  book_id INT PRIMARY KEY,
  title VARCHAR(100),
  author VARCHAR(50),
  available_copies INT
);

CREATE TABLE Student (
  student_id INT PRIMARY KEY,
  name VARCHAR(50),
  branch VARCHAR(50)
);

CREATE TABLE Issue (
  issue_id INT PRIMARY KEY,
  student_id INT,
  book_id INT,
  issue_date DATE,
  return_date DATE,
  FOREIGN KEY(student_id) REFERENCES Student(student_id),
  FOREIGN KEY(book_id) REFERENCES Book(book_id)
);

INSERT INTO Book (book_id, title, author, available_copies) VALUES
(101, 'Java Programming', 'Herbert Schildt', 5),
(102, 'Database Systems', 'Raghu Ramakrishnan', 3),
(103, 'Operating System Concepts', 'Silberschatz', 4),
(104, 'Computer Networks', 'Andrew Tanenbaum', 2),
(105, 'Data Structures in C', 'Reema Thareja', 6);

INSERT INTO Student (student_id, name, branch) VALUES
(201, 'Ravi Kumar', 'CSE'),
(202, 'Sita Devi', 'ECE'),
(203, 'Rohith Chagaleru', 'AIML'),
(204, 'Kiran Reddy', 'EEE'),
(205, 'Varun Teja', 'MECH');


INSERT INTO Issue (issue_id, student_id, book_id, issue_date, return_date) VALUES
(301, 201, 101, '2025-09-01', '2025-09-15'),
(302, 202, 102, '2025-09-02', NULL),
(303, 203, 103, '2025-09-03', '2025-09-20'),
(304, 204, 104, '2025-09-05', NULL),
(305, 201, 105, '2025-09-07', NULL),
(306, 205, 101, '2025-09-08', NULL);
