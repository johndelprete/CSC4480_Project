Drop table Courses cascade constraints;
Drop table Students cascade constraints;
Drop table Grade_List cascade constraints;
Drop table Grade_Nums cascade constraints;

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
    Student_Final_grade_1 Int Check(Student_Final_grade_1<=100),
    Student_Final_grade_2 Int Check(Student_Final_grade_2<=100),
    Student_Final_grade_3 Int Check(Student_Final_grade_3<=100),
    Student_Final_grade_4 Int Check(Student_Final_grade_4<=100),
    Student_Final_grade_5 Int Check(Student_Final_grade_5<=100),
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
    CRN_2 Varchar2(5),
    CRN_3 Varchar2(5),
    CRN_4 Varchar2(5),
    CRN_5 Varchar2(5),
    CRN_1_Grade Int Check(CRN_1_Grade<=100),
    CRN_2_Grade Int Check(CRN_2_Grade<=100),
    CRN_3_Grade Int Check(CRN_3_Grade<=100),
    CRN_4_Grade Int Check(CRN_4_Grade<=100),
    CRN_5_Grade Int Check(CRN_5_Grade<=100)
);

ALTER TABLE Courses ADD FOREIGN KEY (Student_ID_1) REFERENCES Students(Student_ID) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE Courses ADD FOREIGN KEY (Student_ID_2) REFERENCES Students(Student_ID) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE Courses ADD FOREIGN KEY (Student_ID_3) REFERENCES Students(Student_ID) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE Courses ADD FOREIGN KEY (Student_ID_4) REFERENCES Students(Student_ID) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE Courses ADD FOREIGN KEY (Student_ID_5) REFERENCES Students(Student_ID) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE Students ADD FOREIGN KEY (CRN_1) REFERENCES Courses(CRN) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE Students ADD FOREIGN KEY (CRN_2) REFERENCES Courses(CRN) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE Students ADD FOREIGN KEY (CRN_3) REFERENCES Courses(CRN) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE Students ADD FOREIGN KEY (CRN_4) REFERENCES Courses(CRN) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE Students ADD FOREIGN KEY (CRN_5) REFERENCES Courses(CRN) DEFERRABLE INITIALLY DEFERRED;

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
    Final_Grade Int Check(Final_Grade<=100)
);

Create table Grade_List(
    CRN Varchar2(5),
    FOREIGN KEY (CRN) REFERENCES Courses(CRN),
    Student_ID Varchar2(8),
    FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID),
    Grade_Name Varchar(24),
    Grade_Type Varchar(6),
    Grade_out_of_hund Int Check(Grade_out_of_hund<=100)
);


INSERT INTO Courses (CRN, Course_Name, What_year, Semester, Dept, Teacher_FN, Teacher_LN, Student_ID_1, Student_ID_2, Student_ID_3, Student_ID_4, Student_ID_5, Proj_Weight, Participation_Weight, Hw_Weight, Tests_Weight, Other_Weight) VALUES ('C0001', 'Intro to CS', 2026, 'Spring', 'Comp Sci', 'Alan', 'Turing', 'S0001', 'S0002', 'S0003', 'S0004', 'S0005', 20, 10, 20, 40, 10);
INSERT INTO Courses (CRN, Course_Name, What_year, Semester, Dept, Teacher_FN, Teacher_LN, Student_ID_1, Student_ID_2, Student_ID_3, Student_ID_4, Student_ID_5, Proj_Weight, Participation_Weight, Hw_Weight, Tests_Weight, Other_Weight) VALUES ('C0002', 'Database Systems', 2026, 'Spring', 'Comp Sci', 'Alan', 'Turing', 'S0001', 'S0003', 'S0005', NULL, NULL, 30, 10, 20, 30, 10);
INSERT INTO Courses (CRN, Course_Name, What_year, Semester, Dept, Teacher_FN, Teacher_LN, Student_ID_1, Student_ID_2, Student_ID_3, Student_ID_4, Student_ID_5, Proj_Weight, Participation_Weight, Hw_Weight, Tests_Weight, Other_Weight) VALUES ('C0003', 'Web Development', 2026, 'Spring', 'IT', 'Alan', 'Turing', 'S0002', 'S0004', 'S0005', NULL, NULL, 40, 10, 20, 20, 10);
INSERT INTO Courses (CRN, Course_Name, What_year, Semester, Dept, Teacher_FN, Teacher_LN, Student_ID_1, Student_ID_2, Student_ID_3, Student_ID_4, Student_ID_5, Proj_Weight, Participation_Weight, Hw_Weight, Tests_Weight, Other_Weight) VALUES ('C0004', 'Calculus I', 2026, 'Spring', 'Math', 'Alan', 'Turing', 'S0001', 'S0002', 'S0004', NULL, NULL, NULL, 5, 35, 60, NULL);
INSERT INTO Courses (CRN, Course_Name, What_year, Semester, Dept, Teacher_FN, Teacher_LN, Student_ID_1, Student_ID_2, Student_ID_3, Student_ID_4, Student_ID_5, Proj_Weight, Participation_Weight, Hw_Weight, Tests_Weight, Other_Weight) VALUES ('C0005', 'AI Ethics', 2026, 'Spring', 'Philosophy', 'Alan', 'Turing', 'S0003', 'S0004', 'S0005', NULL, NULL, 55, 20, NULL, NULL, 25);

INSERT INTO Students (Student_ID, Student_FN, Student_LN, CRN_1, CRN_2, CRN_3, CRN_4, CRN_5) VALUES ('S0001', 'Alice', 'Smith', 'C0001', 'C0002', 'C0003', NULL, NULL);
INSERT INTO Students (Student_ID, Student_FN, Student_LN, CRN_1, CRN_2, CRN_3, CRN_4, CRN_5) VALUES ('S0002', 'Bob', 'Johnson', 'C0001', 'C0003', 'C0004', NULL, NULL);
INSERT INTO Students (Student_ID, Student_FN, Student_LN, CRN_1, CRN_2, CRN_3, CRN_4, CRN_5) VALUES ('S0003', 'Charlie', 'Davis', 'C0001', 'C0002', 'C0005', NULL, NULL);
INSERT INTO Students (Student_ID, Student_FN, Student_LN, CRN_1, CRN_2, CRN_3, CRN_4, CRN_5) VALUES ('S0004', 'Diana', 'Prince', 'C0001', 'C0003', 'C0004', 'C0005', NULL);
INSERT INTO Students (Student_ID, Student_FN, Student_LN, CRN_1, CRN_2, CRN_3, CRN_4, CRN_5) VALUES ('S0005', 'Ethan', 'Hunt', 'C0001', 'C0002', 'C0003', 'C0005', NULL);

INSERT INTO Grade_Nums (CRN, Student_ID) VALUES ('C0001', 'S0001');
INSERT INTO Grade_Nums (CRN, Student_ID) VALUES ('C0001', 'S0002');
INSERT INTO Grade_Nums (CRN, Student_ID) VALUES ('C0001', 'S0003');
INSERT INTO Grade_Nums (CRN, Student_ID) VALUES ('C0001', 'S0004');
INSERT INTO Grade_Nums (CRN, Student_ID) VALUES ('C0001', 'S0005');
INSERT INTO Grade_Nums (CRN, Student_ID) VALUES ('C0002', 'S0001');
INSERT INTO Grade_Nums (CRN, Student_ID) VALUES ('C0002', 'S0003');
INSERT INTO Grade_Nums (CRN, Student_ID) VALUES ('C0002', 'S0005');
INSERT INTO Grade_Nums (CRN, Student_ID) VALUES ('C0003', 'S0002');
INSERT INTO Grade_Nums (CRN, Student_ID) VALUES ('C0003', 'S0004');
INSERT INTO Grade_Nums (CRN, Student_ID) VALUES ('C0003', 'S0005');
INSERT INTO Grade_Nums (CRN, Student_ID) VALUES ('C0004', 'S0001');
INSERT INTO Grade_Nums (CRN, Student_ID) VALUES ('C0004', 'S0002');
INSERT INTO Grade_Nums (CRN, Student_ID) VALUES ('C0004', 'S0004');
INSERT INTO Grade_Nums (CRN, Student_ID) VALUES ('C0005', 'S0003');
INSERT INTO Grade_Nums (CRN, Student_ID) VALUES ('C0005', 'S0004');
INSERT INTO Grade_Nums (CRN, Student_ID) VALUES ('C0005', 'S0005');

INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0001', 'Homework 1', 'hw', 95);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0001', 'Homework 2', 'hw', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0001', 'Homework 3', 'hw', 98);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0001', 'Homework 4', 'hw', 90);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0001', 'Project 1', 'proj', 94);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0001', 'Project 2', 'proj', 97);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0001', 'Midterm Exam', 'test', 91);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0001', 'Participation', 'Partic', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0001', 'Presentation', 'other', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0001', 'Final Exam', 'test', 84);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0002', 'Homework 1', 'hw', 90);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0002', 'Homework 2', 'hw', 88);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0002', 'Homework 3', 'hw', 95);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0002', 'Homework 4', 'hw', 75);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0002', 'Project 1', 'proj', 85);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0002', 'Project 2', 'proj', 90);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0002', 'Midterm Exam', 'test', 74);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0002', 'Participation', 'Partic', 92);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0002', 'Presentation', 'other', 97);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0002', 'Final Exam', 'test', 80);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0003', 'Homework 1', 'hw', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0003', 'Homework 2', 'hw', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0003', 'Homework 3', 'hw', 99);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0003', 'Homework 4', 'hw', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0003', 'Project 1', 'proj', 98);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0003', 'Project 2', 'proj', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0003', 'Midterm Exam', 'test', 99);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0003', 'Participation', 'Partic', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0003', 'Presentation', 'other', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0003', 'Final Exam', 'test', 95);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0004', 'Homework 1', 'hw', 93);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0004', 'Homework 2', 'hw', 94);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0004', 'Homework 3', 'hw', 85);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0004', 'Homework 4', 'hw', 80);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0004', 'Project 1', 'proj', 88);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0004', 'Project 2', 'proj', 83);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0004', 'Midterm Exam', 'test', 88);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0004', 'Participation', 'Partic', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0004', 'Presentation', 'other', 95);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0004', 'Final Exam', 'test', 90);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0005', 'Homework 1', 'hw', 93);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0005', 'Homework 2', 'hw', 97);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0005', 'Homework 3', 'hw', 90);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0005', 'Homework 4', 'hw', 86);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0005', 'Project 1', 'proj', 93);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0005', 'Project 2', 'proj', 95);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0005', 'Midterm Exam', 'test', 77);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0005', 'Participation', 'Partic', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0005', 'Presentation', 'other', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0001', 'S0005', 'Final Exam', 'test', 90);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0001', 'Homework 1', 'hw', 95);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0001', 'Homework 2', 'hw', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0001', 'Homework 3', 'hw', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0001', 'Homework 4', 'hw', 97);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0001', 'Homework 5', 'hw', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0001', 'Homework 6', 'hw', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0001', 'Project 1', 'proj', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0001', 'Participation', 'Partic', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0001', 'Presentation', 'other', 95);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0001', 'Midterm Exam', 'test', 97);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0001', 'Final Exam', 'test', 93);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0003', 'Homework 1', 'hw', 84);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0003', 'Homework 2', 'hw', 94);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0003', 'Homework 3', 'hw', 86);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0003', 'Homework 4', 'hw', 95);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0003', 'Homework 5', 'hw', 80);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0003', 'Homework 6', 'hw', 90);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0003', 'Project 1', 'proj', 85);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0003', 'Participation', 'Partic', 91);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0003', 'Presentation', 'other', 89);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0003', 'Midterm Exam', 'test', 98);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0003', 'Final Exam', 'test', 82);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0005', 'Homework 1', 'hw', 95);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0005', 'Homework 2', 'hw', 98);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0005', 'Homework 3', 'hw', 81);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0005', 'Homework 4', 'hw', 94);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0005', 'Homework 5', 'hw', 82);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0005', 'Homework 6', 'hw', 70);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0005', 'Project 1', 'proj', 87);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0005', 'Participation', 'Partic', 83);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0005', 'Presentation', 'other', 91);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0005', 'Midterm Exam', 'test', 84);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0002', 'S0005', 'Final Exam', 'test', 79);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0003', 'S0002', 'Homework 1', 'hw', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0003', 'S0002', 'Homework 2', 'hw', 94);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0003', 'S0002', 'Homework 3', 'hw', 90);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0003', 'S0002', 'Project 1', 'proj', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0003', 'S0002', 'Project 2', 'proj', 96);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0003', 'S0002', 'Project 3', 'proj', 98);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0003', 'S0002', 'Participation', 'Partic', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0003', 'S0002', 'Midterm Exam', 'test', 88);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0003', 'S0002', 'Final Presentation', 'other', 97);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0003', 'S0004', 'Homework 1', 'hw', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0003', 'S0004', 'Homework 2', 'hw', 96);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0003', 'S0004', 'Homework 3', 'hw', 90);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0003', 'S0004', 'Project 1', 'proj', 96);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0003', 'S0004', 'Project 2', 'proj', 83);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0003', 'S0004', 'Project 3', 'proj', 78);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0003', 'S0004', 'Participation', 'Partic', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0003', 'S0004', 'Midterm Exam', 'test', 84);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0003', 'S0004', 'Final Presentation', 'other', 95);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0003', 'S0005', 'Homework 1', 'hw', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0003', 'S0005', 'Homework 2', 'hw', 85);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0003', 'S0005', 'Homework 3', 'hw', 91);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0003', 'S0005', 'Project 1', 'proj', 96);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0003', 'S0005', 'Project 2', 'proj', 99);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0003', 'S0005', 'Project 3', 'proj', 85);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0003', 'S0005', 'Participation', 'Partic', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0003', 'S0005', 'Midterm Exam', 'test', 82);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0003', 'S0005', 'Final Presentation', 'other', 93);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0004', 'S0001', 'Homework 1', 'hw', 75);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0004', 'S0001', 'Homework 2', 'hw', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0004', 'S0001', 'Homework 3', 'hw', 95);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0004', 'S0001', 'Homework 4', 'hw', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0004', 'S0001', 'Homework 5', 'hw', 98);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0004', 'S0001', 'Homework 6', 'hw', 93);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0004', 'S0001', 'Homework 7', 'hw', 98);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0004', 'S0001', 'Participation', 'Partic', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0004', 'S0001', 'Midterm Exam', 'test', 95);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0004', 'S0001', 'Final Exam', 'test', 93);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0004', 'S0002', 'Homework 1', 'hw', 84);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0004', 'S0002', 'Homework 2', 'hw', 60);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0004', 'S0002', 'Homework 3', 'hw', 88);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0004', 'S0002', 'Homework 4', 'hw', 62);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0004', 'S0002', 'Homework 5', 'hw', 88);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0004', 'S0002', 'Homework 6', 'hw', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0004', 'S0002', 'Homework 7', 'hw', 0);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0004', 'S0002', 'Participation', 'Partic', 95);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0004', 'S0002', 'Midterm Exam', 'test', 78);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0004', 'S0002', 'Final Exam', 'test', 83);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0004', 'S0004', 'Homework 1', 'hw', 78);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0004', 'S0004', 'Homework 2', 'hw', 65);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0004', 'S0004', 'Homework 3', 'hw', 82);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0004', 'S0004', 'Homework 4', 'hw', 47);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0004', 'S0004', 'Homework 5', 'hw', 61);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0004', 'S0004', 'Homework 6', 'hw', 89);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0004', 'S0004', 'Homework 7', 'hw', 40);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0004', 'S0004', 'Participation', 'Partic', 90);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0004', 'S0004', 'Midterm Exam', 'test', 75);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0004', 'S0004', 'Final Exam', 'test', 73);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0005', 'S0003', 'Participation', 'Partic', 92);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0005', 'S0003', 'Presentation', 'other', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0005', 'S0003', 'Midterm Paper', 'proj', 88);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0005', 'S0003', 'Final Paper', 'proj', 93);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0005', 'S0004', 'Participation', 'Partic', 85);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0005', 'S0004', 'Presentation', 'other', 95);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0005', 'S0004', 'Midterm Paper', 'proj', 93);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0005', 'S0004', 'Final Paper', 'proj', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0005', 'S0005', 'Participation', 'Partic', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0005', 'S0005', 'Presentation', 'other', 100);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0005', 'S0005', 'Midterm Paper', 'proj', 88);
INSERT INTO Grade_List (CRN, Student_ID, Grade_Name, Grade_Type, Grade_out_of_hund) VALUES ('C0005', 'S0005', 'Final Paper', 'proj', 85);

COMMIT;
