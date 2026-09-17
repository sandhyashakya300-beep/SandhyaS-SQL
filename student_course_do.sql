#STUDENT COURSE MANGEMENT SYSTEM ------

CREATE DATABASE student_course_do;

use student_course_do;

create table students_info(
student_id int primary key,
student_name varchar(243) not null,
email_id varchar(456) unique not null,
phone_number bigint unique,
course_name varchar(244),
date_of_birth DATE,
registration_date datetime );

show  tables;

select * from students_info;

INSERT INTO students_info VALUES
(100,"Deepak kumar","deep@gmail.com",9349348763,"Artifical Intelligencee",'2005-11-11','2025-5-7 03:45:59'),
(101, "Bhuvnesh kumar", "bhuvi@gmail.com",9394355,"Machine Learning",'2004-10-10','2024-3-5 05:33:44'),
(102,"Minakashi shakya","mina@gmail.com",93843343,"Information Technology", '2007-2-4','2025-3-5 03:34:45'),
(103,"Payal shakya","pal@gmail.com",934353534,"Computer Science",'2006-5-30','2024-4-2 07:12:42'),
(104,"Amit kumar","ami@gmail.com",94213243,"Data Science",'1990-11-1','2009-4-6 02:23:13'),
(105, 'Aarav Sharma', 'aarav.sharma@email.com', 9876543210, 'Computer Science', '2004-05-12', '2026-01-10 09:30:00'),
(106, 'Diya Patel', 'diya.patel@email.com', 9876543211, 'Data Science', '2003-11-22', '2026-01-10 10:15:00'),
(107, 'Arjun Singh', 'arjun.singh@email.com', 9876543212, 'Artificial Intelligence', '2004-01-15', '2026-01-11 11:00:00'),
(108, 'Ananya Iyer', 'ananya.iyer@email.com', 9876543213, 'Computer Science', '2005-03-30', '2026-01-11 14:20:00'),
(109, 'Vihaan Gupta', 'vihaan.gupta@email.com', 9876543214, 'Information Technology', '2004-08-18', '2026-01-12 09:00:00'),
(110, 'Ishaan Reddy', 'ishaan.reddy@email.com', 9876543215, 'Data Science', '2003-07-05', '2026-01-12 15:45:00'),
(111, 'Aadhya Rao', 'aadhya.rao@email.com', 9876543216, 'Artificial Intelligence', '2004-12-25', '2026-01-13 10:30:00'),
(112, 'Kabir Verma', 'kabir.verma@email.com', 9876543217, 'Computer Science', '2004-02-14', '2026-01-13 11:15:00'),
(113, 'Meera Nair', 'meera.nair@email.com', 9876543218, 'Information Technology', '2005-06-20', '2026-01-14 13:00:00'),
(114, 'Sai Kumar', 'sai.kumar@email.com', 9876543219, 'Data Science', '2003-09-09', '2026-01-14 16:10:00'),
(115, 'Vivaan Joshi', 'vivaan.joshi@email.com', 9876543220, 'Computer Science', '2004-04-04', '2026-01-15 09:45:00'),
(116, 'Reyansh Mehta', 'reyansh.mehta@email.com', 9876543221, 'Artificial Intelligence', '2004-10-10', '2026-01-15 11:50:00'),
(117, 'Aanya Mishra', 'aanya.mishra@email.com', 9876543222, 'Information Technology', '2005-01-17', '2026-01-16 10:00:00'),
(118, 'Krishna Prasad', 'krishna.prasad@email.com', 9876543223, 'Data Science', '2003-05-28', '2026-01-16 14:35:00'),
(119, 'Pranav Shah', 'pranav.shah@email.com', 9876543224, 'Computer Science', '2004-07-19', '2026-01-17 09:15:00'),
(120, 'Sanya Malhotra', 'sanya.malhotra@email.com', 9876543227, 'Data Science', '2003-12-12', '2026-01-18 15:00:00');

select * from students_info;
