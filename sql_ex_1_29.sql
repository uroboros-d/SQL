HOMEWORK sql-ex.ru

	
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
where maker = 'B';

-- 8. Найдите производителя, выпускающего ПК, но не ПК-блокноты
-- Find the makers producing PCs but not laptops

select maker from Product
where type = 'pc'
except
select maker from Product
where type = 'laptop';

Другое решение:

select distinct maker from Product
where type = 'PC' 
and maker not in
(select maker from Product where type = 'Laptop');

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

Другое решение:

select avg(speed) from PC
where model in (select model from Product where maker = 'A');

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
where Printer.price = (select min(price) from Printer where color = 'y') and color = 'y';

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
having count(model) >= 3;

-- 21. Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC.
-- Вывести: maker, максимальная цена.
-- Find out the maximum PC price for each maker having models in the PC table. 
-- Result set: maker, maximum price

select Product.maker, max(PC.price) from
Product join PC
on Product.model = PC.model
group by Product.maker;

-- 22. Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью.
-- Вывести: speed, средняя цена.
-- For each value of PC speed that exceeds 600 MHz, find out the average price of PCs with identical speeds.
-- Result set: speed, average price.

select speed, avg(price)
from pc
where speed > 600
group by speed;

-- 23. Найдите производителей, которые производили бы как ПК со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц.
-- Вывести: Maker
-- Get the makers producing both PCs having a speed of 750 MHz or higher and laptops with a speed of 750 MHz or higher.
-- Result set: maker

select Product.maker from
Product join PC
on Product.model=PC.model
where PC.speed>=750
intersect
select Product.maker from
Product join Laptop
on Product.model=Laptop.model
where Laptop.speed>=750;

-- 24. Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.
-- List the models of any type having the highest price of all products present in the database.

select model from
 (
  select model, price from PC
  union
  select model, price from Laptop
  union
  select model, price from Printer
 ) x
where price >= ALL
 (
  select max(price) from PC
  union
  select max(price) from Laptop
  union
  select max(price) from Printer
 );

-- 25. Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM.
-- Вывести: Maker
-- Find the printer makers also producing PCs with the lowest RAM capacity and the highest processor speed of all PCs having the lowest RAM capacity.
-- Result set: maker.

select distinct x.maker from
(
 select maker from Product
 where model in (
                 select model from pc
                 where speed = (
                               select max(speed) from pc
                               where ram = (select min(ram) from pc)
                               )
                 and ram = (select min(ram) from pc)
                )
) x
join
(
 select maker from Product where type = 'Printer'
) y
on x.maker = y.maker;

-- 26. Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква).
-- Вывести: одна общая средняя цена.
-- Find out the average price of PCs and laptops produced by maker A.
-- Result set: one overall average price for all items.

select avg(price) from
(
 select price from PC
 where model IN (
                 select model from Product where maker = 'A'
	        )
union all
select price from Laptop
where model IN (
                select model from Product where maker = 'A'
	       )
) x;

-- 27. Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры.
-- Вывести: maker, средний размер HD.
-- Find out the average hard disk drive capacity of PCs produced by makers who also manufacture printers.
-- Result set: maker, average HDD capacity.

select Product.maker, avg(hd)
from Product join PC
on Product.model = PC.model
where maker IN (
               select distinct maker from Product where type = 'Printer'
              )
group by Product.maker;

-- 28. Используя таблицу Product, определить количество производителей, выпускающих по одной модели.
-- Using Product table, find out the number of makers who produce only one model.

select count(*)
from (
      select maker
      from Product
      group by maker
      having count(maker) = 1
     ) x;

-- 29. В предположении, что приход и расход денег на каждом пункте приема фиксируется не чаще одного раза в день
-- [т.е. первичный ключ (пункт, дата)], написать запрос с выходными данными (пункт, дата, приход, расход).
-- Использовать таблицы Income_o и Outcome_o.

select Income_o.point, Income_o.date, sum(inc), sum(out) 
from Income_o left join  Outcome_o
on Income_o.point = Outcome_o.point
and
Income_o.date = Outcome_o.date
group by Income_o.point, Income_o.date
union
select Outcome_o.point, Outcome_o.date, sum(inc), sum(out)
from
Outcome_o left join Income_o
on Income_o.point = Outcome_o.point
and
Income_o.date = Outcome_o.date
group by Outcome_o.point, Outcome_o.date
