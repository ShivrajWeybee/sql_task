CREATE DATABASE sql_task_4;

create table Departments(
    Department_ID varchar(255) primary key,
    Department_Name varchar(255) not null,
    Manager_ID varchar(255) not null,
    Location_ID varchar(255) not null
);

create table Jobs(
    Job_ID varchar(255) primary key,
    Job_Title varchar(255) not null,
    Min_Salary int not null,
    Max_Salary int not null
);
create table Employee(
     Employee_ID varchar(255) primary key,
     First_Name varchar(255) not null,
     Last_Name varchar(255) not null,
     Email varchar(255) not null,
     Phone_Number varchar(255) not null,
     Hire_Date date not null,
     Job_ID varchar(255) foreign key references Jobs(Job_ID),
     Salary int not null,
     Commission_PCT varchar(255) not null,
     Manager_ID varchar(255) not null,
     Department_ID varchar(255) foreign key references Departments(Department_ID)
);


insert into Departments
values
('D1','Computer', 'M1', 'L1'),
('D2','Mechanichle', 'M2', 'L2'),
('D3','IT', 'M3', 'L3'),
('D4','chemical', 'M4', 'L4'),
('D5','nano','M5', 'L5'),
('D6','EC', 'M6', 'L6');

insert into Departments
values
('D7', 'Electric', 'M1', 'L7');

insert into Jobs
values
('J1','Developer',15000,35000),
('J2','Mechanist',10000,36000),
('J3','QA', 20000,33000),
('J4','Senior emp', 23000,40000),
('J5','Teacher',16000,36000),
('J6','Senior emp', 17000,37000);

insert into Employee
values
('E1','Rohit','Sharma','ro@gmail.com',123456789,'2019/07/08','J1',30000, 5000, 'M1','D1'),
('E2','Rahul','Lokesh','ra@gmail.com',123546855,'2019/06/08','J1',35000, 5000, 'M1','D1'),
('E3','Virat','Kohli','vk@gmail.com',123456789,'2019/07/08','J2',15000, 5000, 'M2','D2'),
('E4','Shreyas','Iyyer','si@gmail.com',123456789,'2019/07/08','J2',36000, 5000, 'M2','D2'),
('E5','Rishabh','Pant','rp@gmail.com',123456789,'2019/07/08','J3',30000, 5000, 'M3','D3'),
('E6','Hardik','Pandya','hp@gmail.com',123456789,'2019/07/08','J3',33000, 5000, 'M3','D3'),
('E7','Ravindra','Jadeja','rj@gmail.com',123456789,'2019/07/08','J4',30000, 5000, 'M4','D4'),
('E8','Shardul','Thakur','st@gmail.com',123456789,'2019/07/08','J4',40000, 5000, 'M4','D4'),
('E9','Bhuvi','Kumar','bk@gmail.com',123456789,'2019/07/08','J5',30000, 5000, 'M5','D5'),
('E10','Jasprit','Bumrah','jb@gmail.com',123456789,'2019/07/08','J5',36000, 5000, 'M5','D5'),
('E11','Yuzi','Chahal','yz@gmail.com',123456789,'2019/07/08','J6',30000, 5000, 'M6','D6'),
('E12','MD','Siraj','md@gmail.com',123456789,'2019/07/08','J6',37000, 5000, 'M6','D6');

insert into Employee
values
('E13','AB','DeVilliers','abd@gmail.com',9876543210,'2019/05/17','J7',40000,5000,'E13','D7');

-- this is task 4

---------------------------- 1 ---------------------------
---------------------------- 2 ---------------------------

---------------------------- 3 ---------------------------
sp_help Departments;

---------------------------- 4 ---------------------------
select distinct Job_ID from Employee;

---------------------------- 5 ---------------------------
select Employee_ID, Last_Name, Salary, Salary*0.155+Salary as New_Salary, Salary*0.155 as Increment
from Employee;

---------------------------- 6 ---------------------------
select Job_ID, MIN(Salary) Min_Salary, MAX(Salary) Max_Salary, SUM(Salary) Sum_Salary, AVG(Salary) Avg_Salary
from Employee group by Job_ID;

---------------------------- 7 ---------------------------
select e.Last_Name, e.Hire_Date, m.Last_Name, m.Hire_Date
from Employee e, Employee m
where e.Manager_ID=m.Employee_ID and e.Hire_Date > m.Hire_Date;

---------------------------- 8 ---------------------------
CREATE VIEW report2
as
select Count(Last_Name) as lasy_name, Department_ID from Employee
group by Department_ID;

select * from report2;

select e.Last_Name 'Employee', e.Department_ID 'Department', c.Last_Name 'Colleague'
from Employee e, Employee c
where e.Department_ID = c.Department_ID and e.Employee_ID != c.Employee_ID;

---------------------------- 9 ---------------------------
select min(Salary) Minimum, max(Salary) Maximum, sum(Salary) Sum, round(avg(Salary), 0) Average
from Employee;

---------------------------- 10 ---------------------------
select * from Employee where Salary > ANY (select Salary from Employee where Department_ID = 'D6');

---------------------------- 11 ---------------------------
select e.Last_Name, e.Salary
from Employee e
where e.Manager_ID = (select Manager_ID from Employee where First_Name = 'Virat');

---------------------------- 12 ---------------------------
insert into Jobs
values ('J7', 'ST_CLERK', 12000, 25000);

select d.Department_ID, d.Department_Name from Departments d
join Employee e on d.Department_ID=e.Department_ID
join Jobs j on j.Job_ID=e.Job_ID
where j.Job_Title not in (select Job_Title from Jobs where Job_Title = 'ST_CLERK');

select Department_ID from Employee
except 
select e.Department_ID from Employee e
join Jobs j on j.Job_ID=e.Job_ID
where j.Job_Title = 'ST_CLERK';

---------------------------- 13 ---------------------------
insert into Departments
values
(50,'GST','M5','L8'),
(80,'CA', 'M7', 'L7');

select Employee_ID, Job_ID, Department_ID from Employee
except
select Employee_ID, Job_ID, Department_ID from Employee
where Department_ID != '50' and Department_ID != '80';