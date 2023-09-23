create database accenture;
Select teacher_id, Count(*) from teacher_allocation group by teacher_id;
select class_id, count(student_name) as no_of_johns
from student_acc
where student_name like "%John%" 
group by class_id;
select*from student_acc;
select* from teacher;

set @rowindex := 0;
select student_id ,student_name, @rowindex := @rowindex + 1 as roll
from student_acc
order by student_name asc;
SELECT class_id, sum(IF(gender = "M", 1, 0))/ sum(IF(gender="F",1,0)) as BoysVsGirls 
FROM Student_acc
Group By Class_ID;
Select avg(year(curdate()) -year(str_to_date(date_of_joining,"%Y-%m-%d")))
From teacher;
 select * from exam_paper;
 select * from exam;
  SELECT student_name, exam_name, exam_subject, marks, marks/total_marks as MarksVsTotalMarks
FROM student_acc st, exam_paper ept, exam et
WHERE st.student_id = ept.student_id and ept.exam_id = et.exam_id
order by 1, 2, 3;
SELECT st.student_id, et.exam_id, 
left((marks/total_marks)*100,4) as performance ,marks
FROM student_acc st, exam_paper ept, exam et
WHERE st.student_id = ept.student_id and
ept.exam_id = et.exam_id 
and st.student_id IN (1,4,9,16,25) and exam_name = "Quarterly"
order by 1, 2, 3;
select* from class;
 SELECT ct.class_id, st.student_id, et.exam_name,
dense_rank() over (partition by ct.class_id order by sum(marks) DESC) as DRank  
FROM student_acc st, exam_paper ept, exam et, class ct
WHERE ct.class_id = st.class_id and st.student_id = ept.student_id and ept.exam_id = et.exam_id and exam_name = "Half yearly"
Group By ct.class_id, st.student_id ,et.exam_name
order by 1, 4 DESC;