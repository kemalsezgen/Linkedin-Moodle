CREATE TABLE [USER]
(
Member_id INT,
Email VARCHAR(50) NOT NULL,
[Password] VARCHAR(50) NOT NULL,
FName VARCHAR(50) NOT NULL,
LName VARCHAR(50) NOT NULL,
Phone VARCHAR(50) NOT NULL,
BDate VARCHAR(50) NOT NULL,
StudentFlag BINARY NOT NULL,
Student_no VARCHAR(50),
TeacherFlag BINARY NOT NULL,
Title VARCHAR(50),
PRIMARY KEY(Member_id)
);

CREATE TABLE UNIVERSITY
(
Member_id INT,
Email VARCHAR(50) NOT NULL,
[Password] VARCHAR(50) NOT NULL,
[Name] VARCHAR(50) NOT NULL,
Website VARCHAR(50) NOT NULL,
No_of_employee VARCHAR(50) NOT NULL,
Mgr_ID INT NOT NULL REFERENCES [USER](Member_id),
PRIMARY KEY(Member_id),
);

CREATE TABLE COMPANY
(
Member_id INT,
Email VARCHAR(50) NOT NULL,
[Password] VARCHAR(50) NOT NULL,
[Name] VARCHAR(50) NOT NULL,
Website VARCHAR(50) NOT NULL,
No_of_employee VARCHAR(50) NOT NULL,
PRIMARY KEY(Member_id),
);

CREATE TABLE FACULTY
(
F_id INT,
F_name VARCHAR(50) NOT NULL,
Dean_ID INT NOT NULL REFERENCES [USER](Member_id),
Dean_StartDate DATE NOT NULL,
University_id INT NOT NULL REFERENCES [USER](Member_id),
PRIMARY KEY(F_id),
);

CREATE TABLE DEPARTMENT
(
Dep_id INT,
Dep_name VARCHAR(50) NOT NULL,
Chair_ID INT NOT NULL REFERENCES [USER](Member_id),
Chair_StartDate DATE NOT NULL,
Faculty_id INT NOT NULL REFERENCES [USER](Member_id),
PRIMARY KEY(Dep_id),
);

CREATE TABLE POST
(
Post_id INT,
Post_date DATE NOT NULL,
Post_text VARCHAR(255) NOT NULL,
creator_memberID INT NOT NULL REFERENCES [USER](Member_id),
PRIMARY KEY(Post_id),
);

CREATE TABLE COMMENT
(
Member_id INT,
Post_id INT, 
C_date DATE NOT NULL,
C_text VARCHAR(255) NOT NULL,
PRIMARY KEY(Member_id, Post_id),
FOREIGN KEY(Post_id) REFERENCES POST(Post_id)
);

CREATE TABLE SHARE
(
Member_id INT,
Post_id INT, 
S_date DATE NOT NULL,
PRIMARY KEY(Member_id, Post_id),
FOREIGN KEY(Post_id) REFERENCES POST(Post_id),
FOREIGN KEY(Member_id) REFERENCES [USER](Member_id)
);

CREATE TABLE [LIKE]
(
Member_id INT,
Post_id INT, 
PRIMARY KEY(Member_id, Post_id),
FOREIGN KEY(Post_id) REFERENCES POST(Post_id),
FOREIGN KEY(Member_id) REFERENCES [USER](Member_id)
);

CREATE TABLE FOLLOW
(
User_memberID INT,
Organization_memberID INT,
PRIMARY KEY(User_memberID, Organization_memberID),
FOREIGN KEY(User_memberID) REFERENCES [USER](Member_id),
FOREIGN KEY(Organization_memberID) REFERENCES [USER](Member_id)
);

CREATE TABLE [CONNECT]
(
Member_id1 INT,
Member_id2 INT,
PRIMARY KEY(Member_id1, Member_id2),
FOREIGN KEY(Member_id1) REFERENCES [USER](Member_id),
FOREIGN KEY(Member_id2) REFERENCES [USER](Member_id)
);

CREATE TABLE [MESSAGE]
(
SenderID INT,
ReceiverID INT,
Msg_date DATE NOT NULL,
Msg_text VARCHAR(255) NOT NULL,
PRIMARY KEY(SenderID, ReceiverID),
FOREIGN KEY(SenderID) REFERENCES [USER](Member_id),
FOREIGN KEY(ReceiverID) REFERENCES [USER](Member_id)
);

CREATE TABLE [GROUP]
(
GroupID INT,
[Name] VARCHAR(80) NOT NULL,
No_of_members INT NOT NULL,
PRIMARY KEY(GroupID)
);

CREATE TABLE [JOIN]
(
Member_id INT,
GroupID INT,
PRIMARY KEY(Member_id, GroupID),
FOREIGN KEY(Member_id) REFERENCES [USER](Member_id),
FOREIGN KEY(GroupID) REFERENCES [GROUP](GroupID)
);

CREATE TABLE JOB_POST
(
Jp_id INT,
Publisher_member_id INT NOT NULL,
Jp_title VARCHAR(80) NOT NULL,
PRIMARY KEY(Jp_id),
FOREIGN KEY(Publisher_member_id) REFERENCES [USER](Member_id),
);

CREATE TABLE [APPLY] 
(
Jp_id INT,
Publisher_member_id INT,
Applier_member_id INT,
PRIMARY KEY(Jp_id, Publisher_member_id, Applier_member_id),
FOREIGN KEY(Jp_id) REFERENCES JOB_POST(Jp_id),
FOREIGN KEY(Publisher_member_id) REFERENCES [USER](Member_id),
FOREIGN KEY(Applier_member_id) REFERENCES [USER](Member_id)
);

CREATE TABLE ACCOMPLISHMENT 
(
Acc_id INT,
Member_id INT NOT NULL REFERENCES [USER](Member_id),
CertFlag BINARY NOT NULL,
Cer_Name VARCHAR(80),
Cer_Description VARCHAR(255),
ExpFlag BINARY NOT NULL,
Exp_St_date DATE,
Exp_Fin_Date DATE,
Exp_Comp_name VARCHAR(80),
EduFlag BINARY NOT NULL,
Edu_Level VARCHAR(50),
LanFlag BINARY NOT NULL,
L_name VARCHAR(50),
Lan_level VARCHAR(50),
PRIMARY KEY(Acc_id)
);

CREATE TABLE COURSE 
(
Course_id INT,
Course_Name VARCHAR(80),
Dep_id INT NOT NULL,
Teacher_ID INT NOT NULL,
PRIMARY KEY(Course_id),
FOREIGN KEY(Dep_id) REFERENCES DEPARTMENT(Dep_id),
FOREIGN KEY(Teacher_ID) REFERENCES [USER](Member_id),
);

CREATE TABLE HOMEWORK 
(
Hw_id INT,
Hw_Name VARCHAR(80),
Course_id INT NOT NULL,
PRIMARY KEY(Hw_id),
FOREIGN KEY(Course_id) REFERENCES COURSE(Course_id)
);

CREATE TABLE WORKS_ON 
(
Hw_id INT,
Member_id INT,
PRIMARY KEY(Hw_id, Member_id),
FOREIGN KEY(Hw_id) REFERENCES HOMEWORK(Hw_id),
FOREIGN KEY(Member_id) REFERENCES [USER](Member_id),
);

CREATE TABLE ENROLL 
(
Course_id INT,
Member_id INT,
PRIMARY KEY(Course_id, Member_id),
FOREIGN KEY(Course_id) REFERENCES COURSE(Course_id),
FOREIGN KEY(Member_id) REFERENCES [USER](Member_id),
);