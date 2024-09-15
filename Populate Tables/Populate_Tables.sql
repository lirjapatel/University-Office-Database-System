use project;

    INSERT INTO Classroom (ClassroomID, BuildingName, RoomNumber, Capacity) VALUES
    (101, 'Science Building', '101', 30),
    (102, 'Engineering Hall', '201', 50),
    (103, 'Liberal Arts Building', '301', 40);
    


    INSERT INTO Department (DepartmentID, Name, Chairperson) VALUES
    (1, 'Computer Science', 'Dr. Alan Turing'),
    (2, 'Mathematics', 'Dr. Isaac Newton'),
    (3, 'Physics', 'Dr. Albert Einstein');
    

    INSERT INTO Course (CourseID, Title, Description, CreditHours, DepartmentID) VALUES
    (101, 'Intro to Computer Science', 'An introduction to the fundamentals of computer science', 3, 1),
    (102, 'Calculus I', 'Differential and integral calculus of one variable', 4, 2),
    (103, 'General Physics I', 'An introduction to mechanics, heat, and sound', 4, 3);
    

    INSERT INTO Student (StudentID, FirstName, LastName, Email, Major) VALUES
    (1, 'John', 'Doe', 'john.doe@example.com', 'Computer Science'),
    (2, 'Jane', 'Smith', 'jane.smith@example.com', 'Mathematics'),
    (3, 'Emily', 'Jones', 'emily.jones@example.com', 'Physics');
    


    INSERT INTO Enrollment (EnrollmentID, StudentID, CourseID, Semester, Grade) VALUES
    (1, 1, 101, 'Fall 2023', 'A'),
    (2, 2, 102, 'Spring 2024', 'B'),
    (3, 3, 103, 'Fall 2023', 'A');
    


    INSERT INTO Instructor (InstructorID, FirstName, LastName, DepartmentID) VALUES
    (1, 'Alice', 'Johnson', 1),
    (2, 'Bob', 'Lee', 2),
    (3, 'Charlie', 'Kim', 3);
    


    INSERT INTO Semester (SemesterID, Term, Year, StartDate, EndDate) VALUES
    (1, 'Fall', 2023, '2023-08-25', '2023-12-15'),
    (2, 'Spring', 2024, '2024-01-10', '2024-05-05');
    




