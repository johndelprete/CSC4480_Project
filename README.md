# CSC4480_Project
A student gradebook that keeps track of up to five student's grades for five different classes taught by the same teacher.

# How to Use
Download the repository and open it up as a folder in something like VS Code. You may have to install the oracledb module, which you can do via `python -m pip install oracledb --upgrade`.
After successfully downloading the module, run the program in terminal by doing `python python_code.py`. After running this, you will be prompted to enter credentials which are provided in the comments throughout the code or putting the sql into your own database which you can log into. 

Student ID numbers range from S0001-S0005.
CRN ranges from C0001-C0005.

You may want to copy the `Proj2.sql` code into your own oracledb and run it so that you can access the database on your own and see the changes that are made in the tables when you run certain commands.

If you access an existing database (or your own) that has already run the python script and added students to classes and grades to students, then those changes will remain in that database. If you want to reset them to what they originally were, take the SQL code (Proj2.sql), paste it into CSDB2 in Orcale and rerun it. This will reset the values to their fresh states.

# Features
There are options to view the gradebook as a student or a teacher. If you enter as a student, you can view grades for a course you are already enrolled in, join an existing class, or view which classes you are in. 
If you enter as a teacher, you can view a student's grade, add a new assignment grade for a student,update the grade of an already existing assignment, or view who is in a class.
