-- with 1 table

-- Listing all 'Doçent' and 'Profesör' from User
SELECT FName, LName, Title
FROM [USER]
WHERE Title='Doçent' or Title='Profesör'

-- Listing comments that have 'Mutlu' word
SELECT DISTINCT Member_id, Post_id, C_text
FROM COMMENT
WHERE comment.C_text LIKE '%Mutlu%'

-- Listing companies that have 250 or more employee
SELECT Member_id, Name, No_of_employee
FROM COMPANY
WHERE No_of_employee > 250


-- with 2 table

-- Listing courses that have homework
SELECT DISTINCT Course_Name
FROM COURSE as c
WHERE EXISTS(SELECT Course_id
				FROM HOMEWORK as h
				WHERE h.Course_id = c.Course_id)

-- Listing users that member_id greater than 20 and course_id smaller than 5
SELECT Member_id, Course_id
FROM [USER], COURSE
WHERE User.Member_id > 20 and COURSE.Course_id < 5

-- Listing Students that student number starts with '05170' and their Language Level is 'Advanced'
SELECT DISTINCT FName, LName, BDate, Lan_level
FROM [USER], ACCOMPLISHMENT
WHERE [USER].Student_no LIKE '%05170%' AND Lan_level = 'Advanced'