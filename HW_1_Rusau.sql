HOMEWORK_1_RUSAU (MySQL)

show databases;
use hogwarts;

-- 1. Выведите имя, фамилию, патронуса всех персонажей, у которых есть patronus и он известен
-- select fname, lname, patronus of characters who have a patronus and they is known

select fname, lname, patronus
from characters
where patronus <> 'Unknown';

-- 2. Выведите фамилию персонажей, у которых последняя буква в фамилии ‘e’
-- select fname of characters whose lname ends with the letter 'e'

select lname
from characters
where lname like '%e';

-- 3. Посчитайте общий возраст всех персонажей
-- count the age of all characters

select sum(age) from characters;

-- 4. Выведите имя, фамилию и возраст персонажей по убыванию их возраста
-- select fname, lname and age of all characters in descending order of their age

select fname, lname, age
from characters
order by age desc;

-- 5. Выведите имя персонажа и возраст, у которых последний находится в диапазоне от 50 до 100 лет
-- select fname, age of characters whose age are in [50-100]

select fname, age
from characters
where age between 50 and 100;

-- 6. Выведите возраст всех персонажей так, чтобы среди них не было тех, у кого он одинаковый
-- select unique ages of all cgaracters

select distinct age from characters;

-- 7. Выведите всю информацию о персонажах, у которых faculty = Gryffindor и чей возраст больше 30 лет
-- select everything about characters whose faculty = Gryffindor and age > 30

select *
from characters
where faculty = 'Gryffindor' and age > 30;

-- 8. Выведите названия первых трех факультетов из таблицы, так чтобы факультеты не повторялись
-- select names of the first three faculties, the names must not be repeated

select distinct faculty
from characters limit 3; 

-- 9. Выведите имена всех персонажей, у которых имя начинается с ‘H’ и состоит из 5 букв, 
-- или чье имя начинается с ‘L’
-- select names of characters whose name starts with H and consist of 5 letters
-- or whose name starts with L

select fname
from characters
where fname like 'L%' or ( fname like 'H%' and length(fname) = 5);

-- 10. Посчитайте средний возраст всех персонажей
-- count the average age of all characters

select avg(age) from characters;

-- 11. Удалите персонажа с ID = 11
-- delete the character with id = 11

delete from characters
where char_id = 10;

-- 12. Выведите фамилию всех персонажей, которые содержат в ней букву ‘a’
-- select lnames containing 'a' 

select lname
from characters
where lname like '%a%';

-- 13. Используйте псевдоним для того, чтобы временно заменить название
-- столбца fname на Half-Blood Prince для реального принца-полукровки
-- use an alias to temporarily rename the column name 'fname' to
-- Half-Blood Prince for the real half-blood prince

select fname as 'Half-Blood Prince', lname
from characters
where fname = 'Harry' and lname = 'Potter';

-- 14. Выведите id и имена всех патронусов в алфавитном порядки, при условии что они есть или известны
-- select id and name of patronuses in alphabetical order if they exist or are known

select book_id, patronus
from characters
where patronus <> 'Unknown'
order by patronus asc;

-- 15. Используя оператор IN, выведите имя и фамилию тех персонажей, у которых фамилия Crabbe, Granger или Diggory


select fname, lname
from characters
where lname in ('Crabbe', 'Granger', 'Diggory');

-- 16. Выведите минимальный возраст персонажа

select min(age) from characters;

-- 17. Используя оператор UNION выберите имена из таблицы characters и названия книг из таблицы library

select fname from characters
union
select book_name from library;

select * from library;

-- 18. Используя оператор HAVING посчитайте количество персонажей на каждом факультете,
-- оставив только те факультеты, где количество студентов больше 1

select count(char_id), faculty
from characters
group by faculty
having count(char_id) > 1;

-- 19. Используя оператор CASE опишите следующую логику:
/*
Выведите имя и фамилию персонажа, а также следующее текстовое сообщение:
Если факультет Gryffindor, то в консоли должно вывестись Godric
Если факультет Slytherin, то в консоли должно вывестись Salazar
Если факультет Ravenclaw, то в консоли должно вывестись Rowena
Если факультет Hufflepuff, то в консоли должно вывестись Helga
Если другая информация, то выводится Muggle
Для сообщения используйте псевдоним Founders
*/

select fname, lname,
case
	when faculty = 'Gryffindor' then 'Godric'
    when faculty = 'Slytherin' then 'Salazar'
    when faculty = 'Ravenclaw' then 'Rowena'
    when faculty = 'Hufflepuff' then 'Helga'
	else 'Muggle'
end as Founders
from characters;

-- 20. Используя регулярное выражение найдите фамилии персонажей,
-- которые не начинаются с букв H, L или S и выведите их

select lname
from characters
where lname not regexp '^[hls]';

select * from characters;
