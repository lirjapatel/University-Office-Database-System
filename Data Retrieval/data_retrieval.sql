
-- Fetch all courses along with their department names
SELECT c.CourseID, c.Title, c.Description, d.Name AS DepartmentName
FROM Course c
JOIN Department d ON c.DepartmentID = d.DepartmentID;

-- Retrieve all enrollments for 'Intro to Computer Science' in 'Fall 2023'
SELECT e.StudentID, s.FirstName, s.LastName, e.Grade
FROM Enrollment e
JOIN Student s ON e.StudentID = s.StudentID
JOIN Course c ON e.CourseID = c.CourseID
WHERE c.Title = 'Intro to Computer Science' AND e.Semester = 'Fall 2023';

-- List all classrooms with their capacity and building names
SELECT ClassroomID, BuildingName, RoomNumber, Capacity
FROM Classroom;



-- List all courses along with the count of enrolled students for 'Fall 2023'
SELECT c.CourseID, c.Title, COUNT(e.StudentID) AS EnrolledStudents
FROM Course c
LEFT JOIN Enrollment e ON c.CourseID = e.CourseID AND e.Semester = 'Fall 2023'
GROUP BY c.CourseID;

-- Display the average grade for courses in the 'Computer Science' department
SELECT c.CourseID, c.Title, AVG(CASE WHEN e.Grade != '' THEN CAST(e.Grade AS DECIMAL) ELSE NULL END) AS AverageGrade
FROM Course c
JOIN Department d ON c.DepartmentID = d.DepartmentID
LEFT JOIN Enrollment e ON c.CourseID = e.CourseID
WHERE d.Name = 'Computer Science'
GROUP BY c.CourseID;


-- Identify courses that are not being offered in 'Fall 2023'
SELECT CourseID, Title
FROM Course
WHERE CourseID NOT IN (
    SELECT CourseID
    FROM Enrollment
    WHERE Semester = 'Fall 2023'
)
GROUP BY CourseID;

-- Find students who have not enrolled in any courses for 'Fall 2023'
SELECT s.StudentID, s.FirstName, s.LastName
FROM Student s
WHERE NOT EXISTS (
    SELECT 1
    FROM Enrollment e
    WHERE e.StudentID = s.StudentID AND e.Semester = 'Fall 2023'
);

-- Determine which department offers the most courses
SELECT d.Name, COUNT(c.CourseID) AS NumberOfCourses
FROM Department d
JOIN Course c ON d.DepartmentID = c.DepartmentID
GROUP BY d.DepartmentID
ORDER BY NumberOfCourses DESC
LIMIT 1;

