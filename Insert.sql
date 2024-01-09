INSERT INTO dsci551.Course
(`number`, title, semester)
VALUES('DSCI 351', 'Data Science', 'Fall 2023');

INSERT INTO dsci551.Course
(`number`, title, semester)
VALUES('DSCI 551', 'Data Management', 'Spring 2023');

INSERT INTO dsci551.Course
(`number`, title, semester)
VALUES('DSCI 551', 'Data Management', 'Fall 2023'); 
-- if we made semester unique instead of a PK, would you still be able to add the same class in a different semester?

INSERT INTO dsci551.Course
(`number`, title, semester)
VALUES('DSCI 250', 'Data Analysis', 'Fall 2023');

INSERT INTO dsci551.Course
(`number`, title, semester)
VALUES('DSCI 250', 'Data Analysis', 'Spring 2023');

INSERT INTO dsci551.Course
(`number`, title, semester)
VALUES('DSCI 300', 'Data Stuff', 'Spring 2023');



INSERT INTO dsci551.Student
(id, name, program)
VALUES('s100', 'Sam', 'Applied Data Science');

INSERT INTO dsci551.Student
(id, name, program)
VALUES('s200', 'Abby', 'Business');

INSERT INTO dsci551.Student
(id, name, program)
VALUES('s300', 'John', 'Computer Science');

INSERT INTO dsci551.Student
(id, name, program)
VALUES('s400', 'Alice', 'Computer Science');



INSERT INTO dsci551.Instructor
(id, name, department)
VALUES('i100', 'Jack', 'Applied Data Science');

INSERT INTO dsci551.Instructor
(id, name, department)
VALUES('i200', 'Rob', 'Business');

INSERT INTO dsci551.Instructor
(id, name, department)
VALUES('i300', 'Rachel', 'Computer Science');



INSERT INTO dsci551.Take
(sid, cno, semester)
VALUES('s100', 'DSCI 351', 'Fall 2023');

INSERT INTO dsci551.Take
(sid, cno, semester)
VALUES('s100', 'DSCI 551', 'Fall 2023');

INSERT INTO dsci551.Take
(sid, cno, semester)
VALUES('s100', 'DSCI 250', 'Fall 2023');

INSERT INTO dsci551.Take
(sid, cno, semester)
VALUES('s200', 'DSCI 551', 'Spring 2023');

INSERT INTO dsci551.Take
(sid, cno, semester)
VALUES('s300', 'DSCI 250', 'Fall 2023');

INSERT INTO dsci551.Take
(sid, cno, semester)
VALUES('s400', 'DSCI 351', 'Fall 2023');



INSERT INTO dsci551.Teach
(rid, cno, semester)
VALUES('i100', 'DSCI 351', 'Fall 2023');

INSERT INTO dsci551.Teach
(rid, cno, semester)
VALUES('i200', 'DSCI 551', 'Spring 2023');

INSERT INTO dsci551.Teach
(rid, cno, semester)
VALUES('i300', 'DSCI 250', 'Fall 2023');

INSERT INTO dsci551.Teach
(rid, cno, semester)
VALUES('i300', 'DSCI 551', 'Fall 2023');

INSERT INTO dsci551.Teach
(rid, cno, semester)
VALUES('i300', 'DSCI 351', 'Fall 2023');



INSERT INTO dsci551.TA
(sid, hours)
VALUES('s100', 20);

INSERT INTO dsci551.TA
(sid, hours)
VALUES('s200', 25);

INSERT INTO dsci551.TA
(sid, hours)
VALUES('s300', 20);



INSERT INTO dsci551.Assist
(sid, cno, semester)
VALUES('s100', 'DSCI 551', 'Spring 2023');

INSERT INTO dsci551.Assist
(sid, cno, semester)
VALUES('s200', 'DSCI 250', 'Fall 2023');

INSERT INTO dsci551.Assist
(sid, cno, semester)
VALUES('s300', 'DSCI 351', 'Fall 2023');
