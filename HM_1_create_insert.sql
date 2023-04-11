HOMEWORK_1

--Employees table

-- 1. create employees table with id. serial, primary key, employee_name. Varchar(50), not null

create table employees(
	id serial primary key,
	employee_name varchar (50) not null
);

-- 2. fill the table with 70 rows

insert into employees(employee_name)
values ('Anne Hall'),
('Phillip Ray'),
('Stephanie Jensen'),
('Elizabeth Lambert'),
('Mary Lopez'),
('Kimberly Miles'),
('Robert Carter'),
('Paul Rodriguez'),
('James Wallace'),
('James James'),
('Donna Burns'),
('Michelle Ray'),
('Anne Ramos'),
('Joann Clayton'),
('Ruben Johnson'),
('Robert Patton'),
('Wayne Thompson'),
('Rita Pena'),
('Melissa Long'),
('Elizabeth White'),
('Scott Burton'),
('Susan Johnson'),
('Adam Smith'),
('Regina Jenkins'),
('Tanya Watson'),
('Pearl Green'),
('Gladys Lopez'),
('Edna Smith'),
('Benjamin Cruz'),
('Andre Martinez'),
('Edward McKenzie'),
('Lillian Pierce'),
('Joyce Fisher'),
('Teresa King'),
('Paul Harris'),
('Joann Hall'),
('Carla Boone'),
('Keith Reyes'),
('David Fox'),
('Joy Reed'),
('Ronald Wallace'),
('Marvin Freeman'),
('Jean Thompson'),
('Danny Mitchell'),
('Barbara Williams'),
('Eric Hawkins'),
('Wesley Rogers'),
('Keith Ross'),
('Kathleen Rhodes'),
('Ruth Brown'),
('Robert Adams'),
('Anita Larson'),
('Rachel Blair'),
('Gilbert Nichols'),
('Bertha Barber'),
('Richard Williams'),
('Anita Mills'),
('Andrea Bowman'),
('Yvonne Patterson'),
('Cecil Bush'),
('Cheryl Jones'),
('Janice Thompson'),
('Linda Edwards'),
('James Thompson'),
('Stacy Bishop'),
('Kevin Austin'),
('John Smith'),
('Miriam Reed'),
('Carl Castillo'),
('Regina Robinson');

select * from employees;

----------------------------------------------------------------------------------

--Salary_1 table

-- 3. create salary_1 table with id serial primary key, monthly_salary Int, not null

create table salary_1(
	id serial primary key,
	monthly_salary int not null);

-- 4. fill the table with 15 rows

insert into salary_1(monthly_salary)
values  ('1000'),
('1100'),
('1200'),
('1300'),
('1400'),
('1500'),
('1600'),
('1700'),
('1800'),
('1900'),
('2000'),
('2100'),
('2200'),
('2300'),
('2400'),
('2500');

select * from salary_1;

-----------------------------------------------------------------------

--employee_salary_1 table

-- 5. create employee_salary_1 table with id serial primary key, employee_id int not null unique, salary_id int not null

create table employee_salary_1(
	id serial primary key,
	employee_id int unique not null,
	salary_id int not null
);

-- 6. fill the table with 40 rows (in 10 rows out of 40 insert non-existent employee_id)

insert into employee_salary_1(employee_id, salary_id)
values	(1,1),
		(2,2),
		(3,3),
		(4,4),
		(5,5),
		(6,6),
		(7,7),
		(8,8),
		(9,9),
		(10,10),
		(11,11),
		(12,12),
		(13,13),
		(14,14),
		(15,15),
		(16,1),
		(17,2),
		(18,3),
		(19,4),
		(20,5),
		(21,6),
		(22,7),
		(23,8),
		(24,9),
		(25,10),
		(26,11),
		(27,12),
		(28,13),
		(29,14),
		(30,15),
		(71,1),
		(72,2),
		(73,3),
		(74,4),
		(75,5),
		(76,6),
		(77,7),
		(78,8),
		(79,9),
		(80,10);
		
select * from employee_salary_1;

---------------------------------------------------------------------------

--roles table

-- 7. create roles_1 table with id serial primary key, role_name int, not null, unique

create table roles_1(
	id serial primary key,
	role_name int not null unique
);

-- 8. change type of column role_name from int to varchar

alter table roles_1 alter column role_name type varchar(30);

-- 9. fill the table with 20 rows

insert into roles_1(role_name)
values ('Junior Python developer'),
('Middle Python developer'),
('Senior Python developer'),
('Junior Java developer'),
('Middle Java developer'),
('Senior Java developer'),
('Junior JavaScript developer'),
('Middle JavaScript developer'),
('Senior JavaScript developer'),
('Junior Manual QA engineer'),
('Middle Manual QA engineer'),
('Senior Manual QA engineer'),
('Project Manager'),
('Designer'),
('HR'),
('CEO'),
('Sales manager'),
('Junior Automation QA engineer'),
('Middle Automation QA engineer'),
('Senior Automation QA engineer');

select * from roles_1;

---------------------------------------------------------------------------------

--roles_employee

-- 10. create roles_employee table with id Serial  primary key, employee_id Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- role_id. Int, not null (внешний ключ для таблицы roles, поле id)

create table roles_employee(
	id serial primary key,
	employee_id int not null unique,
	role_id int not null,
	foreign key (employee_id)
		references employees(id),
	foreign key (role_id)
		references roles_1(id)
);

drop table roles_employee;

-- 11. fill the table with 40 rows

insert into roles_employee(employee_id, role_id)
values (1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11),
(12,12),
(13,13),
(14,14),
(15,15),
(16,16),
(17,17),
(18,18),
(19,19),
(20,20),
(21,1),
(22,2),
(23,3),
(24,4),
(25,5),
(26,6),
(27,7),
(28,8),
(29,9),
(30,10),
(31,11),
(32,12),
(33,13),
(34,14),
(35,15),
(36,16),
(37,17),
(38,18),
(39,19),
(40,20);

select * from roles_employee;
