create database Student;

use student

select * from Student

SELECT 
    c.class_teacher_id,
    COUNT(DISTINCT c.class_id) AS total_classes
FROM class c
JOIN student s
ON c.class_id = s.class_id
GROUP BY c.class_teacher_id;

SELECT 
    c.class_standard,
    c.class_section,
    s.student_id,
    s.student_name,
    ROW_NUMBER() OVER (PARTITION BY s.class_id ORDER BY s.student_name) AS roll_number
FROM student s
JOIN class c
ON s.class_id = c.class_id
ORDER BY c.class_standard, c.class_section, roll_number;

SELECT 
    AVG(TIMESTAMPDIFF(YEAR, t.date_of_joining, CURDATE())) AS avg_teacher_experience
FROM teacher t
JOIN  class c
ON t.teacher_id = c.class_teacher_id;

SELECT 
    s.student_id,
    s.student_name,
    c.class_standard,
    c.class_section,
    e.exam_name,

    e.total_marks
FROM student s
JOIN exam_paper m
ON s.student_id = m.student_id
JOIN exam e
ON m.exam_id = e.exam_id
JOIN class c
ON s.class_id = c.class_id
ORDER BY s.student_id, e.exam_name;