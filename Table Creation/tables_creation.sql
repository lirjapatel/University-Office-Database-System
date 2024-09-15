show databases;
create database project;
use project;
    CREATE TABLE Classroom (
        ClassroomID INT PRIMARY KEY,
        BuildingName VARCHAR(100),
        RoomNumber VARCHAR(100),
        Capacity INT
    );
    
       CREATE TABLE Student (
        StudentID INT PRIMARY KEY,
        FirstName VARCHAR(100),
        LastName VARCHAR(100),
        Email VARCHAR(100),
        Major VARCHAR(100)
    );
    
 CREATE TABLE Department (
        DepartmentID INT PRIMARY KEY,
        Name VARCHAR(100),
        Chairperson VARCHAR(100)
    );
    

    CREATE TABLE Course (
        CourseID INT PRIMARY KEY,
        Title VARCHAR(255),
        Description TEXT,
        CreditHours INT,
        DepartmentID INT,
        FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
    );
    




    CREATE TABLE Enrollment (
        EnrollmentID INT PRIMARY KEY,
        StudentID INT,
        CourseID INT,
        Semester VARCHAR(50),
        Grade CHAR(2),
        FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
        FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
    );
    


    CREATE TABLE Instructor (
        InstructorID INT PRIMARY KEY,
        FirstName VARCHAR(100),
        LastName VARCHAR(100),
        DepartmentID INT,
        FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
    );
    


    CREATE TABLE Semester (
        SemesterID INT PRIMARY KEY,
        Term VARCHAR(50),
        Year INT,
        StartDate DATE,
        EndDate DATE
    );
    


 

show tables;