use hogwarts;

-- 1. Выведите имя, фамилию персонажей и название книги,
-- которая на них числится

select characters.fname, characters.lname, library.book_name from
characters join library
on characters.char_id = library.char_id;

-- 2. Выведите имя, фамилию персонажей и название книги,
-- вне зависимости от того, есть ли у них книги или нет

select characters.fname, characters.lname, library.book_name from
characters right join library
on characters.char_id = library.char_id;

-- 3. Выведите название книги и имя патронуса, вне зависимости от того,
-- есть ли информация о держателе книги в таблице или нет

select characters.patronus, library.book_name from
characters right join library
on characters.char_id = library.char_id;

-- 4. Выведите имя, фамилию, возраст персонажей и название книги, которая на них числится,
--  при условии, что все владельцы книг должны быть старше 15 лет

select characters.fname, characters.lname, characters.age, library.book_name from
characters join library
on characters.char_id = library.char_id
where characters.age > 15;

-- 5. Выведите имя персонажа, название книги, дату выдачи и дату завершения,
--  при условии, что он младше 15 лет и его патронус неизвестен

select characters.fname, library.book_name, library.start_date, library.end_date from
characters join library
on characters.char_id = library.char_id
where characters.age < 15 and characters.patronus = 'unknown';

-- 6. Используя вложенный запрос, выведите количество книг,
-- у которых end_date больше, чем end_date у Hermione

select count(book_id) from library
where end_date > ( select library.end_date from
					library join characters
                    on characters.char_id = library.char_id
                    where characters.fname = 'Hermione');
                    
-- 7. С помощью вложенного запроса выведите имена всех патронусов,
-- у которых владельцы старше возраста персонажа, у которого патронус Unknown

select patronus from characters
where age > ( select age from characters
				where patronus = 'Unknown');

select * from characters;
select * from library;

