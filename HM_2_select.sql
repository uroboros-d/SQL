HOMEWORK_2

CREATE TABLE public.students (
	id serial4 NOT NULL,
	"name" varchar(50) NOT NULL,
	email varchar(50) NOT NULL,
	"password" varchar(50) NOT NULL,
	created_on timestamp NOT NULL,
	CONSTRAINT students_email_key UNIQUE (email),
	CONSTRAINT students_pkey PRIMARY KEY (id)
);

-- 1. select all fields of the table

select * from students;

-- 2. select all students

select name
from students;

-- 3. select all id

select id 
from students;

-- 4. select all names

select name
from students;

-- 5. select all emails

select email
from students;

-- 6. select all names and emails

select name, email
from students;

-- 7. select id, names, emails and creation dates

select id, name, email, created_on
from students;

-- 8. select users with password 12333

select * 
from students 
where password = '12333';

-- 9. select users with creation date 2021-03-26 00:00:00

select * 
from students
where created_on = '2021-03-26 00:00:00';

-- 10. select users who have the word "Anna" in their name

select * 
from students 
where name like '%Anna%';

-- 11. select users who have 8 at the end of the name

select *
from students
where name like '%8';

-- 12. select users who have the letter "a" in their name

select *
from students
where name like '%a%';

-- 13. select users with creation date 2021-07-12 00:00:00

select *
from students 
where created_on = '2021-07-12 00:00:00';

-- 14. select users with creation date 2021-07-12 00:00:00 and password 1m313

select *
from students 
where created_on = '2021-07-12 00:00:00' and password = '1m313';

-- 15. select users with creation date 2021-07-12 00:00:00 and the word "Andrey" in their name

select *
from students 
where created_on = '2021-07-12 00:00:00' and name like '%Andrey%';

-- 16. select users with creation date 2021-07-12 00:00:00 and 8 in their name

select *
from students 
where created_on = '2021-07-12 00:00:00' and name like '%8%';

-- 17. select users with id = 110

select *
from students 
where id = 110;

-- 18. select users with id = 153

select *
from students 
where id = 153;

-- 19. select users with id > 140

select *
from students 
where id > 140;

-- 20. select users with id < 130

select *
from students 
where id < 130;

-- 21. select users with id < 127 or id > 188

select *
from students 
where id < 127 or id > 188;

-- 22. select users with id <= 137

select *
from students 
where id <= 137;

-- 23. select users with id >= 137

select *
from students 
where id >=137;

-- 24. select users with id > 180 and id < 190

select *
from students 
where id > 180 and id < 190;

-- 25. select users with id between 180 and 190

select *
from students 
where id between 180 and 190;

-- 26. select users with passwords equal 12333, 1m313, 123313

select *
from students 
where password in ('12333', '1m313', '123313');

-- 27. select users with created_on equal 2020-10-03 00:00:00, 2021-05-19 00:00:00, 2021-03-26 00:00:00

select *
from students 
where created_on in ('2020-10-03 00:00:00', '2021-05-19 00:00:00', '2021-03-26 00:00:00');

-- 28. select the min id
select min (id) as min_id
from students;

-- 29. select the max id

select max (id) as max_id
from students;

-- 30. select the number of users

select count(name)
from students;

-- 31. select id, name, created_on fields. Sort by creation date ascending

select id, name, created_on
from students
order by created_on asc;

-- 32. select id, name, created_on fields. Sort by creation date descending

select id, name, created_on
from students 
order by created_on desc;
