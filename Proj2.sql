Drop table courses;
Drop table Students;
Drop table Grade_List;
Drop table Grade_Nums;

Create table Courses(
    CRN Varchar2(5) Primary Key,
    Course_Name Varchar2(24),
    What_year int,
    Semester Varchar2(6),
    Dept Varchar2(16),
    Teacher_FN Varchar2(16),
    Teacher_LN Varchar2(16),
    Student_ID_1 Varchar2(8),
    FOREIGN KEY (Student_ID_1) REFERENCES Students(Student_ID),
    Student_ID_2 Varchar2(8),
    FOREIGN KEY (Student_ID_2) REFERENCES Students(Student_ID),
    Student_ID_3 Varchar2(8),
    FOREIGN KEY (Student_ID_3) REFERENCES Students(Student_ID),
    Student_ID_4 Varchar2(8),
    FOREIGN KEY (Student_ID_4) REFERENCES Students(Student_ID),
    Student_ID_5 Varchar2(8),
    FOREIGN KEY (Student_ID_5) REFERENCES Students(Student_ID),
    Student_Final_grade_1 Int Check(Grade_out_of_hund<100),
    Student_Final_grade_2 Int Check(Grade_out_of_hund<100),
    Student_Final_grade_3 Int Check(Grade_out_of_hund<100),
    Student_Final_grade_4 Int Check(Grade_out_of_hund<100),
    Student_Final_grade_5 Int Check(Grade_out_of_hund<100),
    Proj_Weight int,
    Participation_Weight int,
    Hw_Weight int,
    Tests_Weight int,
    Other_Weight int
);
Create table Students(
    Student_ID Varchar2(8) Primary Key,
    Student_FN Varchar2(16),
    Student_LN Varchar2(16),
    CRN_1 Varchar2(5),
    FOREIGN KEY (CRN1) REFERENCES Courses(CRN),
    CRN_2 Varchar2(5),
    FOREIGN KEY (CRN2) REFERENCES Courses(CRN),
    CRN_3 Varchar2(5),
    FOREIGN KEY (CRN3) REFERENCES Courses(CRN),
    CRN_4 Varchar2(5),
    FOREIGN KEY (CRN4) REFERENCES Courses(CRN),
    CRN_5 Varchar2(5),
    FOREIGN KEY (CRN5) REFERENCES Courses(CRN),
    CRN_1_Grade Int Check(Grade_out_of_hund<100),
    CRN_2_Grade Int Check(Grade_out_of_hund<100),
    CRN_3_Grade Int Check(Grade_out_of_hund<100),
    CRN_4_Grade Int Check(Grade_out_of_hund<100),
    CRN_5_Grade Int Check(Grade_out_of_hund<100)
);

Create Table Grade_Nums(
    CRN Varchar2(5),
    FOREIGN KEY (CRN) REFERENCES Courses(CRN),
    Student_ID Varchar2(8),
    FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID),
    Proj_Avg int,
    Participation_Avg int,
    Hw_Avg int,
    Tests_Avg int,
    Other_Avg int,
    Final_Grade Int Check(Grade_out_of_hund<100)
);

Create table Grade_List(
    CRN Varchar2(5),
    FOREIGN KEY (CRN) REFERENCES Courses(CRN),
    Student_ID Varchar2(8),
    FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID),
    Grade_Name Varchar(24),
    Grade_Type Varchar(6),--hw,test,partic,proj,other
    Grade_out_of_hund Int Check(Grade_out_of_hund<100)
);


Update Grade_Nums Set hw_avg=avg(Grade_out_of_hund) where student_id =S0001 and CRN=C0001 and Grade_type=hw);
Update Grade_Nums Set Proj_avg=avg(Grade_out_of_hund) where student_id =S0001 and CRN=C0001 and Grade_type=Proj);
Update Grade_Nums Set Test_avg=avg(Grade_out_of_hund) where student_id =S0001 and CRN=C0001 and Grade_type=Test);
Update Grade_Nums Set Partic_avg=avg(Grade_out_of_hund) where student_id =S0001 and CRN=C0001 and Grade_type=Partic);
Update Grade_Nums Set other_avg=avg(Grade_out_of_hund) where student_id =S0001 and CRN=C0001 and Grade_type=other);
Update Grade_Nums Set Final_grade=((hw_avg + Proj_avg + Test_avg + Partic_avg + other_avg)/100);



INSERT INTO Courses (CRN, Course_Name, What_year, Semester, Dept, Teacher_FN, Teacher_LN, Student_ID_1, Student_ID_2, Student_ID_3, Student_ID_4, Student_ID_5, Proj_Weight, Participation_Weight, Hw_Weight, Tests_Weight, Other_Weight) VALUES
('C0001', 'Intro to CS', 2026, 'Spring', 'Comp Sci', 'Alan', 'Turing', 'S0001', 'S0002', 'S0003', 'S0004', 'S0005', 20, 10, 20, 40, 10),
('C0002', 'Database Systems', 2026, 'Spring', 'Comp Sci', 'Edgar', 'Codd', 'S0001', 'S0003', 'S0005', 'S0007', 'S0009', 30, 10, 20, 30, 10),
('C0003', 'Web Development', 2026, 'Spring', 'IT', 'Tim', 'Berners', 'S0002', 'S0004', 'S0006', 'S0008', 'S0010', 40, 10, 20, 20, 10),
('C0004', 'Calculus I', 2026, 'Summer', 'Math', 'Isaac', 'Newton', 'S0001', 'S0002', 'S0003', NULL, NULL, 10, 10, 30, 40, 10),
('C0005', 'AI Ethics', 2026, 'Summer', 'Philosophy', 'Timnit', 'Gebru', 'S0004', 'S0005', 'S0006', NULL, NULL, 30, 20, 20, 20, 10),
('C0006', 'Algorithms', 2026, 'Summer', 'Comp Sci', 'Donald', 'Knuth', 'S0007', 'S0008', 'S0009', NULL, NULL, 20, 10, 20, 40, 10),
('C0007', 'Operating Systems', 2026, 'Fall', 'Comp Sci', 'Linus', 'Torvalds', 'S0001', 'S0005', 'S0010', NULL, NULL, 20, 10, 20, 40, 10),
('C0008', 'Cybersecurity', 2026, 'Fall', 'Comp Sci', 'Dorothy', 'Denning', 'S0002', 'S0006', 'S0009', NULL, NULL, 25, 10, 20, 35, 10),
('C0009', 'Networking', 2026, 'Fall', 'IT', 'Vint', 'Cerf', 'S0003', 'S0007', 'S0010', NULL, NULL, 20, 20, 20, 20, 20),
('C0010', 'Discrete Math', 2026, 'Fall', 'Math', 'Ada', 'Lovelace', 'S0004', 'S0008', 'S0001', NULL, NULL, 15, 10, 25, 40, 10);

INSERT INTO Students (Student_ID, Student_FN, Student_LN, CRN_1, CRN_2, CRN_3, CRN_4, CRN_5) VALUES
('S0001', 'Alice', 'Smith', 'C0001', 'C0002', 'C0004', 'C0007', 'C0010'),
('S0002', 'Bob', 'Johnson', 'C0001', 'C0003', 'C0004', 'C0008', NULL),
('S0003', 'Charlie', 'Davis', 'C0001', 'C0002', 'C0004', 'C0009', NULL),
('S0004', 'Diana', 'Prince', 'C0001', 'C0003', 'C0005', 'C0010', NULL),
('S0005', 'Ethan', 'Hunt', 'C0001', 'C0002', 'C0005', 'C0007', NULL),
('S0006', 'Fiona', 'Gallagher', 'C0003', 'C0005', 'C0008', NULL, NULL),
('S0007', 'George', 'Miller', 'C0002', 'C0006', 'C0009', NULL, NULL),
('S0008', 'Hannah', 'Abbott', 'C0003', 'C0006', 'C0010', NULL, NULL),
('S0009', 'Ian', 'Wright', 'C0002', 'C0006', 'C0008', NULL, NULL),
('S0010', 'Jenny', 'Kim', 'C0003', 'C0007', 'C0009', NULL, NULL);

INSERT INTO Grade_Nums (CRN, Student_ID) VALUES
('C0001', 'S0001'),
('C0002', 'S0003'),
('C0003', 'S0002'),
('C0004', 'S0001'),
('C0005', 'S0004'),
('C0006', 'S0007'),
('C0007', 'S0010'),
('C0008', 'S0006'),
('C0009', 'S0003'),
('C0010', 'S0008');

INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES
('C0001', 'S0001', 'Homework 1', 'hw', 95),
('C0002', 'S0003', 'Midterm Exam', 'test', 88),
('C0003', 'S0002', 'Project Alpha', 'proj', 92),
('C0004', 'S0001', 'Quiz 1', 'test', 84),
('C0005', 'S0004', 'Discussion 1', 'partic', 100),
('C0006', 'S0007', 'Lab 1', 'other', 90),
('C0007', 'S0010', 'Homework 2', 'hw', 78),
('C0008', 'S0006', 'Unit Test', 'test', 85),
('C0009', 'S0003', 'Final Project', 'proj', 94),
('C0010', 'S0008', 'Homework 1', 'hw', 82);
