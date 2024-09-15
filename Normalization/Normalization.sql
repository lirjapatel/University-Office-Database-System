-- Drop tables if they already exist to avoid conflicts
use project;
DROP TABLE IF EXISTS StudentCourses;
DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Departments;

-- Step 1: Creating Tables in First Normal Form (1NF)

-- Departments Table
CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(255) NOT NULL
);

    
-- Students Table
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentName VARCHAR(255) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Courses Table
CREATE TABLE Courses (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(255) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Enrollments Table (Junction table for many-to-many relationship between Students and Courses)
CREATE TABLE Enrollments (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
show tables;

-- Step 2: Inserting Data

-- Insert Departments
INSERT INTO Departments (DepartmentName) VALUES
('Computer Science'),
('Mathematics'),
('Physics');

-- Insert Courses
INSERT INTO Courses (CourseName, DepartmentID) VALUES
('Introduction to Programming', (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'Computer Science')),
('Data Structures', (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'Computer Science')),
('Calculus', (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'Mathematics')),
('Linear Algebra', (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'Mathematics')),
('Quantum Mechanics', (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'Physics'));

-- Insert Students
INSERT INTO Students (StudentName, DepartmentID) VALUES
('Alice Smith', (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'Computer Science')),
('Bob Johnson', (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'Mathematics')),
('Charlie Brown', (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'Physics'));

-- Insert Enrollments
INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate) VALUES
((SELECT StudentID FROM Students WHERE StudentName = 'Alice Smith'), (SELECT CourseID FROM Courses WHERE CourseName = 'Introduction to Programming'), '2023-01-15'),
((SELECT StudentID FROM Students WHERE StudentName = 'Bob Johnson'), (SELECT CourseID FROM Courses WHERE CourseName = 'Calculus'), '2023-01-15'),
((SELECT StudentID FROM Students WHERE StudentName = 'Charlie Brown'), (SELECT CourseID FROM Courses WHERE CourseName = 'Quantum Mechanics'), '2023-01-15');

-- Step 3: Sample Queries Demonstrating Normalized Data Usage

-- Query to find all courses taken by a student named Alice Smith
SELECT c.CourseName
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE s.StudentName = 'Alice Smith';

-- Query to list all students in the Computer Science department
SELECT s.StudentName
FROM Students s
JOIN Departments d ON s.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Computer Science';

-- This script demonstrates creating a normalized database structure from scratch, including handling relationships and ensuring data integrity.
