HOMEWORK sql-ex.ru
exercises 11-20

-- 11. Найдите среднюю скорость ПК
-- Find out the average speed of PCs

select avg(speed) from PC;

-- 12. Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
-- Find out the average speed of the laptops priced over $1000

select avg(speed) from Laptop
where price > 1000;

-- 13. Найдите среднюю скорость ПК, выпущенных производителем A
-- Find out the average speed of the PCs produced by maker A

select avg(speed) from
PC join Product
on PC.model = Product.model
where Product.maker = 'A';

-- 14. Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий
-- For the ships in the Ships table that have at least 10 guns, get the class, name, and country

select Ships.class, Ships.name, Classes.country from
Classes join Ships
on Classes.class = Ships.class
where Classes.numGuns >= 10;

-- 15. Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD
-- Get hard drive capacities that are identical for two or more PCs. Result set: hd

select hd from PC
group by hd
having count(hd) > 1;

-- 16. Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз,
-- т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM
-- Get pairs of PC models with identical speeds and the same RAM capacity. Each resulting pair should be displayed only once,
-- i.e. (i, j) but not (j, i). Result set: model with the bigger number, model with the smaller number, speed, and RAM

select distinct A.model, B.model, A.speed, A.ram
from PC as A, PC as B
where A.speed = B.speed and A.ram = B.ram
and A.model > B.model;

-- 17. Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК. Вывести: type, model, speed
-- Get the laptop models that have a speed smaller than the speed of any PC. Result set: type, model, speed

select distinct Product.type, Product.model, Laptop.speed from
Product join Laptop
on Product.model = Laptop.model
where Laptop.speed < all (select speed from PC);

-- 18. Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price
-- Find the makers of the cheapest color printers. Result set: maker, price

select distinct Product.maker, Printer.price from
Product join Printer
on Product.model = Printer.model
where Printer.price = (select min(price) from Printer
where color = 'y') and color = 'y';

-- 19. Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов.
-- Вывести: maker, средний размер экрана
-- For each maker having models in the Laptop table, find out the average screen size of the laptops he produces.
-- Result set: maker, average screen size

select Product.maker, avg(Laptop.screen) from
Product join Laptop
on Product.model = Laptop.model
group by maker;

-- 20. Найдите производителей, выпускающих по меньшей мере три различных модели ПК.
-- Вывести: Maker, число моделей ПК
-- Find the makers producing at least three distinct models of PCs.
-- Result set: maker, number of PC models

select maker, count(model) from Product
where type = 'PC'
group by maker
having count(model) >=3;

