use hogwarts;

-- 1. Выведите имя, фамилию персонажей и название книги, которая на них числится
-- select fnames, lnames and book_names of all characters 

select characters.fname, characters.lname, library.book_name from
characters join library
on characters.char_id = library.char_id;

-- 2. Выведите имя, фамилию персонажей и название книги, вне зависимости от того, есть ли у них книги или нет
-- select fnames, lnames and book_names of characters when they have books or not

select characters.fname, characters.lname, library.book_name from
characters right join library
on characters.char_id = library.char_id;

-- 3. Выведите название книги и имя патронуса, вне зависимости от того, есть ли информация о держателе книги в таблице или нет
-- select book_name and patronus of all characters

select characters.patronus, library.book_name from
characters right join library
on characters.char_id = library.char_id;

-- 4. Выведите имя, фамилию, возраст персонажей и название книги, которая на них числится, при условии, что все владельцы книг должны быть старше 15 лет
-- select fname, lname, age and book_name of characters who are over 15 years old

select characters.fname, characters.lname, characters.age, library.book_name from
characters join library
on characters.char_id = library.char_id
where characters.age > 15;

-- 5. Выведите имя персонажа, название книги, дату выдачи и дату завершения, при условии, что он младше 15 лет и его патронус неизвестен
-- select fname, book_name, start_date and end_date of characters who are under 15 years old and whose patronus is Unknown

select characters.fname, library.book_name, library.start_date, library.end_date from
characters join library
on characters.char_id = library.char_id
where characters.age < 15 and characters.patronus = 'Unknown';

-- 6. Используя вложенный запрос, выведите количество книг, у которых end_date больше, чем end_date у Hermione
-- using nested query select the number of books with end_date > end_date of Hermione

select count(book_id) from library
where end_date > ( select library.end_date from
					library join characters
                    on characters.char_id = library.char_id
                    where characters.fname = 'Hermione');
                    
-- 7. С помощью вложенного запроса выведите имена всех патронусов, у которых владельцы старше возраста персонажа, у которого патронус Unknown
-- using nested query select patronuses of characters which age > the age of a character whose patronus is Unknown

select patronus from characters
where age > ( select age from characters
				where patronus = 'Unknown');
