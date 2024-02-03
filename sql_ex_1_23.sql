HOMEWORK sql-ex.ru
exercises 1-23

-- 1. Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол.
-- Find the model number, speed and hard drive capacity for all the PCs with prices below $500.
-- Result set: model, speed, hd

select model, speed, hd from PC
where price < 500;

-- 2. Найдите производителей принтеров
-- List all printer makers. Result set: maker

select distinct maker from Product
where type = 'printer';

-- 3. Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
-- Find the model number, RAM and screen size of the laptops with prices over $1000

select model, ram, screen from Laptop
where price > 1000;

-- 4. Найдите все записи таблицы Printer для цветных принтеров
-- Find all records from the Printer table containing data about color printers

select * from Printer
where color = 'y';

-- 5. Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол
-- Find the model number, speed and hard drive capacity of PCs cheaper than $600 having a 12x or a 24x CD drive

select model, speed, hd from PC
where cd in ('12x', '24x') and price < 600;

-- 6. Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов
-- For each maker producing laptops with a hard drive capacity of 10 Gb or higher, find the speed of such laptops. Result set: maker, speed

select distinct Product.maker, Laptop.speed from
Product join Laptop
on Product.model = Laptop.model
where Laptop.hd >= 10;

-- 7. Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя 'B' (латинская буква)
-- Get the models and prices for all commercially available products (of any type) produced by maker B

select model, price from PC
where model in (select model from Product
                where maker = 'B')
union
select model, price from Laptop
where model in (select model from Product
                where maker = 'B')
union
select model, price from Printer
where model in (select model from Product
                where maker = 'B');

Другое решение:

select Product.model, PC.price
from Product join PC on Product.model = PC.model
where maker = 'B'
union
select Product.model, Laptop.price
from Product join Laptop on Product.model = Laptop.model
where maker = 'B'
union
select Product.model, Printer.price
from Product join Printer on Product.model = Printer.model
where maker = 'B'

-- 8. Найдите производителя, выпускающего ПК, но не ПК-блокноты
-- Find the makers producing PCs but not laptops

select maker from Product
where type = 'pc'
except
select maker from Product
where type = 'laptop';

-- 9. Найдите производителей ПК с процессором не менее 450 Мгц
-- Find the makers of PCs with a processor speed of 450 MHz or more. Result set: maker

select distinct maker from Product
where model in (select model from PC
	        where speed >= 450);

-- 10. Найдите модели принтеров, имеющих самую высокую цену
-- Find the printer models having the highest price. Result set: model, price

select model, price from printer
where price = ( select max(price) from printer);

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

-- 21. Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC.
-- Вывести: maker, максимальная цена.
-- Find out the maximum PC price for each maker having models in the PC table. 
-- Result set: maker, maximum price

select Product.maker, max(PC.price) from
Product join PC
on Product.model = PC.model
group by maker

-- 22. Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью.
-- Вывести: speed, средняя цена.
-- For each value of PC speed that exceeds 600 MHz, find out the average price of PCs with identical speeds.
-- Result set: speed, average price.

Select speed, avg(price) from PC
group by speed
having speed > 600

-- 23. Найдите производителей, которые производили бы как ПК со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц.
-- Вывести: Maker
-- Get the makers producing both PCs having a speed of 750 MHz or higher and laptops with a speed of 750 MHz or higher.
-- Result set: maker

Select Product.maker from
Product join PC
on Product.model=PC.model
where PC.speed>=750
intersect
select Product.maker from
Product join Laptop
on Product.model=Laptop.model
where Laptop.speed>=750
