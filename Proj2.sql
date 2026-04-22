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


INSERT INTO Courses (CRN, Course_Name, What_year, Semester, Dept, Teacher_FN, Teacher_LN, Student_ID_1, Student_ID_2, Student_ID_3, Student_ID_4, Student_ID_5, Proj_Weight, Participation_Weight, Hw_Weight, Tests_Weight, Other_Weight) VALUES
('C0001', 'Intro to CS', 2026, 'Spring', 'Comp Sci', 'Alan', 'Turing', 'S0001', 'S0002', 'S0003', 'S0004', 'S0005', 20, 10, 20, 40, 10),
('C0002', 'Database Systems', 2026, 'Spring', 'Comp Sci', 'Alan', 'Turing', 'S0001', 'S0003', 'S0005', NULL, NULL, 30, 10, 20, 30, 10),
('C0003', 'Web Development', 2026, 'Spring', 'IT', 'Alan', 'Turing', 'S0002', 'S0004', 'S0005', NULL, NULL, 40, 10, 20, 20, 10),
('C0004', 'Calculus I', 2026, 'Spring', 'Math', 'Alan', 'Turing', 'S0001', 'S0002', 'S0004', NULL, NULL, 10, 10, 30, 40, 10),
('C0005', 'AI Ethics', 2026, 'Spring', 'Philosophy', 'Alan', 'Turing', 'S0003', 'S0004', 'S0005', NULL, NULL, 30, 20, 20, 20, 10);

INSERT INTO Students (Student_ID, Student_FN, Student_LN, CRN_1, CRN_2, CRN_3, CRN_4, CRN_5) VALUES
('S0001', 'Alice', 'Smith', 'C0001', 'C0002', 'C0003', NULL, NULL),
('S0002', 'Bob', 'Johnson', 'C0001', 'C0003', 'C0004', NULL, NULL),
('S0003', 'Charlie', 'Davis', 'C0001', 'C0002', 'C0005', NULL, NULL),
('S0004', 'Diana', 'Prince', 'C0001', 'C0003', 'C0004', 'C0005', NULL),
('S0005', 'Ethan', 'Hunt', 'C0001', 'C0002', 'C0003', 'C0005', NULL);

INSERT INTO Grade_Nums (CRN, Student_ID) VALUES
('C0001', 'S0001'),
('C0001', 'S0002'),
('C0001', 'S0003'),
('C0001', 'S0004'),
('C0001', 'S0005'),
('C0002', 'S0001'),
('C0002', 'S0003'),
('C0002', 'S0005'),
('C0003', 'S0002'),
('C0003', 'S0004'),
('C0003', 'S0005'),
('C0004', 'S0001'),
('C0004', 'S0002'),
('C0004', 'S0004'),
('C0005', 'S0003'),
('C0005', 'S0004'),
('C0005', 'S0005');


INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES
('C0001', 'S0001', 'Homework 1', 'hw', 95),
('C0001', 'S0001', 'Homework 2', 'hw', 100),
('C0001', 'S0001', 'Homework 3', 'hw', 98),
('C0001', 'S0001', 'Homework 4', 'hw', 90),
('C0001', 'S0001', 'Project 1', 'proj', 94),
('C0001', 'S0001', 'Project 2', 'proj', 97),
('C0001', 'S0001', 'Midterm Exam', 'test', 91),
('C0001', 'S0001', 'Participation', 'partic', 100),
('C0001', 'S0001', 'Presentation', 'other', 100),
('C0001', 'S0001', 'Final Exam', 'test', 84),
('C0001', 'S0002', 'Homework 1', 'hw', 90),
('C0001', 'S0002', 'Homework 2', 'hw', 88),
('C0001', 'S0002', 'Homework 3', 'hw', 95),
('C0001', 'S0002', 'Homework 4', 'hw', 75),
('C0001', 'S0002', 'Project 1', 'proj', 85),
('C0001', 'S0002', 'Project 2', 'proj', 90),
('C0001', 'S0002', 'Midterm Exam', 'test', 77),
('C0001', 'S0002', 'Participation', 'partic', 92),
('C0001', 'S0002', 'Presentation', 'other', 97),
('C0001', 'S0002', 'Final Exam', 'test', 80),
('C0001', 'S0003', 'Homework 1', 'hw', 100),
('C0001', 'S0003', 'Homework 2', 'hw', 100),
('C0001', 'S0003', 'Homework 3', 'hw', 99),
('C0001', 'S0003', 'Homework 4', 'hw', 100),
('C0001', 'S0003', 'Project 1', 'proj', 94),
('C0001', 'S0003', 'Project 2', 'proj', 97),
('C0001', 'S0003', 'Midterm Exam', 'test', 91),
('C0001', 'S0003', 'Participation', 'partic', 100),
('C0001', 'S0003', 'Presentation', 'other', 100),
('C0001', 'S0003', 'Test 1', 'test', 84),

('C0005', 'S0004', 'Discussion 1', 'partic', 100),
('C0006', 'S0007', 'Lab 1', 'other', 90),
('C0007', 'S0010', 'Homework 2', 'hw', 78),
('C0008', 'S0006', 'Unit Test', 'test', 85),
('C0009', 'S0003', 'Final Project', 'proj', 94),
('C0010', 'S0008', 'Homework 1', 'hw', 82);

Update Grade_Nums Set hw_avg=avg(Grade_out_of_hund) where student_id =S0001 and CRN=C0001 and Grade_type='hw';
Update Grade_Nums Set Proj_avg=avg(Grade_out_of_hund) where student_id =S0001 and CRN=C0001 and Grade_type='Proj';
Update Grade_Nums Set Test_avg=avg(Grade_out_of_hund) where student_id =S0001 and CRN=C0001 and Grade_type='Test';
Update Grade_Nums Set Partic_avg=avg(Grade_out_of_hund) where student_id =S0001 and CRN=C0001 and Grade_type='Partic';
Update Grade_Nums Set other_avg=avg(Grade_out_of_hund) where student_id =S0001 and CRN=C0001 and Grade_type='other';
Update Grade_Nums Set Final_grade=((hw_avg + Proj_avg + Test_avg + Partic_avg + other_avg)/100);

Update Students Set CRN_1_Grade=Final_grade where Student_ID=S0001 and CRN=C0001; 
Update Courses Set Student_Final_grade_1=Final_grade where Student_ID=S0001 and CRN=C0001;
