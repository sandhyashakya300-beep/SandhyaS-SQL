use sandhya ;
# class work

create table faculty(
    f_department varchar(232),
    f_id int  primary key ,
    f_name varchar(344),
    f_experience int,
    f_salary int 

);

insert into faculty(f_department,f_id,f_name,f_experience,f_salary) values
('Computer Science',101,'Dr.Sachin',10,90000),
('Information Technology',102,'Dr.Ram',8,80000),
('Electronic',103,'Dr.Rajan',7,78000),
('Artifical Intelligence', 104 , 'Mr.Roshan',9,89000),
('BBA', 105,'Mr.Subh',7,34000),
('Computer Science', 106, 'Mr.Shyam', 8, 95000),
('Mathematics', 107, 'Miss Sana', 15, 120000),
('BCA', 108, 'Miss Priya', 4, 78000),
('BCA', 109, 'Mr.Rahul', 12, 85000),
('MBA', 110, 'Me.David', 2, 65000);

UPDATE faculty SET f_salary = 87000 WHERE f_id = 105;
SELECT* from faculty ;

ALTER table faculty  ADD Std_id int ;
SELECT* from faculty ;

select* from faculty where f_id = 106;

Select count(*) from faculty;

Select * from faculty
where f_salary >80000;

