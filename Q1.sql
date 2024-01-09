use dsci551;


-- a Find out which courses were offered in Spring 2023 but not in Fall 2023. Report course number and title.
select c.number, c.title from Course c where semester like 'Spring 2023' and c.number not in 
(select d.number from Course d where semester like 'Fall 2023');



-- b Find out titles of which courses in Fall 2023 contain “data” and are taught by Professor “John Smith”.
select c.title from Instructor i join Teach t on i.id = t.rid 
join Course c on c.number = t.cno and c.semester = t.semester
where c.semester = 'Fall 2023' and lower(c.title) like '%data%' and i.name = 'John Smith';



-- c Find out which students have taken both DSCI 351 and DSCI 250 (both are course numbers). 
-- Report student id and name.
select s.id, s.name from Student s join Take t on s.id = t.sid 
where t.cno = 'DSCI 351' and s.id in (select d.sid from Take d where d.cno = 'DSCI 250');



-- d Find out which students have taken DSCI 351 but not DSCI 250. Report student id and name.
select s.id, s.name from Student s join Take t on s.id = t.sid
where t.cno = 'DSCI 351' and s.id not in (select d.sid from Take d where d.cno = 'DSCI 250');



-- e Find out which students did not take any courses in Fall 2023.
select s.id, s.name from Student s join Take t on s.id = t.sid
where s.id not in (select d.sid from Take d where lower(d.semester) = 'fall 2023');



-- f Find out which instructors teach the largest number of courses in Fall 2023. Report instructor id and name.
with a as 
(select i.id, i.name, count(t.cno) cnt from Teach t 
join Instructor i on i.id = t.rid where lower(t.semester) = 'fall 2023' group by i.id) 
select id, name from a where cnt = (select max(cnt) from a);



-- g Find out which instructors teach only one course in Fall 2023 without using aggregate functions in SQL.
-- Report instructor names and course numbers.
select i.name, t.cno from Instructor i join Teach t on i.id = t.rid where lower(t.semester) = 'fall 2023' and
t.rid not in (select t1.rid from Teach t1 join Teach t2 on t1.rid = t2.rid where t1.cno <> t2.cno 
and lower(t1.semester) = 'fall 2023' and lower(t2.semester) = 'fall 2023');



-- h Find out for each instructor, the average number of students in his/her courses offered in Fall 2023. 
-- For example, if an instructor teaches two courses, course X with 100 students and course Y with 200 students,
-- then the average number of students in his/her course would be 150. Report the instructor id and the average number.
with a as 
(select ta.cno, count(ta.sid) cnt from Take ta group by ta.cno) 
select i.id, avg(a.cnt) avg from Instructor i 
join Teach t on i.id = t.rid join a on t.cno = a.cno group by i.id;



-- i Find out which courses offered in Fall 2023 have only one TA. Report the course titles.
with ta as 
(select a2.cno, count(a2.sid) cnt from Assist a2 where lower(a2.semester) = 'fall 2023' group by a2.cno) 
select c.title from Course c 
join ta on ta.cno = c.number 
where ta.cnt = 1 and lower(c.semester) = 'fall 2023';



-- j Find out which TAs work for more than 15 hours a week and take 3 courses in Fall 2023. Report names of such TAs.
with a as 
(select t1.sid, count(t1.cno) cnt from Take t1 where lower(t1.semester) = 'fall 2023' group by t1.sid)
select s.name from TA t 
left join a on a.sid = t.sid 
left join Student s on t.sid = s.id
where t.hours > 15
and a.cnt = 3;




