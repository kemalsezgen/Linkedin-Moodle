CHECK Constraint

-- Language Level can be only 6 different level.
ALTER TABLE ACCOMPLISHMENT
ADD CONSTRAINT CHK_LanLevel
CHECK((Lan_level in ('Beginner', 'Elementary', 'Pre intermediate', 'Intermediate', 'Upper intermediate', 'Advanced')))

-- Experience Start Date should be smaller than Finish Date
ALTER TABLE ACCOMPLISHMENT
ADD CONSTRAINT CHK_Dates
CHECK (Exp_St_Date < Exp_Fin_Date)

-- Between StudentFlag and TeacherFlag at least one of them must be 1. 
ALTER TABLE [USER]
ADD CONSTRAINT CHK_StudentOrTeacher
CHECK (((StudentFlag <> 0) or (TeacherFlag <> 0)))

