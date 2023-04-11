HOMEWORK_3


-- 1. select all employees whose salaries are in the database, with their salaries

select Employees.employee_name, Salary_1.monthly_salary 
from Employees join Employee_salary_1
on Employees.id = Employee_salary_1.employee_id
join Salary_1
on Salary_1.id = Employee_salary_1.salary_id;


-- 2. select all employees whose salaries are less than 2000

select Employees.employee_name, Salary_1.monthly_salary
from Employees join employee_salary_1
on Employees.id = Employee_salary_1.employee_id 
join Salary_1 
on Salary_1.id = Employee_salary_1.salary_id
where Salary_1.monthly_salary < 2000;


-- 3. select all salaries which no one gets

select monthly_salary from Salary_1 
where Salary_1.id not in (select salary_id from Employee_salary_1);


-- 4. select all salaries < 2000 which no one gets ()

select monthly_salary from Salary_1 
where monthly_salary < 2000 and Salary_1.id not in (select salary_id from Employee_salary_1);


-- 5. select all employees who haven't got their salary

select employee_name from Employees 
where Employees.id not in (select employee_id from Employee_salary_1);


-- 6. select all employees with their positions

select Employees.employee_name, Roles_1.role_name
from Employees join Roles_employee
on Employees.id = Roles_employee.employee_id
join Roles_1
on Roles_1.id = Roles_employee.role_id;


-- 7. select names and positions of Java developers

select Employees.employee_name, Roles_1.role_name 
from Employees join Roles_employee
on Employees.id = Roles_employee.employee_id
join Roles_1
on Roles_1.id = Roles_employee.role_id
where Roles_1.role_name like '%Java developer';


-- 8. select names and positions of Python developers

select Employees.employee_name, Roles_1.role_name 
from Employees join Roles_employee
on Employees.id = Roles_employee.employee_id
join Roles_1
on Roles_1.id = Roles_employee.role_id
where Roles_1.role_name like '%Python%';


-- 9. select names and positions of QA engineers

select Employees.employee_name, Roles_1.role_name 
from Employees join Roles_employee
on Employees.id = Roles_employee.employee_id
join Roles_1
on Roles_1.id = Roles_employee.role_id
where Roles_1.role_name like '%QA%';


-- 10. select names and positions of Manual QA engineers

select Employees.employee_name, Roles_1.role_name 
from Employees join Roles_employee
on Employees.id = Roles_employee.employee_id
join Roles_1
on Roles_1.id = Roles_employee.role_id
where Roles_1.role_name like '%Manual QA%';


-- 11. select names and positions of Automation QA engineers

select Employees.employee_name, Roles_1.role_name 
from Employees join Roles_employee
on Employees.id = Roles_employee.employee_id
join Roles_1
on Roles_1.id = Roles_employee.role_id
where Roles_1.role_name like '%Automation%engineer%';


-- 12. select names and salaries of Juniors

select Employees.employee_name, Salary_1.monthly_salary, Roles_1.role_name
from Employee_salary_1
join Employees
on Employee_salary_1.employee_id = Employees.id 
join Salary_1
on Salary_1.id = Employee_salary_1.salary_id
join Roles_employee
on Roles_employee.employee_id = Employees.id
join Roles_1
on Roles_1.id = Roles_employee.role_id
where Roles_1.role_name like 'Junior%'


-- 13. select names and salaries of Middles

select Employees.employee_name, Salary_1.monthly_salary, Roles_1.role_name
from Employee_salary_1
join Employees
on Employee_salary_1.employee_id = Employees.id
join Salary_1 
on Employee_salary_1.salary_id = Salary_1.id
join Roles_employee 
on Roles_employee.employee_id = Employees.id 
join Roles_1 
on Roles_1.id = Roles_employee.role_id
where Roles_1.role_name like 'Middle%'


-- 14. select names and salaries of Seniors

select Employees.employee_name, Salary_1.monthly_salary, Roles_1.role_name
from employees 
join Employee_salary_1 
on Employees.id = Employee_salary_1.employee_id 
join Salary_1 
on Salary_1.id = Employee_salary_1.salary_id 
join Roles_employee 
on Roles_employee.employee_id = Employee_salary_1.employee_id
join Roles_1 
on Roles_1.id = Roles_employee.role_id 
where Roles_1.role_name like 'Senior%';


-- 15. select salaries of Java developers

select Salary_1.monthly_salary, Roles_1.role_name
from employees 
join Employee_salary_1 
on Employees.id = Employee_salary_1.employee_id 
join Salary_1 
on Salary_1.id = Employee_salary_1.salary_id 
join Roles_employee 
on Roles_employee.employee_id = Employee_salary_1.employee_id
join Roles_1 
on Roles_1.id = Roles_employee.role_id 
where Roles_1.role_name like '%Java developer';


-- 16. select salaries of Python developers

select Salary_1.monthly_salary, Roles_1.role_name
from employees 
join Employee_salary_1 
on Employees.id = Employee_salary_1.employee_id 
join Salary_1 
on Salary_1.id = Employee_salary_1.salary_id 
join Roles_employee 
on Roles_employee.employee_id = Employee_salary_1.employee_id
join Roles_1 
on Roles_1.id = Roles_employee.role_id 
where Roles_1.role_name like '%Python%';


-- 17. select names and salaries of Junior Python developers

select Employees.employee_name, Salary_1.monthly_salary, Roles_1.role_name
from employees 
join Employee_salary_1 
on Employees.id = Employee_salary_1.employee_id 
join Salary_1 
on Salary_1.id = Employee_salary_1.salary_id 
join Roles_employee 
on Roles_employee.employee_id = Employee_salary_1.employee_id
join Roles_1 
on Roles_1.id = Roles_employee.role_id 
where Roles_1.role_name like 'Junior Python%';


-- 18. select names and salaries of Middle Javascript developers

select Employees.employee_name, Salary_1.monthly_salary, Roles_1.role_name
from employees 
join Employee_salary_1 
on Employees.id = Employee_salary_1.employee_id 
join Salary_1 
on Salary_1.id = Employee_salary_1.salary_id 
join Roles_employee 
on Roles_employee.employee_id = Employee_salary_1.employee_id
join Roles_1 
on Roles_1.id = Roles_employee.role_id 
where Roles_1.role_name like 'Middle JavaScript%';


-- 19. select names and salaries of Senior Java developers

select Employees.employee_name, Salary_1.monthly_salary, Roles_1.role_name
from employees 
join Employee_salary_1 
on Employees.id = Employee_salary_1.employee_id 
join Salary_1 
on Salary_1.id = Employee_salary_1.salary_id 
join Roles_employee 
on Roles_employee.employee_id = Employee_salary_1.employee_id
join Roles_1 
on Roles_1.id = Roles_employee.role_id 
where Roles_1.role_name like 'Senior Java developer';


-- 20. select salaries of Junior QA engineers

select Salary_1.monthly_salary, Roles_1.role_name
from employees 
join Employee_salary_1 
on Employees.id = Employee_salary_1.employee_id 
join Salary_1 
on Salary_1.id = Employee_salary_1.salary_id 
join Roles_employee 
on Roles_employee.employee_id = Employee_salary_1.employee_id
join Roles_1 
on Roles_1.id = Roles_employee.role_id 
where Roles_1.role_name like 'Junior%QA%';


-- 21. select the average salary of all Juniors

select avg(Salary_1.monthly_salary) as avg_salary_juniors
from Employee_salary_1
join Salary_1
on Employee_salary_1.salary_id = Salary_1.id 
join Roles_employee
on Employee_salary_1.employee_id = Roles_employee.employee_id 
join Roles_1
on Roles_employee.role_id = Roles_1.id 
where Roles_1.role_name like 'Junior%'


-- 22. select the sum of salaries of JavaScript developers

select sum(Salary_1.monthly_salary) as sum_salaries_JS_dev
from Employee_salary_1
join Salary_1
on Employee_salary_1.salary_id = Salary_1.id 
join Roles_employee
on Employee_salary_1.employee_id = Roles_employee.employee_id 
join Roles_1
on Roles_employee.role_id = Roles_1.id 
where Roles_1.role_name like '%JavaScript developer'


-- 23. select min salary of QA engineers

select min(Salary_1.monthly_salary) as min_salary_QA
from Employee_salary_1 
join Salary_1 
on Employee_salary_1.salary_id = Salary_1.id
join Roles_employee
on Roles_employee.employee_id = Employee_salary_1.employee_id
join Roles_1
on Roles_1.id = Roles_employee.role_id
where Roles_1.role_name like '%QA%'


-- 24. select max salary of QA engineers

select max(Salary_1.monthly_salary) as max_salary_QA
from Employee_salary_1 
join Salary_1 
on Employee_salary_1.salary_id = Salary_1.id
join Roles_employee
on Roles_employee.employee_id = Employee_salary_1.employee_id
join Roles_1
on Roles_1.id = Roles_employee.role_id
where Roles_1.role_name like '%QA%'


-- 25. select the number of QA engineers

select count(Roles_1.role_name) as count_QA
from Employee_salary_1 
join Roles_employee
on Roles_employee.employee_id = Employee_salary_1.employee_id
join Roles_1
on Roles_1.id = Roles_employee.role_id
where Roles_1.role_name like '%QA%'


-- 26. select the number of Middle developers

select count(Roles_1.role_name) as count_Middle
from Employee_salary_1 
join Roles_employee
on Roles_employee.employee_id = Employee_salary_1.employee_id
join Roles_1
on Roles_1.id = Roles_employee.role_id
where Roles_1.role_name like 'Middle%'


-- 27. select the number of developers

select count(Roles_1.role_name) as count_dev
from Employee_salary_1 
join Roles_employee
on Roles_employee.employee_id = Employee_salary_1.employee_id
join Roles_1
on Roles_1.id = Roles_employee.role_id
where Roles_1.role_name like '%developer'


-- 28. select the sum of salaries of all developers

select sum(Salary_1.monthly_salary) as sum_salaries_dev
from Employee_salary_1
join Salary_1
on Employee_salary_1.salary_id = Salary_1.id 
join Roles_employee
on Employee_salary_1.employee_id = Roles_employee.employee_id 
join Roles_1
on Roles_employee.role_id = Roles_1.id 
where Roles_1.role_name like '%developer'


-- 29. select names, positions and salaries of all employees in ascending order

select Employees.employee_name, Roles_1.role_name, Salary_1.monthly_salary
from Employee_salary_1
join Employees
on Employee_salary_1.employee_id = Employees.id 
join Salary_1
on Salary_1.id = Employee_salary_1.salary_id
join Roles_employee
on Roles_employee.employee_id = Employees.id
join Roles_1
on Roles_1.id = Roles_employee.role_id
order by Salary_1.monthly_salary asc


-- 30. select names, positions and salaries of all employees with salaries in (1700-2300) in ascending order

select Employees.employee_name, Roles_1.role_name, Salary_1.monthly_salary
from Employee_salary_1
join Employees
on Employee_salary_1.employee_id = Employees.id 
join Salary_1
on Salary_1.id = Employee_salary_1.salary_id
join Roles_employee
on Roles_employee.employee_id = Employees.id
join Roles_1
on Roles_1.id = Roles_employee.role_id
where Salary_1.monthly_salary between 1700 and 2300
order by Salary_1.monthly_salary asc


-- 31. select names, positions and salaries of all employees with salaries < 2300 in ascending order

select Employees.employee_name, Roles_1.role_name, Salary_1.monthly_salary
from Employee_salary_1
join Employees
on Employee_salary_1.employee_id = Employees.id 
join Salary_1
on Salary_1.id = Employee_salary_1.salary_id
join Roles_employee
on Roles_employee.employee_id = Employees.id
join Roles_1
on Roles_1.id = Roles_employee.role_id
where Salary_1.monthly_salary < 2300
order by Salary_1.monthly_salary asc


-- 32. select names, positions and salaries of all employees with salaries in (1100, 1500, 2000) in ascending order

select Employees.employee_name, Roles_1.role_name, Salary_1.monthly_salary
from Employee_salary_1
join Employees
on Employee_salary_1.employee_id = Employees.id 
join Salary_1
on Salary_1.id = Employee_salary_1.salary_id
join Roles_employee
on Roles_employee.employee_id = Employees.id
join Roles_1
on Roles_1.id = Roles_employee.role_id
where Salary_1.monthly_salary in (1100, 1500, 2000)
order by Salary_1.monthly_salary asc
