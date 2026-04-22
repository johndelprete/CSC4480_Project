Drop table courses;
Drop table Students;
Drop table Grades;

Create table Courses(
    CRN Varchar2(5) Primary Key,
    Course_Name Varchar2(24),
    What_year int,
    Semester Varchar2(6),
    Dept Varchar2(16),
    Teacher_FN Varchar2(16),
    Teacher_LN Varchar2(16),
    Student_ID_1 Varchar2(8),
    Student_ID_2 Varchar2(8),
    Student_ID_3 Varchar2(8),
    Student_ID_4 Varchar2(8),
    Student_ID_5 Varchar2(8),
    Proj_Weight int,
    Participation_Weight int,
    Hw_Weight int,
    Tests_Weight int,
    Other_Weight int,
    Final_Grade int
);
Create table Students(
    Student_ID Varchar2(8),
    Student_FN Varchar2(16),
    Student_LN Varchar2(16),
    CRN_1 Varchar2(5),
    CRN_2 Varchar2(5),
    CRN_3 Varchar2(5),
    CRN_4 Varchar2(5),
    CRN_5 Varchar2(5),
    CRN_1_Grade int,
    CRN_2_Grade int,
    CRN_3_Grade int,
    CRN_4_Grade int,
    CRN_5_Grade int,
    Final_Grade int
);
Create table Grades(
    CRN Varchar2(5) Primary Key,
    Student_ID Varchar2(8),
    Proj_Avg int,
    Participation_Avg int,
    Hw_Avg int,
    Tests_Avg int,
    Other_Avg int,
    Final_Grade int
);


INSERT INTO courses (CRN, Course_Name, What_year, Semester, Dept, Teacher_FN, Teacher_LN, Student_ID_1, Student_ID_2, Student_ID_3, Student_ID_4, Student_ID_5, Proj_Weight, Participation_Weight, Hw_Weight, Tests_Weight, Other_Weight, Final_Grade) VALUES
('C0001', 'Intro to CS', 2026, 'Spring', 'Comp Sci', 'Alan', 'Turing', 'S0001', 'S0002', 'S0005', 'S0007', NULL, 20, 10, 20, 40, 10, 85),
('C0002', 'Data Structures', 2026, 'Spring', 'Comp Sci', 'Grace', 'Hopper', 'S0002', 'S0005', 'S0008', NULL, NULL, 25, 15, 20, 30, 10, 88),
('C0003', 'Database Systems', 2026, 'Spring', 'Comp Sci', 'Edgar', 'Codd', 'S0003', 'S0005', 'S0009', NULL, NULL, 30, 10, 20, 30, 10, 92),
('C0004', 'Discrete Math', 2026, 'Spring', 'Math', 'Ada', 'Lovelace', 'S0004', 'S0005', 'S0010', NULL, NULL, 10, 10, 30, 40, 10, 84),
('C0005', 'Operating Systems', 2026, 'Summer', 'Comp Sci', 'Linus', 'Torvalds', 'S0001', 'S0005', 'S0009', NULL, NULL, 20, 10, 20, 40, 10, 89),
('C0006', 'Algorithms', 2026, 'Summer', 'Comp Sci', 'Donald', 'Knuth', 'S0002', 'S0006', 'S0007', NULL, NULL, 20, 10, 20, 40, 10, 91),
('C0007', 'Software Eng', 2026, 'Summer', 'Comp Sci', 'Margaret', 'Hamilton', 'S0003', 'S0006', 'S0008', NULL, NULL, 40, 20, 10, 20, 10, 95),
('C0008', 'Cybersecurity', 2026, 'Fall', 'Comp Sci', 'Dorothy', 'Denning', 'S0001', 'S0004', 'S0006', NULL, NULL, 20, 10, 20, 40, 10, 87),
('C0009', 'Linear Algebra', 2026, 'Fall', 'Math', 'Gilbert', 'Strang', 'S0002', 'S0006', 'S0010', NULL, NULL, 15, 10, 25, 40, 10, 82),
('C0010', 'AI Ethics', 2026, 'Fall', 'Philosophy', 'Timnit', 'Gebru', 'S0003', 'S0006', 'S0009', NULL, NULL, 30, 20, 20, 20, 10, 94);

INSERT INTO Students (Student_ID, Student_FN, Student_LN, CRN_1, CRN_2, CRN_3, CRN_4, CRN_5, CRN_1_Grade, CRN_2_Grade, CRN_3_Grade, CRN_4_Grade, CRN_5_Grade, Final_Grade) VALUES
('S0001', 'Alice', 'Smith', 'C0001', 'C0005', 'C0008', NULL, NULL, 85, 89, 87, NULL, NULL, 87),
('S0002', 'Bob', 'Johnson', 'C0001', 'C0002', 'C0006', 'C0009', NULL, 85, 88, 91, 82, NULL, 86),
('S0003', 'Charlie', 'Davis', 'C0003', 'C0007', 'C0010', NULL, NULL, 92, 95, 94, NULL, NULL, 93),
('S0004', 'Diana', 'Prince', 'C0004', 'C0008', NULL, NULL, NULL, 84, 87, NULL, NULL, NULL, 85),
('S0005', 'Ethan', 'Hunt', 'C0001', 'C0002', 'C0003', 'C0004', 'C0005', 85, 88, 92, 84, 89, 87),
('S0006', 'Fiona', 'Gallagher', 'C0006', 'C0007', 'C0008', 'C0009', 'C0010', 91, 95, 87, 82, 94, 89),
('S0007', 'George', 'Miller', 'C0001', 'C0006', NULL, NULL, NULL, 85, 91, NULL, NULL, NULL, 88),
('S0008', 'Hannah', 'Abbott', 'C0002', 'C0007', NULL, NULL, NULL, 88, 95, NULL, NULL, NULL, 91),
('S0009', 'Ian', 'Wright', 'C0003', 'C0005', 'C0010', NULL, NULL, 92, 89, 94, NULL, NULL, 91),
('S0010', 'Jenny', 'Kim', 'C0004', 'C0009', NULL, NULL, NULL, 84, 82, NULL, NULL, NULL, 83);

INSERT INTO Grades (CRN, Student_ID, Proj_Avg, Participation_Avg, Hw_Avg, Tests_Avg, Other_Avg, Final_Grade) VALUES
('C0001', 'S0001', 80, 90, 85, 82, 90, 84),
('C0002', 'S0005', 85, 95, 80, 88, 92, 87),
('C0003', 'S0003', 90, 85, 92, 94, 88, 91),
('C0004', 'S0004', 75, 80, 85, 82, 80, 81),
('C0005', 'S0009', 88, 90, 85, 86, 90, 87),
('C0006', 'S0006', 92, 95, 88, 90, 94, 91),
('C0007', 'S0008', 95, 100, 90, 92, 98, 94),
('C0008', 'S0001', 82, 85, 80, 88, 85, 84),
('C0009', 'S0010', 80, 82, 78, 85, 80, 82),
('C0010', 'S0003', 94, 98, 92, 95, 96, 95);